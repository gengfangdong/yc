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
import entity.About;
import service.AboutService;
import util.FileUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/About")
public class AboutController {
	
	@Autowired
	private AboutService AboutService;
	
	
	/**
	 * 新闻封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/NewimagePage"));
		String AboutName="";
		try {
			AboutName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/AboutimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(AboutName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的新闻上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveAboutandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertAboutandFile(@RequestParam("file") MultipartFile file,
			String About_Title,String About_Introduction,
			String About_KeyWords,String About_Release_time,String About_status,
			String About_context,HttpServletRequest request,HttpServletResponse response){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		if(file.isEmpty()){
			resultMap.put("code", 2);//没有选择图片
			return resultMap;
		}
		//上传封面
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/NewimagePage"));
		String AboutName="";
		try{
			AboutName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/AboutimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(AboutName);
		//构建新闻对象
		About About = new About();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		About.setAbout_context(About_context);
		About.setAbout_Creater("admin");
		About.setAbout_Createtime(About_Createtime);
		About.setAbout_id(UUIDUtil.getUUid("About"));
		About.setAbout_Introduction(About_Introduction);
		About.setAbout_KeyWords(About_KeyWords);
		About.setAbout_Release_time(About_Release_time);
		About.setAbout_status(About_status);
		About.setAbout_titile(About_Title);
		About.setAbout_title_page(AboutName);
		AboutService.insertAbout(About);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 新闻保存
	 * 
	 */
	@RequestMapping(value="/saveAbout",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertAbout(String About_Title,String About_Introduction,
			String About_KeyWords,String About_Release_time,String About_status,
			String About_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		About About = new About();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		About.setAbout_context(About_context);
		About.setAbout_Creater("admin");
		About.setAbout_Createtime(About_Createtime);
		About.setAbout_id(UUIDUtil.getUUid("About"));
		About.setAbout_Introduction(About_Introduction);
		About.setAbout_KeyWords(About_KeyWords);
		About.setAbout_Release_time(About_Release_time);
		About.setAbout_status(About_status);
		About.setAbout_titile(About_Title);
		About.setAbout_title_page(filename);
		AboutService.insertAbout(About);

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
	public DatatablesViewPage<About> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<About> datatablesViewPage = new DatatablesViewPage<About>();
		datatablesViewPage = AboutService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param About_id
	 * @return json
	 */
	@RequestMapping(value = "/getAboutdetailByid")
	@ResponseBody
	public Map<String,Object> GetAboutDetailByid(@RequestParam("About_id")String About_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		About About = new About();
		if(About_id == null || "".equals(About_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		About = AboutService.getAboutDetailByid(About_id);
		if(About == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", About); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看新闻的封面图片
	 * @param request
	 * @param response
	 * @param About_id
	 * @throws IOException
	 */
	@RequestMapping("/About_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("About_id")String About_id) throws IOException {
		About About = new About();
		About = AboutService.getAboutDetailByid(About_id);
		 
        String imagePath = request.getRealPath("/AboutimagePage")+"/"+About.getAbout_title_page();
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
	 * @param About_id
	 * @param About_Title
	 * @param About_Introduction
	 * @param About_KeyWords
	 * @param About_Release_time
	 * @param About_status
	 * @param About_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateAbout",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateAbout(String About_id,String About_Title,String About_Introduction,
			String About_KeyWords,String About_Release_time,String About_status,
			String About_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的新闻
		About About = new About();
		About = AboutService.getAboutDetailByid(About_id);
		if(About == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		About.setAbout_context(About_context);
		About.setAbout_Creater("admin");
		About.setAbout_Createtime(About_Createtime);
		About.setAbout_Introduction(About_Introduction);
		About.setAbout_KeyWords(About_KeyWords);
		About.setAbout_Release_time(About_Release_time);
		About.setAbout_status(About_status);
		About.setAbout_titile(About_Title);
		About.setAbout_title_page(filename);
		AboutService.updateAbout(About);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 更新新闻内容和文件
	 * @param file
	 * @param About_id
	 * @param About_Title
	 * @param About_Introduction
	 * @param About_KeyWords
	 * @param About_Release_time
	 * @param About_status
	 * @param About_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateAboutandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateAboutandFile(@RequestParam("file")MultipartFile file,String About_id,
			String About_Title,String About_Introduction,
			String About_KeyWords,String About_Release_time,String About_status,
			String About_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的新闻
		About About = new About();
		About = AboutService.getAboutDetailByid(About_id);
		if(About == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/AboutimagePage")+"\\"+About.getAbout_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/AboutimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		About.setAbout_context(About_context);
		About.setAbout_Creater("admin");
		About.setAbout_Createtime(About_Createtime);
		About.setAbout_Introduction(About_Introduction);
		About.setAbout_KeyWords(About_KeyWords);
		About.setAbout_Release_time(About_Release_time);
		About.setAbout_status(About_status);
		About.setAbout_titile(About_Title);
		About.setAbout_title_page(filenewName);
		AboutService.updateAbout(About);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteAbout")
	@ResponseBody
	public Map<String,Object> deleteAbout(String About_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(About_id == null || "".equals(About_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的About
		About About = AboutService.getAboutDetailByid(About_id);
		if(About == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		AboutService.deleteAbout(About_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/AboutimagePage")+"\\"+About.getAbout_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
