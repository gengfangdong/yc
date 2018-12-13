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
import entity.Notice;
import service.NewsService;
import service.NoticeService;
import util.FileUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/Notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
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
		String noticeName="";
		try {
			noticeName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/NoticeimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(noticeName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的通知公告上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveNoticeandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertNoticeandFile(@RequestParam("file") MultipartFile file,
			String Notice_Title,String Notice_Introduction,
			String Notice_KeyWords,String Notice_Release_time,String Notice_status,
			String Notice_context,HttpServletRequest request,HttpServletResponse response){
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
		String noticeName="";
		try{
			noticeName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/NoticeimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(noticeName);
		//构建通知公告对象
		Notice notice = new Notice();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String notice_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		notice.setNotice_context(Notice_context);
		notice.setNotice_Creater("admin");
		notice.setNotice_Createtime(notice_Createtime);
		notice.setNotice_id(UUIDUtil.getUUid("notice"));
		notice.setNotice_Introduction(Notice_Introduction);
		notice.setNotice_KeyWords(Notice_KeyWords);
		notice.setNotice_Release_time(Notice_Release_time);
		notice.setNotice_status(Notice_status);
		notice.setNotice_titile(Notice_Title);
		notice.setNotice_title_page(noticeName);
		noticeService.insertNotice(notice);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 通知公告保存
	 * 
	 */
	@RequestMapping(value="/saveNotice",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertNotice(String Notice_Title,String Notice_Introduction,
			String Notice_KeyWords,String Notice_Release_time,String Notice_status,
			String Notice_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Notice notice = new Notice();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String notice_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		notice.setNotice_context(Notice_context);
		notice.setNotice_Creater("admin");
		notice.setNotice_Createtime(notice_Createtime);
		notice.setNotice_id(UUIDUtil.getUUid("notice"));
		notice.setNotice_Introduction(Notice_Introduction);
		notice.setNotice_KeyWords(Notice_KeyWords);
		notice.setNotice_Release_time(Notice_Release_time);
		notice.setNotice_status(Notice_status);
		notice.setNotice_titile(Notice_Title);
		notice.setNotice_title_page(filename);
		noticeService.insertNotice(notice);

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
	public DatatablesViewPage<Notice> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Notice> datatablesViewPage = new DatatablesViewPage<Notice>();
		datatablesViewPage = noticeService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取通知公告的内容
	 * @param news_id
	 * @return json
	 */
	@RequestMapping(value = "/getNoticedetailByid")
	@ResponseBody
	public Map<String,Object> GetNoticeDetailByid(@RequestParam("notice_id")String notice_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Notice notice = new Notice();
		if(notice_id == null || "".equals(notice_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		notice = noticeService.getNoticeDetailByid(notice_id);
		if(notice == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", notice); //请求成功
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
	@RequestMapping("/Notice_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("notice_id")String notice_id) throws IOException {
		Notice notice = new Notice();
		notice = noticeService.getNoticeDetailByid(notice_id);
		 
        String imagePath = request.getRealPath("/NoticeimagePage")+"/"+notice.getNotice_title_page();
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
	 * @param Notice_id
	 * @param Notice_Title
	 * @param Notice_Introduction
	 * @param Notice_KeyWords
	 * @param Notice_Release_time
	 * @param Notice_status
	 * @param Notice_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateNotice",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateNotice(String Notice_id,String Notice_Title,String Notice_Introduction,
			String Notice_KeyWords,String Notice_Release_time,String Notice_status,
			String Notice_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的通知公告
		Notice notice = new Notice();
		notice = noticeService.getNoticeDetailByid(Notice_id);
		if(notice == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		notice.setNotice_context(Notice_context);
		notice.setNotice_Creater("admin");
		notice.setNotice_Createtime(news_Createtime);
		notice.setNotice_Introduction(Notice_Introduction);
		notice.setNotice_KeyWords(Notice_KeyWords);
		notice.setNotice_Release_time(Notice_Release_time);
		notice.setNotice_status(Notice_status);
		notice.setNotice_titile(Notice_Title);
		notice.setNotice_title_page(filename);
		noticeService.updateNotice(notice);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	

	/**
	 *  更新通知公告内容和文件
	 * @param file
	 * @param Notice_id
	 * @param Notice_Title
	 * @param Notice_Introduction
	 * @param Notice_KeyWords
	 * @param Notice_Release_time
	 * @param Notice_status
	 * @param Notice_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateNoticeandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateNoticeandFile(@RequestParam("file")MultipartFile file,String Notice_id,
			String Notice_Title,String Notice_Introduction,
			String Notice_KeyWords,String Notice_Release_time,String Notice_status,
			String Notice_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的通知公告
		Notice notice = new Notice();
		notice = noticeService.getNoticeDetailByid(Notice_id);
		if(notice == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/NoticeimagePage")+"\\"+notice.getNotice_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/NoticeimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		notice.setNotice_context(Notice_context);
		notice.setNotice_Creater("admin");
		notice.setNotice_Createtime(news_Createtime);
		notice.setNotice_Introduction(Notice_Introduction);
		notice.setNotice_KeyWords(Notice_KeyWords);
		notice.setNotice_Release_time(Notice_Release_time);
		notice.setNotice_status(Notice_status);
		notice.setNotice_titile(Notice_Title);
		notice.setNotice_title_page(filenewName);
		noticeService.updateNotice(notice);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteNotice")
	@ResponseBody
	public Map<String,Object> deleteNotice(String Notice_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Notice_id == null || "".equals(Notice_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Notice
		Notice notice = noticeService.getNoticeDetailByid(Notice_id);
		if(notice == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		noticeService.deleteNotice(Notice_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/NoticeimagePage")+"\\"+notice.getNotice_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
