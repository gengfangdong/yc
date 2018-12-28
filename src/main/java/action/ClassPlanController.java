/**
 * 
 */
package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import entity.ClassPlan;
import entity.ClassPlanVo;
import entity.Course;
import entity.DatatablesViewPage;
import entity.LayuiDataTable;
import entity.About;
import service.AboutService;
import service.ClassPlanService;
import service.CourseService;
import util.FileUtil;
import util.StringUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/ClassPlan")
public class ClassPlanController {
	
	@Autowired
	private ClassPlanService classPlanService;
	
	
	
	
	/**
	 * 新增课程方案
	 * @param ClassPlan_name
	 * @param ClassPlan_context
	 * @return
	 */
	@RequestMapping(value="/saveClassPlan",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertCourse(String ClassPlan_name,String ClassPlan_context){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		ClassPlan classPlan = new ClassPlan();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		
		classPlan.setClassplan_context(ClassPlan_context);
		classPlan.setClassplan_name(ClassPlan_name);
		classPlan.setCreater("admin");
		classPlan.setCreatetime(About_Createtime);
		classPlan.setIsdelete("0");
		classPlan.setClassplan_id(UUIDUtil.getUUid("clas"));
		classPlanService.insertClassPlan(classPlan);
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	
	/**
	 * 返回课程方案列表
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlist")
	@ResponseBody
	public DatatablesViewPage<ClassPlan> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<ClassPlan> datatablesViewPage = new DatatablesViewPage<ClassPlan>();
		datatablesViewPage = classPlanService.getlistBypage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 返回课程方案列表  不分页 
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistnopage")
	@ResponseBody
	public LayuiDataTable<ClassPlan> GetlistNoPage(@RequestParam("page")int start,@RequestParam("limit")int length){
		//DataTables  返回实例
		LayuiDataTable<ClassPlan> cDataTable = new LayuiDataTable<ClassPlan>();
		cDataTable = classPlanService.getListNoPage();
		cDataTable.setCode(0);
		cDataTable.setMsg("");
		return cDataTable;
	}
	
	/**
	 * 返回课程方案列表  不分页  定制id
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistnopage/{constom_id}")
	@ResponseBody
	public LayuiDataTable<ClassPlanVo> GetlistNoPage(@RequestParam("page")int start,@RequestParam("limit")int length,@PathVariable String constom_id ){
		//DataTables  返回实例
		LayuiDataTable<ClassPlanVo> cDataTable = new LayuiDataTable<ClassPlanVo>();
		cDataTable = classPlanService.getListNoPageById(constom_id);
		cDataTable.setCode(0);
		cDataTable.setMsg("");
		return cDataTable;
	}
	
	
	
	
	
	/**
	 * 获取课程方案详情
	 * @param ClassPlan_id
	 * @return
	 */
	@RequestMapping(value = "/getClassPlandetailByid")
	@ResponseBody
	public Map<String,Object> GetClassPlanDetailByid(@RequestParam("ClassPlan_id")String ClassPlan_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		ClassPlan classPlan = new ClassPlan();
		if(ClassPlan_id == null || "".equals(ClassPlan_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		classPlan = classPlanService.getDetailByid(ClassPlan_id);
		if(classPlan == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", classPlan); //请求成功
		}
			
		return resultMap;
	}
	
	
	
	/**
	 * 更新课程方案信息
	 * @param ClassPlan_id
	 * @param ClassPlan_name
	 * @param ClassPlan_context
	 * @return
	 */
	@RequestMapping(value="/updateClassPlan",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateClassPlan(String ClassPlan_id,String ClassPlan_name,String ClassPlan_context){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的课程方案
		ClassPlan classPlan = new ClassPlan();
		classPlan = classPlanService.getDetailByid(ClassPlan_id);
		if(classPlan == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		classPlan.setCreater("admin");
		classPlan.setCreatetime(About_Createtime);
		classPlan.setClassplan_context(ClassPlan_context);
		classPlan.setClassplan_name(ClassPlan_name);
		classPlanService.updateClassPlan(classPlan);
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	
	/**
	 * 删除课程方案 逻辑删除
	 * @param ClassPlan_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteClassPlan")
	@ResponseBody
	public Map<String,Object> deleteClassPlan(String ClassPlan_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(ClassPlan_id == null || "".equals(ClassPlan_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的ClassPlan
		ClassPlan classPlan = classPlanService.getDetailByid(ClassPlan_id);
		if(classPlan == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取课程方案失败
			return resultMap;
		}
		classPlanService.deleteClassPlan(ClassPlan_id);

		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
