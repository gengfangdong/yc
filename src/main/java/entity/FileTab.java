package entity;

import java.io.Serializable;

/**
 *  FILEID	N	VARCHAR2(64)	N			文件id
	FILENEW	N	VARCHAR2(100)	N			新的文件名
	FILENAME	N	VARCHAR2(200)	Y			文件名字
	FILEOLD	N	VARCHAR2(100)	N			旧的文件名
	FILEISDELETE	N	VARCHAR2(4)	N			文件是否删除 0为未删除 1为已删除
	FILECREATER	N	VARCHAR2(64)	N			文件创建人
	FILECREATETIME	N	VARCHAR2(100)	N			文件创建时间
	FILEFLAG	N	VARCHAR2(4)	N			文件标志 0为富文本编辑器 1为后台

 * @author my
 *
 */
public class FileTab implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4825561695744814078L;
	private String fileid;
	private String filename;
	private String filenew;
	private String fileold;
	private String fileisdelete;
	private String filecreater;
	private String filecreatetime;
	private String fileflag;
	
	public FileTab() {
		super();
	}
	public String getFileid() {
		return fileid;
	}
	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	public String getFilenew() {
		return filenew;
	}
	public void setFilenew(String filenew) {
		this.filenew = filenew;
	}
	public String getFileold() {
		return fileold;
	}
	public void setFileold(String fileold) {
		this.fileold = fileold;
	}
	public String getFileisdelete() {
		return fileisdelete;
	}
	public void setFileisdelete(String fileisdelete) {
		this.fileisdelete = fileisdelete;
	}
	public String getFilecreater() {
		return filecreater;
	}
	public void setFilecreater(String filecreater) {
		this.filecreater = filecreater;
	}
	public String getFilecreatetime() {
		return filecreatetime;
	}
	public void setFilecreatetime(String filecreatetime) {
		this.filecreatetime = filecreatetime;
	}
	public String getFileflag() {
		return fileflag;
	}
	public void setFileflag(String fileflag) {
		this.fileflag = fileflag;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
