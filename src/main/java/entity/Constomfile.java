package entity;

import java.io.Serializable;

/*
 * FREECO_ID	N	VARCHAR2(64)	N			定制班次id
OLDFILENAME	N	VARCHAR2(200)	N			旧的文件名
NEWFILENAME	N	VARCHAR2(200)	N			新的文件名
CREATER	N	VARCHAR2(200)	N			创建人
CREATETIME	N	VARCHAR2(100)	N			创建时间
ISDELETE	N	VARCHAR2(2)	N			是否删除

 */
public class Constomfile implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 699693939404470141L;
	private String Freeco_id;
	private String oldfilename;
	private String newfilename;
	private String creater;
	private String createtime;
	private String isdelete;
	public Constomfile() {
		super();
	}
	public Constomfile(String freeco_id, String oldfilename, String newfilename, String creater, String createtime,
			String isdelete) {
		super();
		Freeco_id = freeco_id;
		this.oldfilename = oldfilename;
		this.newfilename = newfilename;
		this.creater = creater;
		this.createtime = createtime;
		this.isdelete = isdelete;
	}
	public String getFreeco_id() {
		return Freeco_id;
	}
	public void setFreeco_id(String freeco_id) {
		Freeco_id = freeco_id;
	}
	public String getOldfilename() {
		return oldfilename;
	}
	public void setOldfilename(String oldfilename) {
		this.oldfilename = oldfilename;
	}
	public String getNewfilename() {
		return newfilename;
	}
	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	
}
