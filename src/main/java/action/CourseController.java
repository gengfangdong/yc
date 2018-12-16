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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import entity.Course;
import entity.DatatablesViewPage;
import entity.About;
import service.AboutService;
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
@RequestMapping("/Course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	
	
	/**
	 * 插入
	 * @param First_course
	 * @param Second_course
	 * @param Third_course
	 * @param Course_context
	 * @return
	 */
	@RequestMapping(value="/saveCourse",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertCourse(String First_course,String Second_course,
			String Third_course,String Course_context){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Course course = new Course();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		course.setCourse_id(UUIDUtil.getUUid("course"));
		course.setCreatetime(About_Createtime);
		course.setFirst_course(First_course);
		course.setCourse_context(Course_context);
		course.setIsDelete("0");
		course.setSecond_course(Second_course);
		course.setThird_course(Third_course);
		course.setCreater("admin");
		courseService.insertCourse(course);
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping(value = "/getlist")
	@ResponseBody
	public DatatablesViewPage<Course> GetlistPage(@RequestParam(value="First_course",required=false)String First_course,
			@RequestParam(value="Second_course",required=false)String Second_course,
			@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Course> datatablesViewPage = new DatatablesViewPage<Course>();
		datatablesViewPage = courseService.GetlistPage(start, length, First_course, Second_course);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	
	/**
	 * 获取课程详情
	 * @param Course_id
	 * @return
	 */
	@RequestMapping(value = "/getCoursedetailByid")
	@ResponseBody
	public Map<String,Object> GetCourseDetailByid(@RequestParam("Course_id")String Course_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Course course = new Course();
		if(Course_id == null || "".equals(Course_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		course = courseService.getCourseDetail(Course_id);
		if(course == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", course); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 获取一级目录
	 * @return
	 */
	@RequestMapping("/getFirst")
	@ResponseBody
	public Map<String,Object> getFirst(){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<String> firstList = new ArrayList<String>();
		firstList = courseService.getfirst();
		if(firstList == null || firstList.size()==0){
			resultMap.put("success", false);
			resultMap.put("msg", "0");//没有数据
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("data", firstList);
		return resultMap;
	}
	
	/**
	 * 获取二级目录 根据一级目录
	 * @param First_course
	 * @return
	 */
	@RequestMapping("/getSecond")
	@ResponseBody
	public Map<String,Object> getSecondByFirst(@RequestParam("First_course")String First_course){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		/*if(StringUtil.isblack(First_course)){
			resultMap.put("success", false);
			resultMap.put("msg", "0");//参数错误
			return resultMap;
		}*/
		
		List<String> secondList = new ArrayList<String>();
		secondList = courseService.getsecond(First_course);
		if(secondList == null || secondList.size()==0){
			resultMap.put("success", false);
			resultMap.put("msg", "1");//没有数据
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("data", secondList);
		return resultMap;
	}
	/**
	 * 更新课程
	 * @param Course_id
	 * @param First_course
	 * @param Second_course
	 * @param Third_course
	 * @param Course_context
	 * @return
	 */
	@RequestMapping(value="/updateCourse",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateCourse(String Course_id,String First_course,String Second_course,String Third_course,String Course_context){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的课程
		Course course = new Course();
		course = courseService.getCourseDetail(Course_id);
		if(course == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		course.setCreater("admin");
		course.setCreatetime(About_Createtime);
		course.setFirst_course(First_course);
		course.setSecond_course(Second_course);
		course.setThird_course(Third_course);
		course.setCourse_context(Course_context);
		courseService.updateCourse(course);
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 删除课程  逻辑删除
	 * @param Course_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteCourse")
	@ResponseBody
	public Map<String,Object> deleteCourse(String Course_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Course_id == null || "".equals(Course_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Course
		Course course = courseService.getCourseDetail(Course_id);
		if(course == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		courseService.deleteCourse(Course_id);

		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
