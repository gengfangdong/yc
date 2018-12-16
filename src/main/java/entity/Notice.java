package entity;

import java.io.Serializable;

public class Notice implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6744897258491346757L;

	
	private String Notice_id;//通知公告id
	private String Notice_titile;//通知公告标题
	private String Notice_title_page;//通知公告封面url
	private String Notice_Introduction;//通知公告简介
	private String Notice_KeyWords;//通知公告关键字  以逗号分隔  5个关键字
	private String Notice_Release_time;//发布时间
	private String Notice_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String Notice_context;//通知公告内容  ckeditor
	private String Notice_Creater;//通知公告创建人
	private String Notice_Createtime;//通知公告创建时间
	
	public Notice() {
		super();
	}

	public Notice(String notice_id, String notice_titile,
			String notice_title_page, String notice_Introduction,
			String notice_KeyWords, String notice_Release_time,
			String notice_status, String notice_context, String notice_Creater,
			String notice_Createtime) {
		super();
		Notice_id = notice_id;
		Notice_titile = notice_titile;
		Notice_title_page = notice_title_page;
		Notice_Introduction = notice_Introduction;
		Notice_KeyWords = notice_KeyWords;
		Notice_Release_time = notice_Release_time;
		Notice_status = notice_status;
		Notice_context = notice_context;
		Notice_Creater = notice_Creater;
		Notice_Createtime = notice_Createtime;
	}

	public String getNotice_id() {
		return Notice_id;
	}

	public void setNotice_id(String notice_id) {
		Notice_id = notice_id;
	}

	public String getNotice_titile() {
		return Notice_titile;
	}

	public void setNotice_titile(String notice_titile) {
		Notice_titile = notice_titile;
	}

	public String getNotice_title_page() {
		return Notice_title_page;
	}

	public void setNotice_title_page(String notice_title_page) {
		Notice_title_page = notice_title_page;
	}

	public String getNotice_Introduction() {
		return Notice_Introduction;
	}

	public void setNotice_Introduction(String notice_Introduction) {
		Notice_Introduction = notice_Introduction;
	}

	public String getNotice_KeyWords() {
		return Notice_KeyWords;
	}

	public void setNotice_KeyWords(String notice_KeyWords) {
		Notice_KeyWords = notice_KeyWords;
	}

	public String getNotice_Release_time() {
		return Notice_Release_time;
	}

	public void setNotice_Release_time(String notice_Release_time) {
		Notice_Release_time = notice_Release_time;
	}

	public String getNotice_status() {
		return Notice_status;
	}

	public void setNotice_status(String notice_status) {
		Notice_status = notice_status;
	}

	public String getNotice_context() {
		return Notice_context;
	}

	public void setNotice_context(String notice_context) {
		Notice_context = notice_context;
	}

	public String getNotice_Creater() {
		return Notice_Creater;
	}

	public void setNotice_Creater(String notice_Creater) {
		Notice_Creater = notice_Creater;
	}

	public String getNotice_Createtime() {
		return Notice_Createtime;
	}

	public void setNotice_Createtime(String notice_Createtime) {
		Notice_Createtime = notice_Createtime;
	}
	
	
	
	
}
