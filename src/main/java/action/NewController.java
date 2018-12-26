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
import entity.News;
import service.NewsService;
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
@RequestMapping("/News")
public class NewController {
	
	@Autowired
	private NewsService newsService;
	
	
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
		String newsName="";
		try {
			newsName = fileUpload.uploadFile(file, fileFileName,request.getSession().getServletContext().getRealPath("/NewimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(newsName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的新闻上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveNewsandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertNewsandFile(@RequestParam("file") MultipartFile file,
			String News_Title,String News_Introduction,
			String News_KeyWords,String News_Release_time,String News_status,
			String News_context,HttpServletRequest request,HttpServletResponse response){
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
		String newsName="";
		try{
			newsName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/NewimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(newsName);
		//构建新闻对象
		News news = new News();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		news.setNews_context(News_context);
		news.setNews_Creater("admin");
		news.setNews_Createtime(news_Createtime);
		news.setNews_id(UUIDUtil.getUUid("news"));
		news.setNews_Introduction(News_Introduction);
		news.setNews_KeyWords(News_KeyWords);
		news.setNews_Release_time(News_Release_time);
		news.setNews_status(News_status);
		news.setNews_titile(News_Title);
		news.setNews_title_page(newsName);
		newsService.insertNews(news);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 新闻保存
	 * 
	 */
	@RequestMapping(value="/saveNews",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertNews(String News_Title,String News_Introduction,
			String News_KeyWords,String News_Release_time,String News_status,
			String News_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		News news = new News();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		news.setNews_context(News_context);
		news.setNews_Creater("admin");
		news.setNews_Createtime(news_Createtime);
		news.setNews_id(UUIDUtil.getUUid("news"));
		news.setNews_Introduction(News_Introduction);
		news.setNews_KeyWords(News_KeyWords);
		news.setNews_Release_time(News_Release_time);
		news.setNews_status(News_status);
		news.setNews_titile(News_Title);
		news.setNews_title_page(filename);
		newsService.insertNews(news);

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
	public DatatablesViewPage<News> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<News> datatablesViewPage = new DatatablesViewPage<News>();
		datatablesViewPage = newsService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param news_id
	 * @return json
	 */
	@RequestMapping(value = "/getNewdetailByid")
	@ResponseBody
	public Map<String,Object> GetNewsDetailByid(@RequestParam("news_id")String news_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		News news = new News();
		if(news_id == null || "".equals(news_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		news = newsService.getNewsDetailByid(news_id);
		if(news == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", news); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看新闻的封面图片
	 * @param request
	 * @param response
	 * @param news_id
	 * @throws IOException
	 */
	@RequestMapping("/News_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("news_id")String news_id) throws IOException {
		News news = new News();
		news = newsService.getNewsDetailByid(news_id);
		 
        String imagePath = request.getRealPath("/NewimagePage")+"/"+news.getNews_title_page();
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
	 * @param News_id
	 * @param News_Title
	 * @param News_Introduction
	 * @param News_KeyWords
	 * @param News_Release_time
	 * @param News_status
	 * @param News_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateNews",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateNews(String News_id,String News_Title,String News_Introduction,
			String News_KeyWords,String News_Release_time,String News_status,
			String News_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的新闻
		News news = new News();
		news = newsService.getNewsDetailByid(News_id);
		if(news == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		news.setNews_context(News_context);
		news.setNews_Creater("admin");
		news.setNews_Createtime(news_Createtime);
		news.setNews_Introduction(News_Introduction);
		news.setNews_KeyWords(News_KeyWords);
		news.setNews_Release_time(News_Release_time);
		news.setNews_status(News_status);
		news.setNews_titile(News_Title);
		news.setNews_title_page(filename);
		newsService.updateNews(news);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 更新新闻内容和文件
	 * @param file
	 * @param News_id
	 * @param News_Title
	 * @param News_Introduction
	 * @param News_KeyWords
	 * @param News_Release_time
	 * @param News_status
	 * @param News_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateNewsandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateNewsandFile(@RequestParam("file")MultipartFile file,String News_id,
			String News_Title,String News_Introduction,
			String News_KeyWords,String News_Release_time,String News_status,
			String News_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的新闻
		News news = new News();
		news = newsService.getNewsDetailByid(News_id);
		if(news == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/NewimagePage")+"\\"+news.getNews_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/NewimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		news.setNews_context(News_context);
		news.setNews_Creater("admin");
		news.setNews_Createtime(news_Createtime);
		news.setNews_Introduction(News_Introduction);
		news.setNews_KeyWords(News_KeyWords);
		news.setNews_Release_time(News_Release_time);
		news.setNews_status(News_status);
		news.setNews_titile(News_Title);
		news.setNews_title_page(filenewName);
		newsService.updateNews(news);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteNews")
	@ResponseBody
	public Map<String,Object> deleteNews(String News_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(News_id == null || "".equals(News_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的News
		News news = newsService.getNewsDetailByid(News_id);
		if(news == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		newsService.deleteNews(News_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/NewimagePage")+"\\"+news.getNews_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
	
	
}
