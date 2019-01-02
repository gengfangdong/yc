package entity;

import java.io.Serializable;
//会员我的项目
public class MemProjectVo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 943801373641373786L;
	private String project_id;//id
	private String project_caogery;//类别 0为定制 1为规定 2为拼班
	private String project_name;//项目名称
	private String project_datanum;//预计举办天数
	private String project_pernum;//可容纳人数
	private String project_start;//预计举办日期
	private String project_status;//状态
	private String project_allnum;//已报名人数
	public MemProjectVo() {
		super();
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getProject_caogery() {
		return project_caogery;
	}
	public void setProject_caogery(String project_caogery) {
		this.project_caogery = project_caogery;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_datanum() {
		return project_datanum;
	}
	public void setProject_datanum(String project_datanum) {
		this.project_datanum = project_datanum;
	}
	public String getProject_pernum() {
		return project_pernum;
	}
	public void setProject_pernum(String project_pernum) {
		this.project_pernum = project_pernum;
	}
	public String getProject_status() {
		return project_status;
	}
	public void setProject_status(String project_status) {
		this.project_status = project_status;
	}
	public String getProject_allnum() {
		return project_allnum;
	}
	public void setProject_allnum(String project_allnum) {
		this.project_allnum = project_allnum;
	}
	public String getProject_start() {
		return project_start;
	}
	public void setProject_start(String project_start) {
		this.project_start = project_start;
	}
	@Override
	public String toString() {
		return "MemProjectVo [project_id=" + project_id + ", project_caogery=" + project_caogery + ", project_name="
				+ project_name + ", project_datanum=" + project_datanum + ", project_pernum=" + project_pernum
				+ ", project_start=" + project_start + ", project_status=" + project_status + ", project_allnum="
				+ project_allnum + "]";
	}
	
	
}
