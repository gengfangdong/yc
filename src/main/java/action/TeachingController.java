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

import entity.DatatablesViewPage;
import entity.Teaching;
import service.TeachingService;
import util.FileUtil;
import util.PropertiesUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/Teaching")
public class TeachingController {
	
	@Autowired
	private TeachingService teachingService;
	
	
	/**
	 * 新闻封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/TeachingimagePage"));
		String teachingName="";
		try {
			teachingName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/TeachingimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(teachingName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的新闻上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveTeachingandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertTeachingandFile(@RequestParam("file") MultipartFile file,
			String Teaching_Title,String Teaching_Introduction,
			String Teaching_KeyWords,String Teaching_Release_time,String Teaching_status,
			String Teaching_context,HttpServletRequest request,HttpServletResponse response){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		if(file.isEmpty()){
			resultMap.put("code", 2);//没有选择图片
			return resultMap;
		}
		//上传封面
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/TeachingimagePage"));
		String teachingName="";
		try{
			teachingName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/TeachingimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(teachingName);
		//构建新闻对象
		Teaching teaching = new Teaching();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String teaching_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		teaching.setTeaching_context(Teaching_context);
		teaching.setTeaching_Creater("admin");
		teaching.setTeaching_Createtime(teaching_Createtime);
		teaching.setTeaching_id(UUIDUtil.getUUid("teaching"));
		teaching.setTeaching_Introduction(Teaching_Introduction);
		teaching.setTeaching_KeyWords(Teaching_KeyWords);
		teaching.setTeaching_Release_time(Teaching_Release_time);
		teaching.setTeaching_status(Teaching_status);
		teaching.setTeaching_titile(Teaching_Title);
		teaching.setTeaching_title_page(teachingName);
		teachingService.insertTeaching(teaching);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 新闻保存
	 * 
	 */
	@RequestMapping(value="/saveTeaching",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertTeaching(String Teaching_Title,String Teaching_Introduction,
			String Teaching_KeyWords,String Teaching_Release_time,String Teaching_status,
			String Teaching_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Teaching teaching = new Teaching();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String teaching_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		teaching.setTeaching_context(Teaching_context);
		teaching.setTeaching_Creater("admin");
		teaching.setTeaching_Createtime(teaching_Createtime);
		teaching.setTeaching_id(UUIDUtil.getUUid("teaching"));
		teaching.setTeaching_Introduction(Teaching_Introduction);
		teaching.setTeaching_KeyWords(Teaching_KeyWords);
		teaching.setTeaching_Release_time(Teaching_Release_time);
		teaching.setTeaching_status(Teaching_status);
		teaching.setTeaching_titile(Teaching_Title);
		teaching.setTeaching_title_page(filename);
		teachingService.insertTeaching(teaching);

		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 新闻列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlist")
	@ResponseBody
	public DatatablesViewPage<Teaching> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Teaching> datatablesViewPage = new DatatablesViewPage<Teaching>();
		datatablesViewPage = teachingService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param teaching_id
	 * @return json
	 */
	@RequestMapping(value = "/getTeachingdetailByid")
	@ResponseBody
	public Map<String,Object> GetTeachingDetailByid(@RequestParam("teaching_id")String teaching_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Teaching teaching = new Teaching();
		if(teaching_id == null || "".equals(teaching_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		teaching = teachingService.getTeachingDetailByid(teaching_id);
		if(teaching == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", teaching); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看新闻的封面图片
	 * @param request
	 * @param response
	 * @param teaching_id
	 * @throws IOException
	 */
	@RequestMapping("/Teaching_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("teaching_id")String teaching_id) throws IOException {
		Teaching teaching = new Teaching();
		teaching = teachingService.getTeachingDetailByid(teaching_id);
		 
        String imagePath = request.getRealPath("/TeachingimagePage")+"/"+teaching.getTeaching_title_page();
        response.reset();
        File file = new File(imagePath);
        if(file.exists()){   //如果文件存在  
            InputStream in = new FileInputStream(imagePath);   //用该文件创建一个输入流  
            OutputStream os = response.getOutputStream();  //创建输出流  
            byte[] b = new byte[1024];    
            while( in.read(b)!= -1){   
            os.write(b);       
            }  
            in.close();   
            os.flush();  
            os.close();  
        }  
    }
	
	
	/**
	 * 更新新闻
	 * @param Teaching_id
	 * @param Teaching_Title
	 * @param Teaching_Introduction
	 * @param Teaching_KeyWords
	 * @param Teaching_Release_time
	 * @param Teaching_status
	 * @param Teaching_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateTeaching",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateTeaching(String Teaching_id,String Teaching_Title,String Teaching_Introduction,
			String Teaching_KeyWords,String Teaching_Release_time,String Teaching_status,
			String Teaching_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的新闻
		Teaching teaching = new Teaching();
		teaching = teachingService.getTeachingDetailByid(Teaching_id);
		if(teaching == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String teaching_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		teaching.setTeaching_context(Teaching_context);
		teaching.setTeaching_Creater("admin");
		teaching.setTeaching_Createtime(teaching_Createtime);
		teaching.setTeaching_Introduction(Teaching_Introduction);
		teaching.setTeaching_KeyWords(Teaching_KeyWords);
		teaching.setTeaching_Release_time(Teaching_Release_time);
		teaching.setTeaching_status(Teaching_status);
		teaching.setTeaching_titile(Teaching_Title);
		teaching.setTeaching_title_page(filename);
		teachingService.updateTeaching(teaching);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 更新新闻内容和文件
	 * @param file
	 * @param Teaching_id
	 * @param Teaching_Title
	 * @param Teaching_Introduction
	 * @param Teaching_KeyWords
	 * @param Teaching_Release_time
	 * @param Teaching_status
	 * @param Teaching_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateTeachingandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateTeachingandFile(@RequestParam("file")MultipartFile file,String Teaching_id,
			String Teaching_Title,String Teaching_Introduction,
			String Teaching_KeyWords,String Teaching_Release_time,String Teaching_status,
			String Teaching_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的新闻
		Teaching teaching = new Teaching();
		teaching = teachingService.getTeachingDetailByid(Teaching_id);
		if(teaching == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/TeachingimagePage")+"\\"+teaching.getTeaching_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/TeachingimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String teaching_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		teaching.setTeaching_context(Teaching_context);
		teaching.setTeaching_Creater("admin");
		teaching.setTeaching_Createtime(teaching_Createtime);
		teaching.setTeaching_Introduction(Teaching_Introduction);
		teaching.setTeaching_KeyWords(Teaching_KeyWords);
		teaching.setTeaching_Release_time(Teaching_Release_time);
		teaching.setTeaching_status(Teaching_status);
		teaching.setTeaching_titile(Teaching_Title);
		teaching.setTeaching_title_page(filenewName);
		teachingService.updateTeaching(teaching);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteTeaching")
	@ResponseBody
	public Map<String,Object> deleteTeaching(String Teaching_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Teaching_id == null || "".equals(Teaching_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Teaching
		Teaching teaching = teachingService.getTeachingDetailByid(Teaching_id);
		if(teaching == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		teachingService.deleteTeaching(Teaching_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/TeachingimagePage")+"\\"+teaching.getTeaching_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
	
	
}
