/**
 * 
 */
package util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import entity.ApplyUnit;

/**
 * @author: my
 * @Package: com.yc.util
 * @date: 2018年12月5日 上午9:47:34
 * @ClassName:tFileUpload
 */
public class FileUtil {
	
	private String filePath="/file/";
	private String getExt(String fileName){
		return fileName.substring(fileName.lastIndexOf(".")+1);
	}
	private String createFileName(String fileName){	
		return UUID.randomUUID().toString()+"."+getExt(fileName);
	}
	
	public String delete(String fileName){
		
		File file=new File(fileName);
		if (file.exists()) {
		    //"删除文件失败："+fName+"文件不存在";
			System.out.println("文件存在！");
		}
		if (file.delete()) {
             System.out.println("删除单个文件" + fileName + "成功！");
             return "1";
             
         } else {
             System.out.println("删除单个文件" + fileName + "失败！");
             return "2";
         }
		 
	}
	public String uploadFile(MultipartFile file,String fileName,String path) throws IOException{
		if(path!=null){
			filePath=path;
		}
		fileName = createFileName(fileName);
		return this.uploadFile(file, fileName);
	}
	
	public String uploadFileold(MultipartFile file,String fileName,String path) throws IOException{
		if(path!=null){
			filePath=path;
		}
		return this.uploadFile(file, fileName);
	}
	public String uploadFile(MultipartFile file,String fileName) throws IOException{
		//String newName=createFileName(fileName);
		String name=filePath+"\\"+fileName;
		File filepath = new File(filePath);
		if(!filepath.exists()){
			filepath.mkdir();
		}
		//System.out.println(name);
		File filenew = new File(name);
		if(!filenew.exists()){
		    
		    filenew.createNewFile();

		}
	
		file.transferTo(new File(name));	   
		return fileName;
	}
	
	public ResponseEntity<byte[]> download(String downloadFilePath,String FileName,HttpHeaders headers ) throws IOException{

        File file = new File(downloadFilePath);//新建一个文件
        
        String downloadFileName = new String(FileName.getBytes("UTF-8"),"iso-8859-1");//设置编码
        headers.setContentDispositionFormData("attachment", downloadFileName);  
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
        
    }
}
