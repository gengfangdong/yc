package entity;

import java.io.Serializable;

public class Solution implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 882571079231518883L;
	
	private String Solution_id;//新闻id
	private String Solution_titile;//新闻标题
	private String Solution_title_page;//新闻封面url
	private String Solution_Introduction;//新闻简介
	private String Solution_KeyWords;//新闻关键字  以逗号分隔  5个关键字
	private String Solution_Release_time;//发布时间
	private String Solution_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String Solution_context;//新闻内容  ckeditor
	private String Solution_Creater;//新闻创建人
	private String Solution_Createtime;//新闻创建时间
	
	public Solution() {
		super();
	}

	public Solution(String solution_id, String solution_titile,
			String solution_title_page, String solution_Introduction,
			String solution_KeyWords, String solution_Release_time,
			String solution_status, String solution_context,
			String solution_Creater, String solution_Createtime) {
		super();
		Solution_id = solution_id;
		Solution_titile = solution_titile;
		Solution_title_page = solution_title_page;
		Solution_Introduction = solution_Introduction;
		Solution_KeyWords = solution_KeyWords;
		Solution_Release_time = solution_Release_time;
		Solution_status = solution_status;
		Solution_context = solution_context;
		Solution_Creater = solution_Creater;
		Solution_Createtime = solution_Createtime;
	}

	public String getSolution_id() {
		return Solution_id;
	}

	public void setSolution_id(String solution_id) {
		Solution_id = solution_id;
	}

	public String getSolution_titile() {
		return Solution_titile;
	}

	public void setSolution_titile(String solution_titile) {
		Solution_titile = solution_titile;
	}

	public String getSolution_title_page() {
		return Solution_title_page;
	}

	public void setSolution_title_page(String solution_title_page) {
		Solution_title_page = solution_title_page;
	}

	public String getSolution_Introduction() {
		return Solution_Introduction;
	}

	public void setSolution_Introduction(String solution_Introduction) {
		Solution_Introduction = solution_Introduction;
	}

	public String getSolution_KeyWords() {
		return Solution_KeyWords;
	}

	public void setSolution_KeyWords(String solution_KeyWords) {
		Solution_KeyWords = solution_KeyWords;
	}

	public String getSolution_Release_time() {
		return Solution_Release_time;
	}

	public void setSolution_Release_time(String solution_Release_time) {
		Solution_Release_time = solution_Release_time;
	}

	public String getSolution_status() {
		return Solution_status;
	}

	public void setSolution_status(String solution_status) {
		Solution_status = solution_status;
	}

	public String getSolution_context() {
		return Solution_context;
	}

	public void setSolution_context(String solution_context) {
		Solution_context = solution_context;
	}

	public String getSolution_Creater() {
		return Solution_Creater;
	}

	public void setSolution_Creater(String solution_Creater) {
		Solution_Creater = solution_Creater;
	}

	public String getSolution_Createtime() {
		return Solution_Createtime;
	}

	public void setSolution_Createtime(String solution_Createtime) {
		Solution_Createtime = solution_Createtime;
	}
	
	
	
}
