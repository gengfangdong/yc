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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import service.RulesService;
import util.FileUtil;
import util.UUIDUtil;
import entity.DatatablesViewPage;
import entity.Rules;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/Rules")
public class RulesController {
	
	@Autowired
	private RulesService rulesService;
	
	
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
		String rulesName="";
		try {
			rulesName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/RulesimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(rulesName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的通知公告上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveRulesandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertRulesandFile(@RequestParam("file") MultipartFile file,
			String Rules_Title,String Rules_Introduction,
			String Rules_KeyWords,String Rules_Release_time,String Rules_status,
			String Rules_context,HttpServletRequest request,HttpServletResponse response){
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
		String rulesName="";
		try{
			rulesName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/RulesimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(rulesName);
		//构建通知公告对象
		Rules rules = new Rules();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String rules_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		rules.setRules_context(Rules_context);
		rules.setRules_Creater("admin");
		rules.setRules_Createtime(rules_Createtime);
		rules.setRules_id(UUIDUtil.getUUid("rules"));
		rules.setRules_Introduction(Rules_Introduction);
		rules.setRules_KeyWords(Rules_KeyWords);
		rules.setRules_Release_time(Rules_Release_time);
		rules.setRules_status(Rules_status);
		rules.setRules_titile(Rules_Title);
		rules.setRules_title_page(rulesName);
		rulesService.insertRules(rules);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 通知公告保存
	 * 
	 */
	@RequestMapping(value="/saveRules",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertRules(String Rules_Title,String Rules_Introduction,
			String Rules_KeyWords,String Rules_Release_time,String Rules_status,
			String Rules_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Rules rules = new Rules();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String rules_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		rules.setRules_context(Rules_context);
		rules.setRules_Creater("admin");
		rules.setRules_Createtime(rules_Createtime);
		rules.setRules_id(UUIDUtil.getUUid("rules"));
		rules.setRules_Introduction(Rules_Introduction);
		rules.setRules_KeyWords(Rules_KeyWords);
		rules.setRules_Release_time(Rules_Release_time);
		rules.setRules_status(Rules_status);
		rules.setRules_titile(Rules_Title);
		rules.setRules_title_page(filename);
		rulesService.insertRules(rules);

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
	public DatatablesViewPage<Rules> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Rules> datatablesViewPage = new DatatablesViewPage<Rules>();
		datatablesViewPage = rulesService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取通知公告的内容
	 * @param news_id
	 * @return json
	 */
	@RequestMapping(value = "/getRulesdetailByid")
	@ResponseBody
	public Map<String,Object> GetRulesDetailByid(@RequestParam("rules_id")String rules_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Rules rules = new Rules();
		if(rules_id == null || "".equals(rules_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		rules = rulesService.getRulesDetailByid(rules_id);
		if(rules == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", rules); //请求成功
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
	@RequestMapping("/Rules_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("rules_id")String rules_id) throws IOException {
		Rules rules = new Rules();
		rules = rulesService.getRulesDetailByid(rules_id);
		String imagepath = request.getRealPath("/RulesimagePage");
		String newpath = imagepath.replace("ssmtest", "file");//上传到webapp下
        String imagePath = newpath+"\\"+rules.getRules_title_page();
        //String imagePath = request.getRealPath("/RulesimagePage")+"/"+rules.getRules_title_page();
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
	 * @param Rules_id
	 * @param Rules_Title
	 * @param Rules_Introduction
	 * @param Rules_KeyWords
	 * @param Rules_Release_time
	 * @param Rules_status
	 * @param Rules_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateRules",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateRules(String Rules_id,String Rules_Title,String Rules_Introduction,
			String Rules_KeyWords,String Rules_Release_time,String Rules_status,
			String Rules_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的通知公告
		Rules rules = new Rules();
		rules = rulesService.getRulesDetailByid(Rules_id);
		if(rules == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		rules.setRules_context(Rules_context);
		rules.setRules_Creater("admin");
		rules.setRules_Createtime(news_Createtime);
		rules.setRules_Introduction(Rules_Introduction);
		rules.setRules_KeyWords(Rules_KeyWords);
		rules.setRules_Release_time(Rules_Release_time);
		rules.setRules_status(Rules_status);
		rules.setRules_titile(Rules_Title);
		rules.setRules_title_page(filename);
		rulesService.updateRules(rules);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	

	/**
	 *  更新通知公告内容和文件
	 * @param file
	 * @param Rules_id
	 * @param Rules_Title
	 * @param Rules_Introduction
	 * @param Rules_KeyWords
	 * @param Rules_Release_time
	 * @param Rules_status
	 * @param Rules_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateRulesandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateRulesandFile(@RequestParam("file")MultipartFile file,String Rules_id,
			String Rules_Title,String Rules_Introduction,
			String Rules_KeyWords,String Rules_Release_time,String Rules_status,
			String Rules_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的通知公告
		Rules rules = new Rules();
		rules = rulesService.getRulesDetailByid(Rules_id);
		if(rules == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/RulesimagePage")+"\\"+rules.getRules_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/RulesimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		rules.setRules_context(Rules_context);
		rules.setRules_Creater("admin");
		rules.setRules_Createtime(news_Createtime);
		rules.setRules_Introduction(Rules_Introduction);
		rules.setRules_KeyWords(Rules_KeyWords);
		rules.setRules_Release_time(Rules_Release_time);
		rules.setRules_status(Rules_status);
		rules.setRules_titile(Rules_Title);
		rules.setRules_title_page(filenewName);
		rulesService.updateRules(rules);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteRules")
	@ResponseBody
	public Map<String,Object> deleteRules(String Rules_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Rules_id == null || "".equals(Rules_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Rules
		Rules rules = rulesService.getRulesDetailByid(Rules_id);
		if(rules == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		rulesService.deleteRules(Rules_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/RulesimagePage")+"\\"+rules.getRules_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
}
