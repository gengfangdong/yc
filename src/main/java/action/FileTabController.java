package action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.FileTab;
import entity.IUser;
import entity.LayuiDataTable;
import service.FileTabService;
import util.FileUtil;
import util.StringUtil;
import util.UUIDUtil;

@RequestMapping("Filetab")
@RestController
public class FileTabController {
	@Autowired
	private FileTabService fileTabService;
	
	/**
	 * 附件新增
	 * @param file
	 * @param filename
	 * @param request
	 * @return
	 */
	@RequestMapping("/addFile")
	public Map<String,Object> addFile(@RequestParam("file")MultipartFile file,String filename,HttpServletRequest request){
		//结果集
		Map<String,Object> resultmap = new HashMap<>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createtime = simpleDateFormat.format(new Date());
		IUser iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser==null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		//上传文件桑-----第一步  
		FileUtil fileUtil = new FileUtil();
		if(file.isEmpty()){
			resultmap.put("success", false);
			resultmap.put("message", "1");//文件为空
			return resultmap;
		}
		String newname="";
		//开始上传
		try {
			newname = fileUtil.uploadFile(file, file.getOriginalFilename(), request.getSession().getServletContext().getRealPath("/")+"\\"+"uploadFile");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "2");//文件上传失败啊!
			return resultmap;
		}
		//构建实体
		FileTab fileTab = new FileTab();
		fileTab.setFilecreater(iUser.getUser_id());
		fileTab.setFilecreatetime(createtime);
		fileTab.setFileflag("1");//后台上传
		fileTab.setFileid(UUIDUtil.getUUid("file"));
		fileTab.setFileisdelete("0");//未删除啊
		fileTab.setFilename(filename);
		fileTab.setFilenew(newname);
		fileTab.setFileold(file.getOriginalFilename());
		//插入操作
		try{
			fileTabService.insertFile(fileTab);
		}catch(Exception e){
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "3");//增加失败
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("message", "4");//保存成功!
		return resultmap;
	}
	
	
	/**
	 * 删除附件
	 * @param fileid
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteFile")
	public Map<String,Object> deleteFile(String fileid,HttpServletRequest request){
		Map<String,Object> resultmap = new HashMap<>();
		//获取登录人
		IUser iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser==null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		
		try{
			//获取实体
			FileTab fileTab = fileTabService.getbyid(fileid);
			if(fileTab==null){
				resultmap.put("success", false);
				resultmap.put("message", "1");//未获取实体
				return resultmap;
			}
			fileTabService.deleteFile(fileTab.getFileid());
		}catch(Exception e){
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "2");//删除失败
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("message", "3");//删除成功!
		return resultmap;
	}
	/**根据id获取附件
	 * @param fileid
	 * @param request
	 * @return
	 */
	@RequestMapping("/getDetailByid")
	public Map<String,Object> getdetail(String fileid,HttpServletRequest request){
		Map<String,Object> resultmap = new HashMap<>();
		//获取登录人
		IUser iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser==null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		FileTab fileTab = new FileTab();
		try{
			//获取实体
			fileTab= fileTabService.getbyid(fileid);
			if(fileTab==null){
				resultmap.put("success", false);
				resultmap.put("message", "1");//未获取实体
				return resultmap;
			}
		}catch(Exception e){
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "2");//获取失败
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("file", fileTab);//获取成功!
		return resultmap;
	}
	/**
	 * 下载附件
	 * @param request
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/download/{filename:.+}") //匹配的是href中的download请求 带后缀名的那种
    public ResponseEntity<byte[]> download(HttpServletRequest request,@PathVariable String filename) throws IOException{
    	
    	
        FileUtil fileUtil = new FileUtil();
        HttpHeaders headers = new HttpHeaders();
        String fileold = fileTabService.getBynew(filename).getFileold();
        return fileUtil.download(request.getRealPath("/uploadFile")+"\\"+filename, fileold,headers);        
    }
    
    /**
     * 分页获取附件
     * @param page
     * @param limit
     * @param filename
     * @param request
     * @return
     */
    @RequestMapping("/getlistBypage")
    public LayuiDataTable<FileTab> getListBypage(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="filename",required=false,defaultValue="")String filename,
			HttpServletRequest request){
    	LayuiDataTable<FileTab> fDataTable = new LayuiDataTable<>();
    	try{
    		fDataTable = fileTabService.getlistByPage(page, limit, filename, "1");
    	}catch(Exception e){
    		e.printStackTrace();
    		fDataTable.setCount(0);
    		return fDataTable;
    	}
    	fDataTable.setCode(0);
    	fDataTable.setMsg("");
    	return fDataTable;
    }
    
    @RequestMapping("/updatefileTab")
    public Map<String,Object> updatefileTab(@RequestParam(value="file",required=false)MultipartFile file,String fileoldid,String fileid,String filename,HttpServletRequest request){
    	//结果返回
    	Map<String,Object> resultmap = new HashMap<>();
    	//判断是否登录
    	IUser iuser= (IUser) request.getSession().getAttribute("user");
    	if(iuser == null){
    		resultmap.put("success", false);
    		resultmap.put("message", "0");//未登录
    		return resultmap;
    	}
    	//判断文件和旧的文件是否为空
    	if(file!=null&&StringUtil.isblack(fileoldid)){
    		resultmap.put("success", false);
    		resultmap.put("message", "1");//未选择文件
    		return resultmap;
    	}
    	//根据id获取以前的附件
    	FileTab fileTab = new FileTab();
    	try{
    		fileTab = fileTabService.getbyid(fileid);
    	}catch(Exception e){
    		e.printStackTrace();
    		resultmap.put("success", false);
    		resultmap.put("message", "2");//获取文件失败
    		return resultmap;
    	}
    	//获取以前的旧的id
    	String filenew = fileTab.getFilenew();
    	if(fileoldid.equals(filenew)){
    		//代表没有上传文件
    		fileTab.setFilename(filename);
    		try{
    			fileTabService.updateFile(fileTab);
    		}catch(Exception e){
    			e.printStackTrace();
    			resultmap.put("success", false);
        		resultmap.put("message", "3");//更新失败
        		return resultmap;
    		}
    	}else{
    		FileUtil fileUtil = new FileUtil();
    		//上传新的文件
    		String newname="";
    		//开始上传
    		try {
    			newname = fileUtil.uploadFile(file, file.getOriginalFilename(), request.getSession().getServletContext().getRealPath("/")+"\\"+"uploadFile");
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			resultmap.put("success", false);
    			resultmap.put("message", "4");//文件上传失败啊!
    			return resultmap;
    		}
    		fileTab.setFilename(filename);
    		fileTab.setFilenew(newname);
    		fileTab.setFileold(file.getOriginalFilename());
    		try{
    			fileTabService.updateFile(fileTab);
    		}catch(Exception e){
    			e.printStackTrace();
    			resultmap.put("success", false);
        		resultmap.put("message", "3");//更新失败
        		return resultmap;
    		}
    	}
    	resultmap.put("success", true);
    	resultmap.put("message", "5");//修改成功!
    	return resultmap;
    	
    }
}
