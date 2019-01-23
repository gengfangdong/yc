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
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.FileTab;
import entity.IUser;
import entity.LayuiDataTable;
import entity.MemProjectVo;
import service.FigClassService;
import service.FileTabService;
import util.FileUtil;
import util.PropertiesUtil;
import util.UUIDUtil;

@RestController
@RequestMapping("/Common")
public class CommonController {
	@Autowired
	private FigClassService figClssService;
	@Autowired
	private FileTabService fileTabService;
	private static Logger logger = Logger.getLogger(CommonController.class);//参数里面的类名称是logger所在类的名称
	@RequestMapping("/uploadFile")
	@ResponseBody
	public Map<String,Object> upload(@RequestParam("upload") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultmap=new HashMap<String, Object>();
		String pathname = request.getSession().getServletContext().getRealPath("/");
		String newpath = pathname.replace("ssmtest", "file");
		logger.info(newpath);
		String path=PropertiesUtil.getProperty("ckeditor_uploadurl");
		FileUtil fileUtil = new FileUtil();
		String filenewName="";
		try {
			filenewName=fileUtil.uploadFile(file, file.getOriginalFilename(),newpath+"\\"+"uploadFile");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultmap.put("uploaded", "1");
		resultmap.put("fileName", filenewName);
		resultmap.put("url", path+"?filename="+filenewName);
		return resultmap;
	}
	@RequestMapping("/uploadFileceditor")
	@ResponseBody
	public Map<String,Object> uploadfile(@RequestParam("upload") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultmap=new HashMap<String, Object>();
		IUser iUser = (IUser) request.getSession().getAttribute("user");
		String userid = "admin";
		if(iUser!=null){
			userid = iUser.getUser_id();
		}
		String pathname = request.getSession().getServletContext().getRealPath("/");
		String newpath = pathname.replace("ssmtest", "file");
		logger.info(newpath);
		String path=PropertiesUtil.getProperty("ckeditor_uploadfileurl");
		FileUtil fileUtil = new FileUtil();
		String filenewName="";
		String oldname = file.getOriginalFilename();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		try {
			filenewName=fileUtil.uploadFile(file, file.getOriginalFilename(),newpath+"\\"+"uploadFile");
			FileTab fileTab = new FileTab();
			fileTab.setFilecreater(userid);
			fileTab.setFileflag("0");
			fileTab.setFileid(UUIDUtil.getUUid("file"));
			fileTab.setFileisdelete("0");
			fileTab.setFilenew(filenewName);
			fileTab.setFileold(oldname);
			fileTab.setFilename("");
			fileTab.setFilecreatetime(About_Createtime);
			fileTabService.insertFile(fileTab);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultmap.put("uploaded", "1");
		resultmap.put("fileName", filenewName);
		resultmap.put("url", path+"/"+filenewName);
		return resultmap;
	}
	
	/**
	 * 查看新闻的封面图片
	 * @param request
	 * @param response
	 * @param news_id
	 * @throws IOException
	 */
	@RequestMapping("/image_Show")
	public void image_Show(HttpServletRequest request,HttpServletResponse response,@RequestParam("filename")String filenewName) throws IOException {
		String pathname = request.getSession().getServletContext().getRealPath("/");
		String newpath = pathname.replace("ssmtest", "file");
		logger.info(newpath);
		String imagePath = newpath+"\\"+"uploadFile"+"\\"+filenewName;
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
	@RequestMapping("/memProject")
	public LayuiDataTable<MemProjectVo> getAllProject(@RequestParam(value="caogery",required=false,defaultValue="")String caogery,
			@RequestParam(value="status",required=false,defaultValue="")String status,
			@RequestParam("page")int page,@RequestParam("limit")int limit,HttpServletRequest request){
		//获取登录人
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user"); 
		LayuiDataTable<MemProjectVo> layuiDataTable = new LayuiDataTable<MemProjectVo>();
		layuiDataTable = figClssService.getMemProjectByuser(caogery, status, iUser.getUser_id(), page, limit);
		return layuiDataTable;
	}
	
	@RequestMapping(value="/download/{filename:.+}") //匹配的是href中的download请求 带后缀名的那种
    public ResponseEntity<byte[]> download(HttpServletRequest request,@PathVariable String filename) throws IOException{
    	
    	
        FileUtil fileUtil = new FileUtil();
        HttpHeaders headers = new HttpHeaders();
        String fileold = fileTabService.getBynew(filename).getFileold();
        return fileUtil.download(request.getRealPath("/uploadFile")+"\\"+filename, fileold,headers);        
    }
}
