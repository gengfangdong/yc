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

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import entity.Apply;
import entity.ApplyUnit;
import entity.DatatablesViewPage;
import entity.IUser;
import entity.News;
import entity.Project;
import service.ApplyService;
import service.ApplyUnitService;
import service.IUserService;
import service.NewsService;
import service.ProjectService;
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
@RequestMapping("/ApplyUnit")
public class ApplyUnitController {
	
	@Autowired
	private ApplyUnitService applyUnitService;
	
	@Autowired
	private ProjectService projectService;
	
	
	
	/**
	 * 单位报名
	 * @param applyunit_date
	 * @param applyunit_name
	 * @param applyunit_person
	 * @param applyunit_phone
	 * @param applyunit_mail
	 * @param project_id
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/apply",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> Insert(
			String applyunit_date,String applyunit_name,String applyunit_person,
			String applyunit_phone,String applyunit_mail,
			String project_id,HttpServletRequest request,@RequestParam("file") MultipartFile file){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//获取登录人的信息
		IUser user = (IUser) request.getSession().getAttribute("user");
		
		if(file == null){
			resultMap.put("succes", false);
			resultMap.put("msg", "0");//上传文件错误
			return resultMap;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		//文件名字
		String filename = file.getOriginalFilename();
		//初始化对象
		ApplyUnit applyUnit = new ApplyUnit();
		
		//设置属性
		applyUnit.setApplyunit_caogery("1");
		applyUnit.setApplyunit_date(applyunit_date);
		applyUnit.setApplyunit_id(UUIDUtil.getUUid("aunit"));
		applyUnit.setApplyunit_mail(applyunit_mail);
		applyUnit.setApplyunit_name(applyunit_name);
		applyUnit.setApplyunit_person(applyunit_person);
		applyUnit.setApplyunit_phone(applyunit_phone);
		applyUnit.setApplyunit_status("0");
		applyUnit.setIsdelete("0");
		applyUnit.setApplyunit_file(filename);
		applyUnit.setProject_id(project_id);
		//applyUnit.setApplyunit_creater(user.getUser_id());
		applyUnit.setApplyunit_creater(user.getUser_id());
		applyUnit.setApplyunit_createtime(news_Createtime);
		
		applyUnitService.insertApplyUnit(applyUnit);
		
		//上传文件
		FileUtil fileUtil = new FileUtil();
		
		try {
			fileUtil.uploadFileold(file, applyUnit.getApplyunit_id()+filename, request.getRealPath("/Applyunit"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("msg","1");//上传模板失败
			return resultMap;
		}
		
		
		//applyService.insertApply(apply);
		resultMap.put("success", true);
		resultMap.put("msg", 2);//报名成功
		return resultMap;
		
	}
	
	/**
	 * 根据id获取详情
	 * @param applyunit_id
	 * @return
	 */
	@RequestMapping("/getdetailByid")
	@ResponseBody
	public Map<String,Object> getDetailByid(String applyunit_id){
		//返回结果
		Map<String,Object> resultmap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(applyunit_id)){
			resultmap.put("success", false);
			resultmap.put("msg", "0");//参数错误
			return resultmap;
		}
		
		ApplyUnit applyUnit = new ApplyUnit();
		
