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
import entity.RotationPic;
import service.RotationPicService;
import util.FileUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/RotationPic")
public class RotationPicController {
	
	@Autowired
	private RotationPicService RotationPicService;
	
	
	/**
	 * 轮播图片封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/NewimagePage"));
		String RotationPicName="";
		try {
			RotationPicName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/RotationPicimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(RotationPicName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的轮播图片上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveRotationPicandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertRotationPicandFile(@RequestParam("file") MultipartFile file,
			String RotationPic_Title,String RotationPic_Introduction,
			String RotationPic_KeyWords,String RotationPic_Release_time,String RotationPic_status,
			String RotationPic_context,HttpServletRequest request,HttpServletResponse response){
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
		String RotationPicName="";
		try{
			RotationPicName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/RotationPicimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(RotationPicName);
		//构建轮播图片对象
		RotationPic RotationPic = new RotationPic();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String RotationPic_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		RotationPic.setRotationPic_context(RotationPic_context);
		RotationPic.setRotationPic_Creater("admin");
		RotationPic.setRotationPic_Createtime(RotationPic_Createtime);
		RotationPic.setRotationPic_id(UUIDUtil.getUUid("RotationPic"));
		RotationPic.setRotationPic_Introduction(RotationPic_Introduction);
		RotationPic.setRotationPic_KeyWords(RotationPic_KeyWords);
		RotationPic.setRotationPic_Release_time(RotationPic_Release_time);
		RotationPic.setRotationPic_status(RotationPic_status);
		RotationPic.setRotationPic_titile(RotationPic_Title);
		RotationPic.setRotationPic_title_page(RotationPicName);
		RotationPicService.insertRotationPic(RotationPic);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 轮播图片保存
	 * 
	 */
	@RequestMapping(value="/saveRotationPic",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertRotationPic(String RotationPic_Title,String RotationPic_Introduction,
			String RotationPic_KeyWords,String RotationPic_Release_time,String RotationPic_status,
			String RotationPic_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		RotationPic RotationPic = new RotationPic();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String RotationPic_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		RotationPic.setRotationPic_context(RotationPic_context);
		RotationPic.setRotationPic_Creater("admin");
		RotationPic.setRotationPic_Createtime(RotationPic_Createtime);
		RotationPic.setRotationPic_id(UUIDUtil.getUUid("RotationPic"));
		RotationPic.setRotationPic_Introduction(RotationPic_Introduction);
		RotationPic.setRotationPic_KeyWords(RotationPic_KeyWords);
		RotationPic.setRotationPic_Release_time(RotationPic_Release_time);
		RotationPic.setRotationPic_status(RotationPic_status);
		RotationPic.setRotationPic_titile(RotationPic_Title);
		RotationPic.setRotationPic_title_page(filename);
		RotationPicService.insertRotationPic(RotationPic);

		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 轮播图片列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlist")
	@ResponseBody
	public DatatablesViewPage<RotationPic> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<RotationPic> datatablesViewPage = new DatatablesViewPage<RotationPic>();
		datatablesViewPage = RotationPicService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取轮播图片的内容
	 * @param RotationPic_id
	 * @return json
	 */
	@RequestMapping(value = "/getRotationPicdetailByid")
	@ResponseBody
	public Map<String,Object> GetRotationPicDetailByid(@RequestParam("RotationPic_id")String RotationPic_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		RotationPic RotationPic = new RotationPic();
		if(RotationPic_id == null || "".equals(RotationPic_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		RotationPic = RotationPicService.getRotationPicDetailByid(RotationPic_id);
		if(RotationPic == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", RotationPic); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看轮播图片的封面图片
	 * @param request
	 * @param response
	 * @param RotationPic_id
	 * @throws IOException
	 */
	@RequestMapping("/RotationPic_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("RotationPic_id")String RotationPic_id) throws IOException {
		RotationPic RotationPic = new RotationPic();
		RotationPic = RotationPicService.getRotationPicDetailByid(RotationPic_id);
		 
        String imagePath = request.getRealPath("/RotationPicimagePage")+"/"+RotationPic.getRotationPic_title_page();
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
	
	
	/** 更新轮播图片
	 * @param RotationPic_id
	 * @param RotationPic_Title
	 * @param RotationPic_Introduction
	 * @param RotationPic_KeyWords
	 * @param RotationPic_Release_time
	 * @param RotationPic_status
	 * @param RotationPic_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateRotationPic",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateRotationPic(String RotationPic_id,String RotationPic_Title,String RotationPic_Introduction,
			String RotationPic_KeyWords,String RotationPic_Release_time,String RotationPic_status,
			String RotationPic_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的轮播图片
		RotationPic RotationPic = new RotationPic();
		RotationPic = RotationPicService.getRotationPicDetailByid(RotationPic_id);
		if(RotationPic == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String RotationPic_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		RotationPic.setRotationPic_context(RotationPic_context);
		RotationPic.setRotationPic_Creater("admin");
		RotationPic.setRotationPic_Createtime(RotationPic_Createtime);
		RotationPic.setRotationPic_Introduction(RotationPic_Introduction);
		RotationPic.setRotationPic_KeyWords(RotationPic_KeyWords);
		RotationPic.setRotationPic_Release_time(RotationPic_Release_time);
		RotationPic.setRotationPic_status(RotationPic_status);
		RotationPic.setRotationPic_titile(RotationPic_Title);
		RotationPic.setRotationPic_title_page(filename);
		RotationPicService.updateRotationPic(RotationPic);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	

	/**
	 *  更新轮播图片内容和文件
	 * @param file
	 * @param RotationPic_id
	 * @param RotationPic_Title
	 * @param RotationPic_Introduction
	 * @param RotationPic_KeyWords
	 * @param RotationPic_Release_time
	 * @param RotationPic_status
	 * @param RotationPic_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateRotationPicandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateRotationPicandFile(@RequestParam("file")MultipartFile file,String RotationPic_id,
			String RotationPic_Title,String RotationPic_Introduction,
			String RotationPic_KeyWords,String RotationPic_Release_time,String RotationPic_status,
			String RotationPic_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的轮播图片
		RotationPic RotationPic = new RotationPic();
		RotationPic = RotationPicService.getRotationPicDetailByid(RotationPic_id);
		if(RotationPic == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/RotationPicimagePage")+"\\"+RotationPic.getRotationPic_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/RotationPicimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String RotationPic_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		RotationPic.setRotationPic_context(RotationPic_context);
		RotationPic.setRotationPic_Creater("admin");
		RotationPic.setRotationPic_Createtime(RotationPic_Createtime);
		RotationPic.setRotationPic_Introduction(RotationPic_Introduction);
		RotationPic.setRotationPic_KeyWords(RotationPic_KeyWords);
		RotationPic.setRotationPic_Release_time(RotationPic_Release_time);
		RotationPic.setRotationPic_status(RotationPic_status);
		RotationPic.setRotationPic_titile(RotationPic_Title);
		RotationPic.setRotationPic_title_page(filenewName);
		RotationPicService.updateRotationPic(RotationPic);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteRotationPic")
	@ResponseBody
	public Map<String,Object> deleteRotationPic(String RotationPic_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(RotationPic_id == null || "".equals(RotationPic_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的RotationPic
		RotationPic RotationPic = RotationPicService.getRotationPicDetailByid(RotationPic_id);
		if(RotationPic == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		RotationPicService.deleteRotationPic(RotationPic_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/RotationPicimagePage")+"\\"+RotationPic.getRotationPic_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
