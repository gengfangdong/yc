package entity;

import java.io.Serializable;

public class Project implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1380233886128198556L;
	private String Project_id;//项目id
	private String Project_name;//项目名称
	private String Project_date;//项目发布日期
	private String Project_context;//项目内容
	private String Project_creater;//创建人
	private String Project_createtime;//创建时间
	public Project() {
		super();
	}
	public Project(String project_id, String project_name, String project_date,
			String project_context, String project_creater,
			String project_createtime) {
		super();
		Project_id = project_id;
		Project_name = project_name;
		Project_date = project_date;
		Project_context = project_context;
		Project_creater = project_creater;
		Project_createtime = project_createtime;
	}
	public String getProject_id() {
		return Project_id;
	}
	public void setProject_id(String project_id) {
		Project_id = project_id;
	}
	public String getProject_name() {
		return Project_name;
	}
	public void setProject_name(String project_name) {
		Project_name = project_name;
	}
	public String getProject_date() {
		return Project_date;
	}
	public void setProject_date(String project_date) {
		Project_date = project_date;
	}
	public String getProject_context() {
		return Project_context;
	}
	public void setProject_context(String project_context) {
		Project_context = project_context;
	}
	public String getProject_creater() {
		return Project_creater;
	}
	public void setProject_creater(String project_creater) {
		Project_creater = project_creater;
	}
	public String getProject_createtime() {
		return Project_createtime;
	}
	public void setProject_createtime(String project_createtime) {
		Project_createtime = project_createtime;
	}
	
	
	
	
}