		applyUnit = applyUnitService.getApplyUnitDetail(applyunit_id);
		if(applyUnit ==null){
			resultmap.put("success", false);
			resultmap.put("msg", "1");//没有找到实体
			return resultmap;
		}
		Project project = projectService.getProjectDetailByid(applyUnit.getProject_id());
		resultmap.put("success", true);
		resultmap.put("data", applyUnit);
		resultmap.put("name", project.getProject_name());
		return resultmap;
	}
	
	/**
	 * 带文件的修改
	 * @param applyunit_id
	 * @param applyunit_status
	 * @param applyunit_date
	 * @param applyunit_name
	 * @param applyunit_person
	 * @param applyunit_phone
	 * @param applyunit_mail
	 * @param request
	 * @param file
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/updatefile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updatefile(String applyunit_id,String applyunit_status,
			String applyunit_date,String applyunit_name,String applyunit_person,
			String applyunit_phone,String applyunit_mail,HttpServletRequest request,@RequestParam("file") MultipartFile file) throws IOException{
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(file == null){
			resultMap.put("code", 2);//上传失败
			return resultMap;
		}
		//初始化对象
		ApplyUnit applyUnit = applyUnitService.getApplyUnitDetail(applyunit_id);
				
		//删除以前的文件
		String oldfilename = applyUnit.getApplyunit_file();
		//上传文件
		FileUtil fileUtil = new FileUtil();
				
		String result = fileUtil.delete(request.getRealPath("/Applyunit")+"\\"+applyunit_id+oldfilename);
		if("2".equals(result)){
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		
		//获取登录人的信息
		IUser user = (IUser) request.getSession().getAttribute("user");

		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		//文件名字
		String filename = file.getOriginalFilename();
		
		//设置属性
		applyUnit.setApplyunit_date(applyunit_date);
		applyUnit.setApplyunit_mail(applyunit_mail);
		applyUnit.setApplyunit_name(applyunit_name);
		applyUnit.setApplyunit_person(applyunit_person);
		applyUnit.setApplyunit_phone(applyunit_phone);
		if(!StringUtil.isblack(applyunit_status)){
			if(!applyunit_status.equals(applyUnit.getApplyunit_status())){
				applyUnit.setApplyunit_status(applyunit_status);
				//短信接口
			}
		}

		applyUnit.setApplyunit_file(filename);
		applyUnitService.update(applyUnit);
		
		fileUtil.uploadFileold(file, applyUnit.getApplyunit_id()+file.getOriginalFilename(), request.getRealPath("/Applyunit"));
		
		//applyService.insertApply(apply);
		resultMap.put("code", 1);//上传失败
		return resultMap;
		
	}
	
	/**
	 * 不带文件的修改
	 * @param applyunit_id
	 * @param applyunit_status
	 * @param applyunit_date
	 * @param applyunit_name
	 * @param applyunit_person
	 * @param applyunit_phone
	 * @param applyunit_mail
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> update(String applyunit_id,String applyunit_status,
			String applyunit_date,String applyunit_name,String applyunit_person,
			String applyunit_phone,String applyunit_mail,HttpServletRequest request) throws IOException{
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		
		//初始化对象
		ApplyUnit applyUnit = applyUnitService.getApplyUnitDetail(applyunit_id);
				
		//获取登录人的信息
		IUser user = (IUser) request.getSession().getAttribute("user");

		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		
		//设置属性
		applyUnit.setApplyunit_date(applyunit_date);
		applyUnit.setApplyunit_mail(applyunit_mail);
		applyUnit.setApplyunit_name(applyunit_name);
		applyUnit.setApplyunit_person(applyunit_person);
		applyUnit.setApplyunit_phone(applyunit_phone);
		applyUnit.setApplyunit_createtime(news_Createtime);
		if(!StringUtil.isblack(applyunit_status)){
			if(!applyunit_status.equals(applyUnit.getApplyunit_status())){
				applyUnit.setApplyunit_status(applyunit_status);
				//短信接口
			}
			
		}
		applyUnitService.update(applyUnit);
		
		
		
		//applyService.insertApply(apply);
		resultMap.put("success", true);
		resultMap.put("msg", "2");//修改成功!
		return resultMap;
		
	}
	
	/**逻辑删除
	 * @param applyUnit_id
	 * @return
	 */
	@RequestMapping("/deleteApplyUnit")
	@ResponseBody
	public Map<String,Object> deleteApplyunit(String applyUnit_id){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(applyUnit_id)){
			resultMap.put("success", false);
			resultMap.put("msg", "0");//参数错误
			return resultMap;
		}
		
		ApplyUnit applyUnit = new ApplyUnit();
		applyUnit = applyUnitService.getApplyUnitDetail(applyUnit_id);
		
		if(applyUnit ==null){
			resultMap.put("success", false);
			resultMap.put("msg", "1");//没有找到实体
			return resultMap;
		}
		
		applyUnitService.deleteapplyunit(applyUnit.getApplyunit_id());
		resultMap.put("success", true);
		resultMap.put("msg", "2");//删除成功!
		return resultMap;
	}
	
	/**
	 * 下载文件
	 * @param request
	 * @param applyUnit_id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/download/{applyUnit_id}") //匹配的是href中的download请求
    public ResponseEntity<byte[]> download(HttpServletRequest request,@PathVariable String applyUnit_id) throws IOException{
    	
    	ApplyUnit applyUnit = new ApplyUnit();
		applyUnit = applyUnitService.getApplyUnitDetail(applyUnit_id);
        FileUtil fileUtil = new FileUtil();
        HttpHeaders headers = new HttpHeaders();
        return fileUtil.download(request.getRealPath("/Applyunit")+"\\"+applyUnit_id+applyUnit.getApplyunit_file(), applyUnit_id+applyUnit.getApplyunit_file(),headers);        
    }
	
}
