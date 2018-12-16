package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;
import util.PropertiesUtil;

@RestController
@RequestMapping("/Common")
public class CommonController {

	@RequestMapping("/uploadFile")
	@ResponseBody
	public Map<String,Object> upload(@RequestParam("upload") MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> resultmap=new HashMap<String, Object>();
		String path=PropertiesUtil.getProperty("ckeditor_uploadurl");
		FileUtil fileUtil = new FileUtil();
		String filenewName="";
		try {
			filenewName=fileUtil.uploadFile(file, file.getOriginalFilename(),request.getRealPath("/uploadFile"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultmap.put("uploaded", "1");
		resultmap.put("fileName", filenewName);
		resultmap.put("url", path+"?filename="+filenewName);
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
        String imagePath = request.getRealPath("/uploadFile")+"\\"+filenewName;
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
}
