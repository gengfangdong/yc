package entity;

import java.io.Serializable;

public class ProjectView implements Serializable{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -71597299023496896L;

	
	private String ProjectView_id;//项目概况id
	private String ProjectView_titile;//项目概况标题
	private String ProjectView_title_page;//项目概况封面url
	private String ProjectView_Introduction;//项目概况简介
	private String ProjectView_KeyWords;//项目概况关键字  以逗号分隔  5个关键字
	private String ProjectView_Release_time;//发布时间
	private String ProjectView_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String ProjectView_context;//项目概况内容  ckeditor
	private String ProjectView_Creater;//项目概况创建人
	private String ProjectView_Createtime;//项目概况创建时间
	public ProjectView() {
		super();
	}
	public ProjectView(String projectView_id, String projectView_titile,
			String projectView_title_page, String projectView_Introduction,
			String projectView_KeyWords, String projectView_Release_time,
			String projectView_status, String projectView_context,
			String projectView_Creater, String projectView_Createtime) {
		super();
		ProjectView_id = projectView_id;
		ProjectView_titile = projectView_titile;
		ProjectView_title_page = projectView_title_page;
		ProjectView_Introduction = projectView_Introduction;
		ProjectView_KeyWords = projectView_KeyWords;
		ProjectView_Release_time = projectView_Release_time;
		ProjectView_status = projectView_status;
		ProjectView_context = projectView_context;
		ProjectView_Creater = projectView_Creater;
		ProjectView_Createtime = projectView_Createtime;
	}
	public String getProjectView_id() {
		return ProjectView_id;
	}
	public void setProjectView_id(String projectView_id) {
		ProjectView_id = projectView_id;
	}
	public String getProjectView_titile() {
		return ProjectView_titile;
	}
	public void setProjectView_titile(String projectView_titile) {
		ProjectView_titile = projectView_titile;
	}
	public String getProjectView_title_page() {
		return ProjectView_title_page;
	}
	public void setProjectView_title_page(String projectView_title_page) {
		ProjectView_title_page = projectView_title_page;
	}
	public String getProjectView_Introduction() {
		return ProjectView_Introduction;
	}
	public void setProjectView_Introduction(String projectView_Introduction) {
		ProjectView_Introduction = projectView_Introduction;
	}
	public String getProjectView_KeyWords() {
		return ProjectView_KeyWords;
	}
	public void setProjectView_KeyWords(String projectView_KeyWords) {
		ProjectView_KeyWords = projectView_KeyWords;
	}
	public String getProjectView_Release_time() {
		return ProjectView_Release_time;
	}
	public void setProjectView_Release_time(String projectView_Release_time) {
		ProjectView_Release_time = projectView_Release_time;
	}
	public String getProjectView_status() {
		return ProjectView_status;
	}
	public void setProjectView_status(String projectView_status) {
		ProjectView_status = projectView_status;
	}
	public String getProjectView_context() {
		return ProjectView_context;
	}
	public void setProjectView_context(String projectView_context) {
		ProjectView_context = projectView_context;
	}
	public String getProjectView_Creater() {
		return ProjectView_Creater;
	}
	public void setProjectView_Creater(String projectView_Creater) {
		ProjectView_Creater = projectView_Creater;
	}
	public String getProjectView_Createtime() {
		return ProjectView_Createtime;
	}
	public void setProjectView_Createtime(String projectView_Createtime) {
		ProjectView_Createtime = projectView_Createtime;
	}
	
	
	
}
