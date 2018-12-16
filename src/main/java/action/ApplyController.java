/**
 * 
 */
package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import entity.Apply;
import entity.ApplyShowVo;
import entity.DatatablesViewPage;
import entity.IUser;
import entity.News;
import service.ApplyService;
import service.IUserService;
import service.NewsService;
import util.FileUtil;
import util.PropertiesUtil;
import util.StringUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/Apply")
public class ApplyController {
	
	@Autowired
	private ApplyService applyService;
	
	
	
	/**
	 * 报名 个人
	 * @param name
	 * @param sex
	 * @param brithday
	 * @param indentity_number
	 * @param political_status
	 * @param phone_number
	 * @param mail
	 * @param department
	 * @param job
	 * @param address
	 * @param other
	 * @param project_id
	 * @param position
	 * @param creater
	 * @param createtime
	 * @param check_status
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/apply",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> Insert(String name,
			String sex,String brithday,String indentity_number,
			String political_status,String phone_number,String mail,
			String department,String job,String address,
			String other,String project_id,String position,HttpServletRequest request){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//获取当前登录用户
		IUser user =  (IUser) request.getSession().getAttribute("user");
		//构建申请对象
		Apply apply = new Apply();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		apply.setAddress(address);
		apply.setApply_id(UUIDUtil.getUUid("apply"));
		apply.setBrithday(brithday);
		apply.setCheck_status("0");
		apply.setCreater("admin");
		apply.setCreatetime(news_Createtime);
		apply.setDepartment(department);
		apply.setIndentity_number(indentity_number);
		apply.setJob(job);
		apply.setMail(mail);
		apply.setName(name);
		apply.setOther(other);
		apply.setPhone_number(phone_number);
		apply.setPolitical_status(political_status);
		apply.setPosition(position);
		apply.setProject_id(project_id);
		apply.setSex(sex);
		apply.setApplydate(APPLYDATE);
		apply.setApply_caogery("0");
		apply.setIsdelete("0");//未删除
		applyService.insertApply(apply);
		resultMap.put("success", true);
		resultMap.put("msg", 1);//注册成功!
		return resultMap;
		
	}
	/**
	 * 前台展示申请(包括单位申请和个人申请)
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping("/getApplyshow")
	@ResponseBody
	public DatatablesViewPage<ApplyShowVo> GetlistAplyshow(@RequestParam("draw")int draw,@RequestParam("start")int start,
			@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<ApplyShowVo> datatablesViewPage = new DatatablesViewPage<ApplyShowVo>();
		
		datatablesViewPage=applyService.GetlistApplyShow(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取个人申请的详情内容
	 * @param apply_id
	 * @return
	 */
	@RequestMapping("/getApplydetail")
	@ResponseBody
	public Map<String,Object> getdetail(String apply_id){
		//结果map
		Map<String,Object> resultmap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(apply_id)){
			resultmap.put("success", false);
			resultmap.put("msg", "0");//参数错误
			return resultmap;
		}
		
		Apply apply = new Apply();
		
		apply = applyService.getApplyDetailByid(apply_id);
		if(apply == null){
			resultmap.put("success", false);
			resultmap.put("msg", "1");//未获取个人申请详情
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("data", apply);
		return resultmap;
	}
	
	
	/**
	 * 删除申请  逻辑删除  改变状态
	 * @param apply_id
	 * @return
	 */
	@RequestMapping("/deleteapply")
	@ResponseBody
	public Map<String,Object> deleteapply(String apply_id){
		//结果map
		Map<String,Object> resultmap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(apply_id)){
			resultmap.put("success", false);
			resultmap.put("msg", "0");//参数错误
			return resultmap;
		}
		
		Apply apply = new Apply();
		
		apply = applyService.getApplyDetailByid(apply_id);
		if(apply == null){
			resultmap.put("success", false);
			resultmap.put("msg", "1");//未获取个人申请详情
			return resultmap;
		}
		applyService.deleteapply(apply_id);
		resultmap.put("success", true);
		resultmap.put("msg", "2");//删除成功!
		return resultmap;
	}
	
	/**
	 * 审核个人申请
	 * @param apply_id
	 * @param status
	 * @return
	 */
	@RequestMapping("/updateapplystatus")
	@ResponseBody
	public Map<String,Object> updateapplystatus(String apply_id,String status){
		//结果map
		Map<String,Object> resultmap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(apply_id)||StringUtil.isblack(status)){
			resultmap.put("success", false);
			resultmap.put("msg", "0");//参数错误
			return resultmap;
		}
		
		Apply apply = new Apply();
		
		apply = applyService.getApplyDetailByid(apply_id);
		if(apply == null){
			resultmap.put("success", false);
			resultmap.put("msg", "1");//未获取个人申请详情
			return resultmap;
		}
		applyService.updatestatus(status, apply_id);
		resultmap.put("success", true);
		resultmap.put("msg", "2");//审核成功!
		return resultmap;
	}
	
	/**
	 * 更新个人申请
	 * @param apply_id
	 * @param name
	 * @param sex
	 * @param brithday
	 * @param indentity_number
	 * @param political_status
	 * @param phone_number
	 * @param mail
	 * @param department
	 * @param job
	 * @param address
	 * @param other
	 * @param position
	 * @return
	 */
	@RequestMapping("/updateapply")
	@ResponseBody
	public Map<String,Object> updateapply(String apply_id,String name,
			String sex,String brithday,String indentity_number,
			String political_status,String phone_number,String mail,
			String department,String job,String address,String apply_status,
			String other,String position){
		//结果map
		Map<String,Object> resultmap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(apply_id)){
			resultmap.put("success", false);
			resultmap.put("msg", "0");//参数错误
			return resultmap;
		}
		
		Apply apply = new Apply();
		
		apply = applyService.getApplyDetailByid(apply_id);
		if(apply == null){
			resultmap.put("success", false);
			resultmap.put("msg", "1");//未获取个人申请详情
			return resultmap;
		}
		//修改
		apply.setAddress(address);
		apply.setBrithday(brithday);
		apply.setDepartment(department);
		apply.setIndentity_number(indentity_number);
		apply.setJob(job);
		apply.setMail(mail);
		apply.setName(name);
		apply.setOther(other);
		apply.setPhone_number(phone_number);
		apply.setPolitical_status(political_status);
		apply.setPosition(position);
		apply.setSex(sex);
		if(!StringUtil.isblack(apply_status)){
			apply.setCheck_status(apply_status);
			//短信接口
		}
		applyService.updateApply(apply);
		resultmap.put("success", true);
		resultmap.put("msg", "2");//更新成功!
		return resultmap;
	}
}
