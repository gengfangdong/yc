package entity;

import java.io.Serializable;

public class ProjectVo implements Serializable{
	private static final long serialVersionUID = -7671027815151952165L;
	/**
	 * 
	 */
	private String Project_id;//项目id
	private String Project_name;//项目名称
	private String Project_date;//项目发布日期
	private String Project_context;//项目内容
	private String Project_creater;//创建人
	private String Project_createtime;//创建时间
	private String Project_status;//会员在职研个人报名状态
	private String status;
	private String isuploadfile;//是否上传名单
	private String Apply_id;//个人报名id
	private String Applyunit_id;//单位报名id
	public ProjectVo() {
		super();
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
	public String getProject_status() {
		return Project_status;
	}
	public void setProject_status(String project_status) {
		Project_status = project_status;
	}
	public String getApply_id() {
		return Apply_id;
	}
	public void setApply_id(String apply_id) {
		Apply_id = apply_id;
	}
	public String getApplyunit_id() {
		return Applyunit_id;
	}
	public void setApplyunit_id(String applyunit_id) {
		Applyunit_id = applyunit_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIsuploadfile() {
		return isuploadfile;
	}
	public void setIsuploadfile(String isuploadfile) {
		this.isuploadfile = isuploadfile;
	}
}
