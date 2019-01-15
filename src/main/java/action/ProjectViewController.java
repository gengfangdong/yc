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
import entity.News;
import entity.ProjectView;
import service.NewsService;
import service.ProjectViewService;
import util.FileUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/ProjectView")
public class ProjectViewController {
	
	@Autowired
	private ProjectViewService ProjectViewService;
	
	
	/**
	 * 通知公告封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/NewimagePage"));
		String ProjectViewName="";
		try {
			ProjectViewName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/ProjectViewimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(ProjectViewName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的通知公告上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveProjectViewandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertProjectViewandFile(@RequestParam("file") MultipartFile file,
			String ProjectView_Title,String ProjectView_Introduction,
			String ProjectView_KeyWords,String ProjectView_Release_time,String ProjectView_status,
			String ProjectView_context,HttpServletRequest request,HttpServletResponse response){
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
		String ProjectViewName="";
		try{
			ProjectViewName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/ProjectViewimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(ProjectViewName);
		//构建通知公告对象
		ProjectView ProjectView = new ProjectView();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String ProjectView_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		ProjectView.setProjectView_context(ProjectView_context);
		ProjectView.setProjectView_Creater("admin");
		ProjectView.setProjectView_Createtime(ProjectView_Createtime);
		ProjectView.setProjectView_id(UUIDUtil.getUUid("ProjectView"));
		ProjectView.setProjectView_Introduction(ProjectView_Introduction);
		ProjectView.setProjectView_KeyWords(ProjectView_KeyWords);
		ProjectView.setProjectView_Release_time(ProjectView_Release_time);
		ProjectView.setProjectView_status(ProjectView_status);
		ProjectView.setProjectView_titile(ProjectView_Title);
		ProjectView.setProjectView_title_page(ProjectViewName);
		ProjectViewService.insertProjectView(ProjectView);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 通知公告保存
	 * 
	 */
	@RequestMapping(value="/saveProjectView",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertProjectView(String ProjectView_Title,String ProjectView_Introduction,
			String ProjectView_KeyWords,String ProjectView_Release_time,String ProjectView_status,
			String ProjectView_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		ProjectView ProjectView = new ProjectView();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String ProjectView_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		ProjectView.setProjectView_context(ProjectView_context);
		ProjectView.setProjectView_Creater("admin");
		ProjectView.setProjectView_Createtime(ProjectView_Createtime);
		ProjectView.setProjectView_id(UUIDUtil.getUUid("ProjectView"));
		ProjectView.setProjectView_Introduction(ProjectView_Introduction);
		ProjectView.setProjectView_KeyWords(ProjectView_KeyWords);
		ProjectView.setProjectView_Release_time(ProjectView_Release_time);
		ProjectView.setProjectView_status(ProjectView_status);
		ProjectView.setProjectView_titile(ProjectView_Title);
		ProjectView.setProjectView_title_page(filename);
		ProjectViewService.insertProjectView(ProjectView);

		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 通知公告列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlist")
	@ResponseBody
	public DatatablesViewPage<ProjectView> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<ProjectView> datatablesViewPage = new DatatablesViewPage<ProjectView>();
		datatablesViewPage = ProjectViewService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取通知公告的内容
	 * @param news_id
	 * @return json
	 */
	@RequestMapping(value = "/getProjectViewdetailByid")
	@ResponseBody
	public Map<String,Object> GetProjectViewDetailByid(@RequestParam("ProjectView_id")String ProjectView_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		ProjectView ProjectView = new ProjectView();
		if(ProjectView_id == null || "".equals(ProjectView_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		ProjectView = ProjectViewService.getProjectViewDetailByid(ProjectView_id);
		if(ProjectView == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", ProjectView); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看通知公告的封面图片
	 * @param request
	 * @param response
	 * @param news_id
	 * @throws IOException
	 */
	@RequestMapping("/ProjectView_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("ProjectView_id")String ProjectView_id) throws IOException {
		ProjectView ProjectView = new ProjectView();
		ProjectView = ProjectViewService.getProjectViewDetailByid(ProjectView_id);
		String imagepath = request.getRealPath("/ProjectViewimagePage");
		String newpath = imagepath.replace("ssmtest", "file");//上传到webapp下
        String imagePath = newpath+"\\"+ProjectView.getProjectView_title_page();
        //String imagePath = request.getRealPath("/ProjectViewimagePage")+"/"+ProjectView.getProjectView_title_page();
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
	
	
	/** 更新通知公告
	 * @param ProjectView_id
	 * @param ProjectView_Title
	 * @param ProjectView_Introduction
	 * @param ProjectView_KeyWords
	 * @param ProjectView_Release_time
	 * @param ProjectView_status
	 * @param ProjectView_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateProjectView",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateProjectView(String ProjectView_id,String ProjectView_Title,String ProjectView_Introduction,
			String ProjectView_KeyWords,String ProjectView_Release_time,String ProjectView_status,
			String ProjectView_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的通知公告
		ProjectView ProjectView = new ProjectView();
		ProjectView = ProjectViewService.getProjectViewDetailByid(ProjectView_id);
		if(ProjectView == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		ProjectView.setProjectView_context(ProjectView_context);
		ProjectView.setProjectView_Creater("admin");
		ProjectView.setProjectView_Createtime(news_Createtime);
		ProjectView.setProjectView_Introduction(ProjectView_Introduction);
		ProjectView.setProjectView_KeyWords(ProjectView_KeyWords);
		ProjectView.setProjectView_Release_time(ProjectView_Release_time);
		ProjectView.setProjectView_status(ProjectView_status);
		ProjectView.setProjectView_titile(ProjectView_Title);
		ProjectView.setProjectView_title_page(filename);
		ProjectViewService.updateProjectView(ProjectView);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	

	/**
	 *  更新通知公告内容和文件
	 * @param file
	 * @param ProjectView_id
	 * @param ProjectView_Title
	 * @param ProjectView_Introduction
	 * @param ProjectView_KeyWords
	 * @param ProjectView_Release_time
	 * @param ProjectView_status
	 * @param ProjectView_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateProjectViewandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateProjectViewandFile(@RequestParam("file")MultipartFile file,String ProjectView_id,
			String ProjectView_Title,String ProjectView_Introduction,
			String ProjectView_KeyWords,String ProjectView_Release_time,String ProjectView_status,
			String ProjectView_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的通知公告
		ProjectView ProjectView = new ProjectView();
		ProjectView = ProjectViewService.getProjectViewDetailByid(ProjectView_id);
		if(ProjectView == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/ProjectViewimagePage")+"\\"+ProjectView.getProjectView_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/ProjectViewimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		ProjectView.setProjectView_context(ProjectView_context);
		ProjectView.setProjectView_Creater("admin");
		ProjectView.setProjectView_Createtime(news_Createtime);
		ProjectView.setProjectView_Introduction(ProjectView_Introduction);
		ProjectView.setProjectView_KeyWords(ProjectView_KeyWords);
		ProjectView.setProjectView_Release_time(ProjectView_Release_time);
		ProjectView.setProjectView_status(ProjectView_status);
		ProjectView.setProjectView_titile(ProjectView_Title);
		ProjectView.setProjectView_title_page(filenewName);
		ProjectViewService.updateProjectView(ProjectView);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteProjectView")
	@ResponseBody
	public Map<String,Object> deleteProjectView(String ProjectView_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(ProjectView_id == null || "".equals(ProjectView_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的ProjectView
		ProjectView ProjectView = ProjectViewService.getProjectViewDetailByid(ProjectView_id);
		if(ProjectView == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		ProjectViewService.deleteProjectView(ProjectView_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/ProjectViewimagePage")+"\\"+ProjectView.getProjectView_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
