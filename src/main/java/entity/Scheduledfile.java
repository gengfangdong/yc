package entity;

import java.io.Serializable;
		

public class Scheduledfile implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2233800491060159187L;
	private String Scheduled_id;//规定班次id
	private String Scheduled_file;//文件uuid名字
	private String Scheduled_oldfile;//文件原名
	private String isdelete;//是否删除 0为未删除 1为删除
	private String creater;//创建人
	private String createtime;//创建时间
	public Scheduledfile() {
		super();
	}
	
	public Scheduledfile(String scheduled_id, String scheduled_file,
			String scheduled_oldfile, String isdelete, String creater,
			String createtime) {
		super();
		Scheduled_id = scheduled_id;
		Scheduled_file = scheduled_file;
		Scheduled_oldfile = scheduled_oldfile;
		this.isdelete = isdelete;
		this.creater = creater;
		this.createtime = createtime;
	}

	public String getScheduled_id() {
		return Scheduled_id;
	}
	public void setScheduled_id(String scheduled_id) {
		Scheduled_id = scheduled_id;
	}
	public String getScheduled_file() {
		return Scheduled_file;
	}
	public void setScheduled_file(String scheduled_file) {
		Scheduled_file = scheduled_file;
	}
	public String getScheduled_oldfile() {
		return Scheduled_oldfile;
	}
	public void setScheduled_oldfile(String scheduled_oldfile) {
		Scheduled_oldfile = scheduled_oldfile;
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
