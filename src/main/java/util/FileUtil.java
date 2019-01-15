/**
 * 
 */
package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import aop.RequestAop;
import entity.ApplyUnit;
import entity.UploadFilevo;

/**
 * @author: my
 * @Package: com.yc.util
 * @date: 2018年12月5日 上午9:47:34
 * @ClassName:tFileUpload
 */
public class FileUtil {
	private static Logger logger = Logger.getLogger(FileUtil.class);//参数里面的类名称是logger所在类的名称
 	private String filePath="/file/";
	private String getExt(String fileName){
		return fileName.substring(fileName.lastIndexOf(".")+1);
	}
	private String createFileName(String fileName){	
		return UUID.randomUUID().toString()+"."+getExt(fileName);
	}
	
	public String delete(String fileName){
		String newpath = fileName.replace("ssmtest", "file");//上传到webapp下
		
		File file=new File(newpath);
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
		logger.info(path);
		if(path!=null){
			filePath=path;
		}
		System.out.println(path);
		
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
		String newpath = name.replace("ssmtest", "file");//上传到webapp下
		logger.info(name);
		logger.info(newpath);
		File filepath = new File(filePath);
		if(!filepath.exists()){
			filepath.mkdir();
		}
		//System.out.println(name);
		File filenew = new File(newpath);
		if(!filenew.exists()){
		    
		    filenew.createNewFile();

		}
	
		file.transferTo(new File(newpath));	   
		return fileName;
	}
	public boolean uploadbatch(List<UploadFilevo> filenamelist,List<MultipartFile> filelist,String path) {
		
		for (MultipartFile multipartFile : filelist) {
			String oldname = multipartFile.getOriginalFilename();
			String filenewname="";
			try {
				filenewname = uploadFile(multipartFile,multipartFile.getOriginalFilename(),path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			UploadFilevo uploadFilevo = new UploadFilevo();
			uploadFilevo.setFilename(filenewname);
			uploadFilevo.setOldfilename(oldname);
			filenamelist.add(uploadFilevo);
		}
		
		return true;
	}
	public ResponseEntity<byte[]> download(String downloadFilePath,String FileName,HttpHeaders headers ) throws IOException{
		String newpath = downloadFilePath.replace("ssmtest", "file");//上传到webapp下、
		logger.info(newpath);
        //File file = new File(downloadFilePath);//新建一个文件
		File file = new File(newpath);//新建一个文件//webapp下
        String downloadFileName = new String(FileName.getBytes("UTF-8"),"iso-8859-1");//设置编码
        headers.setContentDispositionFormData("attachment", downloadFileName);  
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
        
    }
	
	public MultipartFile getFileByname(String filename){
		String newpath = filename.replace("ssmtest", "file");//下载到webapp下
	    //MultipartFile multipartFile = getMulFileByPath(filename);
		logger.info(newpath);
		MultipartFile multipartFile = getMulFileByPath(newpath);

		/*File pdfFile = new File(filename);
		FileInputStream fileInputStream;
		MultipartFile multipartFile = null;
		try {
			fileInputStream = new FileInputStream(pdfFile);
			multipartFile = new MockMultipartFile(pdfFile.getName(), pdfFile.getName(),
					null, fileInputStream);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		return multipartFile;
	}
	
	private static MultipartFile getMulFileByPath(String picPath) {  
        FileItem fileItem = createFileItem(picPath);  
        MultipartFile mfile = new CommonsMultipartFile(fileItem);  
        return mfile;  
    }  
  
    private static FileItem createFileItem(String filePath)  
    {  
        FileItemFactory factory = new DiskFileItemFactory(16, null);  
  
        FileItem item = factory.createItem(null, "text/plain", true, filePath);  
        File newfile = new File(filePath);  
        int bytesRead = 0;  
        byte[] buffer = new byte[8192];  
        try  
        {  
            FileInputStream fis = new FileInputStream(newfile);  
            OutputStream os = item.getOutputStream();  
            while ((bytesRead = fis.read(buffer, 0, 8192))  
                != -1)  
            {  
                os.write(buffer, 0, bytesRead);  
            }  
            os.close();  
            fis.close();  
        }  
        catch (IOException e)  
        {  
            e.printStackTrace();  
        }  
        return item;  
    } 
}
