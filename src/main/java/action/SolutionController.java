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
import entity.Solution;
import service.SolutionService;
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
@RequestMapping("/Solution")
public class SolutionController {
	
	@Autowired
	private SolutionService solutionService;
	
	
	/**
	 * 新闻封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/SolutionimagePage"));
		String solutionName="";
		try {
			solutionName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/SolutionimagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(solutionName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的新闻上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveSolutionandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertSolutionandFile(@RequestParam("file") MultipartFile file,
			String Solution_Title,String Solution_Introduction,
			String Solution_KeyWords,String Solution_Release_time,String Solution_status,
			String Solution_context,HttpServletRequest request,HttpServletResponse response){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		if(file.isEmpty()){
			resultMap.put("code", 2);//没有选择图片
			return resultMap;
		}
		//上传封面
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/SolutionimagePage"));
		String solutionName="";
		try{
			solutionName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/SolutionimagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(solutionName);
		//构建新闻对象
		Solution solution = new Solution();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String solution_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		solution.setSolution_context(Solution_context);
		solution.setSolution_Creater("admin");
		solution.setSolution_Createtime(solution_Createtime);
		solution.setSolution_id(UUIDUtil.getUUid("solution"));
		solution.setSolution_Introduction(Solution_Introduction);
		solution.setSolution_KeyWords(Solution_KeyWords);
		solution.setSolution_Release_time(Solution_Release_time);
		solution.setSolution_status(Solution_status);
		solution.setSolution_titile(Solution_Title);
		solution.setSolution_title_page(solutionName);
		solutionService.insertSolution(solution);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 新闻保存
	 * 
	 */
	@RequestMapping(value="/saveSolution",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertSolution(String Solution_Title,String Solution_Introduction,
			String Solution_KeyWords,String Solution_Release_time,String Solution_status,
			String Solution_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Solution solution = new Solution();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String solution_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		solution.setSolution_context(Solution_context);
		solution.setSolution_Creater("admin");
		solution.setSolution_Createtime(solution_Createtime);
		solution.setSolution_id(UUIDUtil.getUUid("solution"));
		solution.setSolution_Introduction(Solution_Introduction);
		solution.setSolution_KeyWords(Solution_KeyWords);
		solution.setSolution_Release_time(Solution_Release_time);
		solution.setSolution_status(Solution_status);
		solution.setSolution_titile(Solution_Title);
		solution.setSolution_title_page(filename);
		solutionService.insertSolution(solution);

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
	public DatatablesViewPage<Solution> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Solution> datatablesViewPage = new DatatablesViewPage<Solution>();
		datatablesViewPage = solutionService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param solution_id
	 * @return json
	 */
	@RequestMapping(value = "/getSolutiondetailByid")
	@ResponseBody
	public Map<String,Object> GetSolutionDetailByid(@RequestParam("solution_id")String solution_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Solution solution = new Solution();
		if(solution_id == null || "".equals(solution_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		solution = solutionService.getSolutionDetailByid(solution_id);
		if(solution == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", solution); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看新闻的封面图片
	 * @param request
	 * @param response
	 * @param solution_id
	 * @throws IOException
	 */
	@RequestMapping("/Solution_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("solution_id")String solution_id) throws IOException {
		Solution solution = new Solution();
		solution = solutionService.getSolutionDetailByid(solution_id);
		String imagepath = request.getRealPath("/SolutionimagePage");
		String newpath = imagepath.replace("ssmtest", "file");//上传到webapp下
        String imagePath = newpath+"\\"+solution.getSolution_title_page();
        //String imagePath = request.getRealPath("/SolutionimagePage")+"/"+solution.getSolution_title_page();
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
	 * @param Solution_id
	 * @param Solution_Title
	 * @param Solution_Introduction
	 * @param Solution_KeyWords
	 * @param Solution_Release_time
	 * @param Solution_status
	 * @param Solution_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateSolution",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateSolution(String Solution_id,String Solution_Title,String Solution_Introduction,
			String Solution_KeyWords,String Solution_Release_time,String Solution_status,
			String Solution_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的新闻
		Solution solution = new Solution();
		solution = solutionService.getSolutionDetailByid(Solution_id);
		if(solution == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String solution_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		solution.setSolution_context(Solution_context);
		solution.setSolution_Creater("admin");
		solution.setSolution_Createtime(solution_Createtime);
		solution.setSolution_Introduction(Solution_Introduction);
		solution.setSolution_KeyWords(Solution_KeyWords);
		solution.setSolution_Release_time(Solution_Release_time);
		solution.setSolution_status(Solution_status);
		solution.setSolution_titile(Solution_Title);
		solution.setSolution_title_page(filename);
		solutionService.updateSolution(solution);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 更新新闻内容和文件
	 * @param file
	 * @param Solution_id
	 * @param Solution_Title
	 * @param Solution_Introduction
	 * @param Solution_KeyWords
	 * @param Solution_Release_time
	 * @param Solution_status
	 * @param Solution_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateSolutionandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateSolutionandFile(@RequestParam("file")MultipartFile file,String Solution_id,
			String Solution_Title,String Solution_Introduction,
			String Solution_KeyWords,String Solution_Release_time,String Solution_status,
			String Solution_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的新闻
		Solution solution = new Solution();
		solution = solutionService.getSolutionDetailByid(Solution_id);
		if(solution == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/SolutionimagePage")+"\\"+solution.getSolution_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/SolutionimagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String solution_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		solution.setSolution_context(Solution_context);
		solution.setSolution_Creater("admin");
		solution.setSolution_Createtime(solution_Createtime);
		solution.setSolution_Introduction(Solution_Introduction);
		solution.setSolution_KeyWords(Solution_KeyWords);
		solution.setSolution_Release_time(Solution_Release_time);
		solution.setSolution_status(Solution_status);
		solution.setSolution_titile(Solution_Title);
		solution.setSolution_title_page(filenewName);
		solutionService.updateSolution(solution);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteSolution")
	@ResponseBody
	public Map<String,Object> deleteSolution(String Solution_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Solution_id == null || "".equals(Solution_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Solution
		Solution solution = solutionService.getSolutionDetailByid(Solution_id);
		if(solution == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		solutionService.deleteSolution(Solution_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/SolutionimagePage")+"\\"+solution.getSolution_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
	
	
}
