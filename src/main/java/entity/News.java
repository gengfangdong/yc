package entity;

import java.io.Serializable;

public class News implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7688947346521104309L;
	
	private String News_id;//新闻id
	private String News_titile;//新闻标题
	private String News_title_page;//新闻封面url
	private String News_Introduction;//新闻简介
	private String News_KeyWords;//新闻关键字  以逗号分隔  5个关键字
	private String News_Release_time;//发布时间
	private String News_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String News_context;//新闻内容  ckeditor
	private String News_Creater;//新闻创建人
	private String News_Createtime;//新闻创建时间
	
	public News() {
		super();
	}
	public News(String news_id, String news_titile, String news_title_page,
			String news_Introduction, String news_KeyWords,
			String news_Release_time, String news_status, String news_context,
			String news_Creater, String news_Createtime) {
		super();
		News_id = news_id;
		News_titile = news_titile;
		News_title_page = news_title_page;
		News_Introduction = news_Introduction;
		News_KeyWords = news_KeyWords;
		News_Release_time = news_Release_time;
		News_status = news_status;
		News_context = news_context;
		News_Creater = news_Creater;
		News_Createtime = news_Createtime;
	}
	public String getNews_id() {
		return News_id;
	}
	public void setNews_id(String news_id) {
		News_id = news_id;
	}
	public String getNews_titile() {
		return News_titile;
	}
	public void setNews_titile(String news_titile) {
		News_titile = news_titile;
	}
	public String getNews_title_page() {
		return News_title_page;
	}
	public void setNews_title_page(String news_title_page) {
		News_title_page = news_title_page;
	}
	public String getNews_Introduction() {
		return News_Introduction;
	}
	public void setNews_Introduction(String news_Introduction) {
		News_Introduction = news_Introduction;
	}
	public String getNews_KeyWords() {
		return News_KeyWords;
	}
	public void setNews_KeyWords(String news_KeyWords) {
		News_KeyWords = news_KeyWords;
	}
	public String getNews_Release_time() {
		return News_Release_time;
	}
	public void setNews_Release_time(String news_Release_time) {
		News_Release_time = news_Release_time;
	}
	public String getNews_status() {
		return News_status;
	}
	public void setNews_status(String news_status) {
		News_status = news_status;
	}
	public String getNews_context() {
		return News_context;
	}
	public void setNews_context(String news_context) {
		News_context = news_context;
	}
	public String getNews_Creater() {
		return News_Creater;
	}
	public void setNews_Creater(String news_Creater) {
		News_Creater = news_Creater;
	}
	public String getNews_Createtime() {
		return News_Createtime;
	}
	public void setNews_Createtime(String news_Createtime) {
		News_Createtime = news_Createtime;
	}
	
	
}
