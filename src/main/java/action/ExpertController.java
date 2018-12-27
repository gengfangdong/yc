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
import entity.Expert;
import service.ExpertService;
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
@RequestMapping("/Expert")
public class ExpertController {
	
	@Autowired
	private ExpertService expertService;
	
	
	/**
	 * 新闻封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/ExpertimagePage"));
		String expertName="";
		try {
			expertName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/ExpertimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(expertName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的新闻上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveExpertandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertExpertandFile(@RequestParam("file") MultipartFile file,
			String Expert_Title,String Expert_Introduction,
			String Expert_KeyWords,String Expert_Release_time,String Expert_status,
			String Expert_context,HttpServletRequest request,HttpServletResponse response){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		if(file.isEmpty()){
			resultMap.put("code", 2);//没有选择图片
			return resultMap;
		}
		//上传封面
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/ExpertimagePage"));
		String expertName="";
		try{
			expertName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/ExpertimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(expertName);
		//构建新闻对象
		Expert expert = new Expert();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String expert_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		expert.setExpert_context(Expert_context);
		expert.setExpert_Creater("admin");
		expert.setExpert_Createtime(expert_Createtime);
		expert.setExpert_id(UUIDUtil.getUUid("expert"));
		expert.setExpert_Introduction(Expert_Introduction);
		expert.setExpert_KeyWords(Expert_KeyWords);
		expert.setExpert_Release_time(Expert_Release_time);
		expert.setExpert_status(Expert_status);
		expert.setExpert_titile(Expert_Title);
		expert.setExpert_title_page(expertName);
		expertService.insertExpert(expert);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 新闻保存
	 * 
	 */
	@RequestMapping(value="/saveExpert",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertExpert(String Expert_Title,String Expert_Introduction,
			String Expert_KeyWords,String Expert_Release_time,String Expert_status,
			String Expert_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Expert expert = new Expert();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String expert_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		expert.setExpert_context(Expert_context);
		expert.setExpert_Creater("admin");
		expert.setExpert_Createtime(expert_Createtime);
		expert.setExpert_id(UUIDUtil.getUUid("expert"));
		expert.setExpert_Introduction(Expert_Introduction);
		expert.setExpert_KeyWords(Expert_KeyWords);
		expert.setExpert_Release_time(Expert_Release_time);
		expert.setExpert_status(Expert_status);
		expert.setExpert_titile(Expert_Title);
		expert.setExpert_title_page(filename);
		expertService.insertExpert(expert);

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
	public DatatablesViewPage<Expert> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Expert> datatablesViewPage = new DatatablesViewPage<Expert>();
		datatablesViewPage = expertService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param expert_id
	 * @return json
	 */
	@RequestMapping(value = "/getExpertdetailByid")
	@ResponseBody
	public Map<String,Object> GetExpertDetailByid(@RequestParam("expert_id")String expert_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Expert expert = new Expert();
		if(expert_id == null || "".equals(expert_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		expert = expertService.getExpertDetailByid(expert_id);
		if(expert == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", expert); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看新闻的封面图片
	 * @param request
	 * @param response
	 * @param expert_id
	 * @throws IOException
	 */
	@RequestMapping("/Expert_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("expert_id")String expert_id) throws IOException {
		Expert expert = new Expert();
		expert = expertService.getExpertDetailByid(expert_id);
		 
        String imagePath = request.getRealPath("/ExpertimagePage")+"/"+expert.getExpert_title_page();
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
	 * @param Expert_id
	 * @param Expert_Title
	 * @param Expert_Introduction
	 * @param Expert_KeyWords
	 * @param Expert_Release_time
	 * @param Expert_status
	 * @param Expert_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateExpert",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateExpert(String Expert_id,String Expert_Title,String Expert_Introduction,
			String Expert_KeyWords,String Expert_Release_time,String Expert_status,
			String Expert_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的新闻
		Expert expert = new Expert();
		expert = expertService.getExpertDetailByid(Expert_id);
		if(expert == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String expert_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		expert.setExpert_context(Expert_context);
		expert.setExpert_Creater("admin");
		expert.setExpert_Createtime(expert_Createtime);
		expert.setExpert_Introduction(Expert_Introduction);
		expert.setExpert_KeyWords(Expert_KeyWords);
		expert.setExpert_Release_time(Expert_Release_time);
		expert.setExpert_status(Expert_status);
		expert.setExpert_titile(Expert_Title);
		expert.setExpert_title_page(filename);
		expertService.updateExpert(expert);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 更新新闻内容和文件
	 * @param file
	 * @param Expert_id
	 * @param Expert_Title
	 * @param Expert_Introduction
	 * @param Expert_KeyWords
	 * @param Expert_Release_time
	 * @param Expert_status
	 * @param Expert_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateExpertandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateExpertandFile(@RequestParam("file")MultipartFile file,String Expert_id,
			String Expert_Title,String Expert_Introduction,
			String Expert_KeyWords,String Expert_Release_time,String Expert_status,
			String Expert_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的新闻
		Expert expert = new Expert();
		expert = expertService.getExpertDetailByid(Expert_id);
		if(expert == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/ExpertimagePage")+"\\"+expert.getExpert_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/ExpertimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String expert_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		expert.setExpert_context(Expert_context);
		expert.setExpert_Creater("admin");
		expert.setExpert_Createtime(expert_Createtime);
		expert.setExpert_Introduction(Expert_Introduction);
		expert.setExpert_KeyWords(Expert_KeyWords);
		expert.setExpert_Release_time(Expert_Release_time);
		expert.setExpert_status(Expert_status);
		expert.setExpert_titile(Expert_Title);
		expert.setExpert_title_page(filenewName);
		expertService.updateExpert(expert);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteExpert")
	@ResponseBody
	public Map<String,Object> deleteExpert(String Expert_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Expert_id == null || "".equals(Expert_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Expert
		Expert expert = expertService.getExpertDetailByid(Expert_id);
		if(expert == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		expertService.deleteExpert(Expert_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/ExpertimagePage")+"\\"+expert.getExpert_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
	
	
}
