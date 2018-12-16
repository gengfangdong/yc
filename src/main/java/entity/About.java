package entity;

import java.io.Serializable;

public class About implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9172582660822730014L;
	
	
	private String About_id;//关于我们id
	private String About_titile;//关于我们标题
	private String About_title_page;//关于我们封面url
	private String About_Introduction;//关于我们简介
	private String About_KeyWords;//关于我们关键字  以逗号分隔  5个关键字
	private String About_Release_time;//发布时间
	private String About_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String About_context;//关于我们内容  ckeditor
	private String About_Creater;//关于我们创建人
	private String About_Createtime;//关于我们创建时间
	public About() {
		super();
	}
	public About(String about_id, String about_titile, String about_title_page,
			String about_Introduction, String about_KeyWords,
			String about_Release_time, String about_status,
			String about_context, String about_Creater, String about_Createtime) {
		super();
		About_id = about_id;
		About_titile = about_titile;
		About_title_page = about_title_page;
		About_Introduction = about_Introduction;
		About_KeyWords = about_KeyWords;
		About_Release_time = about_Release_time;
		About_status = about_status;
		About_context = about_context;
		About_Creater = about_Creater;
		About_Createtime = about_Createtime;
	}
	public String getAbout_id() {
		return About_id;
	}
	public void setAbout_id(String about_id) {
		About_id = about_id;
	}
	public String getAbout_titile() {
		return About_titile;
	}
	public void setAbout_titile(String about_titile) {
		About_titile = about_titile;
	}
	public String getAbout_title_page() {
		return About_title_page;
	}
	public void setAbout_title_page(String about_title_page) {
		About_title_page = about_title_page;
	}
	public String getAbout_Introduction() {
		return About_Introduction;
	}
	public void setAbout_Introduction(String about_Introduction) {
		About_Introduction = about_Introduction;
	}
	public String getAbout_KeyWords() {
		return About_KeyWords;
	}
	public void setAbout_KeyWords(String about_KeyWords) {
		About_KeyWords = about_KeyWords;
	}
	public String getAbout_Release_time() {
		return About_Release_time;
	}
	public void setAbout_Release_time(String about_Release_time) {
		About_Release_time = about_Release_time;
	}
	public String getAbout_status() {
		return About_status;
	}
	public void setAbout_status(String about_status) {
		About_status = about_status;
	}
	public String getAbout_context() {
		return About_context;
	}
	public void setAbout_context(String about_context) {
		About_context = about_context;
	}
	public String getAbout_Creater() {
		return About_Creater;
	}
	public void setAbout_Creater(String about_Creater) {
		About_Creater = about_Creater;
	}
	public String getAbout_Createtime() {
		return About_Createtime;
	}
	public void setAbout_Createtime(String about_Createtime) {
		About_Createtime = about_Createtime;
	}

	
}
