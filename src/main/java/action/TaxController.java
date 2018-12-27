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
import entity.Tax;
import service.TaxService;
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
@RequestMapping("/Tax")
public class TaxController {
	
	@Autowired
	private TaxService taxService;
	
	
	/**
	 * 新闻封面上传
	 */
	
	@RequestMapping(value="/uploadTitlePage",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(@RequestParam("file") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		//结果map 存放封面名字和上传状态
		Map<String,Object> resultmap = new HashMap<String, Object>();
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/TaximagePage"));
		String taxName="";
		try {
			taxName = fileUpload.uploadFile(file, fileFileName,request.getRealPath("/TaximagePage")+"/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(taxName);
		resultmap.put("filename", fileFileName);
		resultmap.put("code", 0);
		return resultmap;
		
	}
	/**
	 *新的新闻上传   图片和表单同时上传 
	 */
	@RequestMapping(value="/saveTaxandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertTaxandFile(@RequestParam("file") MultipartFile file,
			String Tax_Title,String Tax_Introduction,
			String Tax_KeyWords,String Tax_Release_time,String Tax_status,
			String Tax_context,HttpServletRequest request,HttpServletResponse response){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		if(file.isEmpty()){
			resultMap.put("code", 2);//没有选择图片
			return resultMap;
		}
		//上传封面
		FileUtil fileUpload = new FileUtil();
		String fileFileName=file.getOriginalFilename();
		//System.out.println(request.getRealPath("/TaximagePage"));
		String taxName="";
		try{
			taxName=fileUpload.uploadFile(file, fileFileName,request.getRealPath("/TaximagePage"));
		}catch(IOException e){
			e.printStackTrace();
			resultMap.put("code", 3);//上传失败
			return resultMap;
		}
		System.out.println(taxName);
		//构建新闻对象
		Tax tax = new Tax();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String tax_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		tax.setTax_context(Tax_context);
		tax.setTax_Creater("admin");
		tax.setTax_Createtime(tax_Createtime);
		tax.setTax_id(UUIDUtil.getUUid("tax"));
		tax.setTax_Introduction(Tax_Introduction);
		tax.setTax_KeyWords(Tax_KeyWords);
		tax.setTax_Release_time(Tax_Release_time);
		tax.setTax_status(Tax_status);
		tax.setTax_titile(Tax_Title);
		tax.setTax_title_page(taxName);
		taxService.insertTax(tax);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	/**
	 * 新闻保存
	 * 
	 */
	@RequestMapping(value="/saveTax",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> InsertTax(String Tax_Title,String Tax_Introduction,
			String Tax_KeyWords,String Tax_Release_time,String Tax_status,
			String Tax_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		Tax tax = new Tax();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String tax_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		tax.setTax_context(Tax_context);
		tax.setTax_Creater("admin");
		tax.setTax_Createtime(tax_Createtime);
		tax.setTax_id(UUIDUtil.getUUid("tax"));
		tax.setTax_Introduction(Tax_Introduction);
		tax.setTax_KeyWords(Tax_KeyWords);
		tax.setTax_Release_time(Tax_Release_time);
		tax.setTax_status(Tax_status);
		tax.setTax_titile(Tax_Title);
		tax.setTax_title_page(filename);
		taxService.insertTax(tax);

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
	public DatatablesViewPage<Tax> GetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Tax> datatablesViewPage = new DatatablesViewPage<Tax>();
		datatablesViewPage = taxService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param tax_id
	 * @return json
	 */
	@RequestMapping(value = "/getTaxdetailByid")
	@ResponseBody
	public Map<String,Object> GetTaxDetailByid(@RequestParam("tax_id")String tax_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Tax tax = new Tax();
		if(tax_id == null || "".equals(tax_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		tax = taxService.getTaxDetailByid(tax_id);
		if(tax == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", tax); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 查看新闻的封面图片
	 * @param request
	 * @param response
	 * @param tax_id
	 * @throws IOException
	 */
	@RequestMapping("/Tax_title_page_Show")
	public void bmpShow(HttpServletRequest request,HttpServletResponse response,@RequestParam("tax_id")String tax_id) throws IOException {
		Tax tax = new Tax();
		tax = taxService.getTaxDetailByid(tax_id);
		 
        String imagePath = request.getRealPath("/TaximagePage")+"/"+tax.getTax_title_page();
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
	 * @param Tax_id
	 * @param Tax_Title
	 * @param Tax_Introduction
	 * @param Tax_KeyWords
	 * @param Tax_Release_time
	 * @param Tax_status
	 * @param Tax_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateTax",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateTax(String Tax_id,String Tax_Title,String Tax_Introduction,
			String Tax_KeyWords,String Tax_Release_time,String Tax_status,
			String Tax_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取已经存在的新闻
		Tax tax = new Tax();
		tax = taxService.getTaxDetailByid(Tax_id);
		if(tax == null){
			resultMap.put("success", false);
			resultMap.put("message", 0);
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String tax_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		tax.setTax_context(Tax_context);
		tax.setTax_Creater("admin");
		tax.setTax_Createtime(tax_Createtime);
		tax.setTax_Introduction(Tax_Introduction);
		tax.setTax_KeyWords(Tax_KeyWords);
		tax.setTax_Release_time(Tax_Release_time);
		tax.setTax_status(Tax_status);
		tax.setTax_titile(Tax_Title);
		tax.setTax_title_page(filename);
		taxService.updateTax(tax);
		
		resultMap.put("success", true);
		resultMap.put("message", 1);
		return resultMap;
		
	}
	
	/**
	 * 更新新闻内容和文件
	 * @param file
	 * @param Tax_id
	 * @param Tax_Title
	 * @param Tax_Introduction
	 * @param Tax_KeyWords
	 * @param Tax_Release_time
	 * @param Tax_status
	 * @param Tax_context
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/updateTaxandFile",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateTaxandFile(@RequestParam("file")MultipartFile file,String Tax_id,
			String Tax_Title,String Tax_Introduction,
			String Tax_KeyWords,String Tax_Release_time,String Tax_status,
			String Tax_context,String filename,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//文件组件
		FileUtil fileUpload = new FileUtil();
		//获取已经存在的新闻
		Tax tax = new Tax();
		tax = taxService.getTaxDetailByid(Tax_id);
		if(tax == null){

			resultMap.put("code", 0);
			return resultMap;
		}
		String filenewName=filename;
		if(!file.isEmpty()){
			fileUpload.delete(request.getRealPath("/TaximagePage")+"\\"+tax.getTax_title_page());
			try {
				filenewName=fileUpload.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/TaximagePage"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

				resultMap.put("code", 3);
				return resultMap;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String tax_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		tax.setTax_context(Tax_context);
		tax.setTax_Creater("admin");
		tax.setTax_Createtime(tax_Createtime);
		tax.setTax_Introduction(Tax_Introduction);
		tax.setTax_KeyWords(Tax_KeyWords);
		tax.setTax_Release_time(Tax_Release_time);
		tax.setTax_status(Tax_status);
		tax.setTax_titile(Tax_Title);
		tax.setTax_title_page(filenewName);
		taxService.updateTax(tax);

		resultMap.put("code", 1);
		return resultMap;
		
	}
	
	
	@RequestMapping("/deleteTax")
	@ResponseBody
	public Map<String,Object> deleteTax(String Tax_id,HttpServletRequest request){
		//返回的结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(Tax_id == null || "".equals(Tax_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		//获取要删除的Tax
		Tax tax = taxService.getTaxDetailByid(Tax_id);
		if(tax == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取新闻失败
			return resultMap;
		}
		taxService.deleteTax(Tax_id);
		//删除对应的封面
		FileUtil fileUtil = new FileUtil();
		fileUtil.delete(request.getRealPath("/TaximagePage")+"\\"+tax.getTax_title_page());
		resultMap.put("success", true);
		resultMap.put("message", "2");//成功
		return resultMap;
	}
	
	
}
