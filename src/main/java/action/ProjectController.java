/**
 * 
 */
package action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import entity.DatatablesViewPage;
import entity.Project;
import service.ProjectService;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/Project")
public class ProjectController {
	
	@Autowired
	private ProjectService ProjectService;

	/**
	 * 项目保存
	 * 
	 */
	@RequestMapping(value="/saveProject",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertProject(String Project_name,
			String Project_date,String Project_context,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Project Project = new Project();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String Project_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		
		Project.setProject_id(UUIDUtil.getUUid("Project"));
		Project.setProject_date(Project_date);
		Project.setProject_name(Project_name);
		Project.setProject_context(Project_context);
		Project.setProject_creater("admin");
		Project.setProject_createtime(Project_Createtime);
		
		ProjectService.insertProject(Project);

		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 项目列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlist")
	@ResponseBody
	public DatatablesViewPage<Project> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Project> datatablesViewPage = new DatatablesViewPage<Project>();
		datatablesViewPage = ProjectService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取项目的内容
	 * @param news_id
	 * @return json
	 */
	@RequestMapping(value = "/getProjectdetailByid")
	@ResponseBody
	public Map<String,Object> GetProjectDetailByid(@RequestParam("Project_id")String Project_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Project Project = new Project();
		if(Project_id == null || "".equals(Project_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		Project = ProjectService.getProjectDetailByid(Project_id);
		if(Project == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", Project); //请求成功
		}
			
		return resultMap;
	}
	
	
	/** 更新项目
	 * @param Project_id
	 * @param Project_Title
	 * @param Project_Introduction
	 * @param Project_KeyWords
	 * @param Project_Release_time
	 * @param Project_status
	 * @param Project_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateProject",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateProject(String Project_id,String Project_name,String Project_date,
			String Project_context,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的项目
		Project Project = new Project();
		Project = ProjectService.getProjectDetailByid(Project_id);
		if(Project == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		Project.setProject_context(Project_context);
		Project.setProject_creater("admin");
		Project.setProject_createtime(news_Createtime);
		Project.setProject_name(Project_name);
		ProjectService.updateProject(Project);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	@RequestMapping("/deleteProject")
	@ResponseBody
	public Map<String,Object> deleteProject(String Project_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Project_id == null || "".equals(Project_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Project
		Project Project = ProjectService.getProjectDetailByid(Project_id);
		if(Project == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		ProjectService.deleteProject(Project_id);
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
