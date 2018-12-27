package entity;

import java.io.Serializable;

/*
 * 拼班文件实体
 * FIGCLASS_ID	N	VARCHAR2(64)	N			拼班id
OLDFILENAME	N	VARCHAR2(200)	N			旧的文件名
NEWFILENAME	N	VARCHAR2(200)	N			新的文件名
CREATER	N	VARCHAR2(200)	N			创建人
CREATETIME	N	VARCHAR2(100)	N			创建时间
ISDELETE	N	VARCHAR2(2)	N			是否删除

 */
public class Figfile implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1469114047484342234L;
	private String FigClass_id;//拼班id
	private String oldfilename;//旧的文件名
	private String newfilename;//新的文件名
	private String creater;//创建人
	private String createtime;//创建时间
	private String isdelete;//是否删除
	public Figfile() {
		super();
	}
	public String getFigClass_id() {
		return FigClass_id;
	}
	public void setFigClass_id(String figClass_id) {
		FigClass_id = figClass_id;
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
