package entity;

import java.io.Serializable;

public class Teaching implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5397344377051942614L;
	
	private String Teaching_id;//教材id
	private String Teaching_titile;//教材标题
	private String Teaching_title_page;//教材封面url
	private String Teaching_Introduction;//教材简介
	private String Teaching_KeyWords;//教材关键字  以逗号分隔  5个关键字
	private String Teaching_Release_time;//发布时间
	private String Teaching_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String Teaching_context;//教材内容  ckeditor
	private String Teaching_Creater;//教材创建人
	private String Teaching_Createtime;//教材创建时间
	
	public Teaching() {
		super();
	}

	public Teaching(String teaching_id, String teaching_titile,
			String teaching_title_page, String teaching_Introduction,
			String teaching_KeyWords, String teaching_Release_time,
			String teaching_status, String teaching_context,
			String teaching_Creater, String teaching_Createtime) {
		super();
		Teaching_id = teaching_id;
		Teaching_titile = teaching_titile;
		Teaching_title_page = teaching_title_page;
		Teaching_Introduction = teaching_Introduction;
		Teaching_KeyWords = teaching_KeyWords;
		Teaching_Release_time = teaching_Release_time;
		Teaching_status = teaching_status;
		Teaching_context = teaching_context;
		Teaching_Creater = teaching_Creater;
		Teaching_Createtime = teaching_Createtime;
	}

	public String getTeaching_id() {
		return Teaching_id;
	}

	public void setTeaching_id(String teaching_id) {
		Teaching_id = teaching_id;
	}

	public String getTeaching_titile() {
		return Teaching_titile;
	}

	public void setTeaching_titile(String teaching_titile) {
		Teaching_titile = teaching_titile;
	}

	public String getTeaching_title_page() {
		return Teaching_title_page;
	}

	public void setTeaching_title_page(String teaching_title_page) {
		Teaching_title_page = teaching_title_page;
	}

	public String getTeaching_Introduction() {
		return Teaching_Introduction;
	}

	public void setTeaching_Introduction(String teaching_Introduction) {
		Teaching_Introduction = teaching_Introduction;
	}

	public String getTeaching_KeyWords() {
		return Teaching_KeyWords;
	}

	public void setTeaching_KeyWords(String teaching_KeyWords) {
		Teaching_KeyWords = teaching_KeyWords;
	}

	public String getTeaching_Release_time() {
		return Teaching_Release_time;
	}

	public void setTeaching_Release_time(String teaching_Release_time) {
		Teaching_Release_time = teaching_Release_time;
	}

	public String getTeaching_status() {
		return Teaching_status;
	}

	public void setTeaching_status(String teaching_status) {
		Teaching_status = teaching_status;
	}

	public String getTeaching_context() {
		return Teaching_context;
	}

	public void setTeaching_context(String teaching_context) {
		Teaching_context = teaching_context;
	}

	public String getTeaching_Creater() {
		return Teaching_Creater;
	}

	public void setTeaching_Creater(String teaching_Creater) {
		Teaching_Creater = teaching_Creater;
	}

	public String getTeaching_Createtime() {
		return Teaching_Createtime;
	}

	public void setTeaching_Createtime(String teaching_Createtime) {
		Teaching_Createtime = teaching_Createtime;
	}
	
	
}
