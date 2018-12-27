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
import entity.Culture;
import service.CultureService;
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
@RequestMapping("/Culture")
public class CultureController {
	
	@Autowired
	private CultureService cultureService;
	
	
	/**
	 * 培养封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/CultureimagePage"));
		String cultureName="";
		try {
			cultureName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/CultureimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(cultureName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的培养上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveCultureandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertCultureandFile(@RequestParam("file") MultipartFile file,
			String Culture_Title,String Culture_Introduction,
			String Culture_KeyWords,String Culture_Release_time,String Culture_status,
			String Culture_context,HttpServletRequest request,HttpServletResponse response){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		if(file.isEmpty()){
			resultMap.put("code", 2);//没有选择图片
			return resultMap;
		}
		//上传封面
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/CultureimagePage"));
		String cultureName="";
		try{
			cultureName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/CultureimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(cultureName);
		//构建培养对象
		Culture culture = new Culture();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String culture_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		culture.setCulture_context(Culture_context);
		culture.setCulture_Creater("admin");
		culture.setCulture_Createtime(culture_Createtime);
		culture.setCulture_id(UUIDUtil.getUUid("culture"));
		culture.setCulture_Introduction(Culture_Introduction);
		culture.setCulture_KeyWords(Culture_KeyWords);
		culture.setCulture_Release_time(Culture_Release_time);
		culture.setCulture_status(Culture_status);
		culture.setCulture_titile(Culture_Title);
		culture.setCulture_title_page(cultureName);
		cultureService.insertCulture(culture);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 培养保存
	 * 
	 */
	@RequestMapping(value="/saveCulture",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertCulture(String Culture_Title,String Culture_Introduction,
			String Culture_KeyWords,String Culture_Release_time,String Culture_status,
			String Culture_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Culture culture = new Culture();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String culture_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		culture.setCulture_context(Culture_context);
		culture.setCulture_Creater("admin");
		culture.setCulture_Createtime(culture_Createtime);
		culture.setCulture_id(UUIDUtil.getUUid("culture"));
		culture.setCulture_Introduction(Culture_Introduction);
		culture.setCulture_KeyWords(Culture_KeyWords);
		culture.setCulture_Release_time(Culture_Release_time);
		culture.setCulture_status(Culture_status);
		culture.setCulture_titile(Culture_Title);
		culture.setCulture_title_page(filename);
		cultureService.insertCulture(culture);

		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 培养列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlist")
	@ResponseBody
	public DatatablesViewPage<Culture> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Culture> datatablesViewPage = new DatatablesViewPage<Culture>();
		datatablesViewPage = cultureService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取培养的内容
	 * @param culture_id
	 * @return json
	 */
	@RequestMapping(value = "/getCulturedetailByid")
	@ResponseBody
	public Map<String,Object> GetCultureDetailByid(@RequestParam("culture_id")String culture_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Culture culture = new Culture();
		if(culture_id == null || "".equals(culture_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		culture = cultureService.getCultureDetailByid(culture_id);
		if(culture == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", culture); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看培养的封面图片
	 * @param request
	 * @param response
	 * @param culture_id
	 * @throws IOException
	 */
	@RequestMapping("/Culture_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("culture_id")String culture_id) throws IOException {
		Culture culture = new Culture();
		culture = cultureService.getCultureDetailByid(culture_id);
		 
        String imagePath = request.getRealPath("/CultureimagePage")+"/"+culture.getCulture_title_page();
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
	 * 更新培养
	 * @param Culture_id
	 * @param Culture_Title
	 * @param Culture_Introduction
	 * @param Culture_KeyWords
	 * @param Culture_Release_time
	 * @param Culture_status
	 * @param Culture_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateCulture",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateCulture(String Culture_id,String Culture_Title,String Culture_Introduction,
			String Culture_KeyWords,String Culture_Release_time,String Culture_status,
			String Culture_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的培养
		Culture culture = new Culture();
		culture = cultureService.getCultureDetailByid(Culture_id);
		if(culture == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String culture_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		culture.setCulture_context(Culture_context);
		culture.setCulture_Creater("admin");
		culture.setCulture_Createtime(culture_Createtime);
		culture.setCulture_Introduction(Culture_Introduction);
		culture.setCulture_KeyWords(Culture_KeyWords);
		culture.setCulture_Release_time(Culture_Release_time);
		culture.setCulture_status(Culture_status);
		culture.setCulture_titile(Culture_Title);
		culture.setCulture_title_page(filename);
		cultureService.updateCulture(culture);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 更新培养内容和文件
	 * @param file
	 * @param Culture_id
	 * @param Culture_Title
	 * @param Culture_Introduction
	 * @param Culture_KeyWords
	 * @param Culture_Release_time
	 * @param Culture_status
	 * @param Culture_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateCultureandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateCultureandFile(@RequestParam("file")MultipartFile file,String Culture_id,
			String Culture_Title,String Culture_Introduction,
			String Culture_KeyWords,String Culture_Release_time,String Culture_status,
			String Culture_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的培养
		Culture culture = new Culture();
		culture = cultureService.getCultureDetailByid(Culture_id);
		if(culture == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/CultureimagePage")+"\\"+culture.getCulture_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/CultureimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String culture_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		culture.setCulture_context(Culture_context);
		culture.setCulture_Creater("admin");
		culture.setCulture_Createtime(culture_Createtime);
		culture.setCulture_Introduction(Culture_Introduction);
		culture.setCulture_KeyWords(Culture_KeyWords);
		culture.setCulture_Release_time(Culture_Release_time);
		culture.setCulture_status(Culture_status);
		culture.setCulture_titile(Culture_Title);
		culture.setCulture_title_page(filenewName);
		cultureService.updateCulture(culture);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteCulture")
	@ResponseBody
	public Map<String,Object> deleteCulture(String Culture_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Culture_id == null || "".equals(Culture_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Culture
		Culture culture = cultureService.getCultureDetailByid(Culture_id);
		if(culture == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取培养失败
			return resultMap;
		}
		cultureService.deleteCulture(Culture_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/CultureimagePage")+"\\"+culture.getCulture_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
	
	
}
