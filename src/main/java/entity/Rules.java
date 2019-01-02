package entity;

import java.io.Serializable;

public class Rules implements Serializable{
	
	private static final long serialVersionUID = -4617115954196883551L;
	
	private String Rules_id;//简章公告id
	private String Rules_titile;//简章公告标题
	private String Rules_title_page;//简章公告封面url
	private String Rules_Introduction;//简章公告简介
	private String Rules_KeyWords;//简章公告关键字  以逗号分隔  5个关键字
	private String Rules_Release_time;//发布时间
	private String Rules_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String Rules_context;//简章公告内容  ckeditor
	private String Rules_Creater;//简章公告创建人
	private String Rules_Createtime;//简章公告创建时间
	
	public Rules() {
		super();
	}

	public Rules(String rules_id, String rules_titile, String rules_title_page,
			String rules_Introduction, String rules_KeyWords,
			String rules_Release_time, String rules_status,
			String rules_context, String rules_Creater, String rules_Createtime) {
		super();
		Rules_id = rules_id;
		Rules_titile = rules_titile;
		Rules_title_page = rules_title_page;
		Rules_Introduction = rules_Introduction;
		Rules_KeyWords = rules_KeyWords;
		Rules_Release_time = rules_Release_time;
		Rules_status = rules_status;
		Rules_context = rules_context;
		Rules_Creater = rules_Creater;
		Rules_Createtime = rules_Createtime;
	}

	public String getRules_id() {
		return Rules_id;
	}

	public void setRules_id(String rules_id) {
		Rules_id = rules_id;
	}

	public String getRules_titile() {
		return Rules_titile;
	}

	public void setRules_titile(String rules_titile) {
		Rules_titile = rules_titile;
	}

	public String getRules_title_page() {
		return Rules_title_page;
	}

	public void setRules_title_page(String rules_title_page) {
		Rules_title_page = rules_title_page;
	}

	public String getRules_Introduction() {
		return Rules_Introduction;
	}

	public void setRules_Introduction(String rules_Introduction) {
		Rules_Introduction = rules_Introduction;
	}

	public String getRules_KeyWords() {
		return Rules_KeyWords;
	}

	public void setRules_KeyWords(String rules_KeyWords) {
		Rules_KeyWords = rules_KeyWords;
	}

	public String getRules_Release_time() {
		return Rules_Release_time;
	}

	public void setRules_Release_time(String rules_Release_time) {
		Rules_Release_time = rules_Release_time;
	}

	public String getRules_status() {
		return Rules_status;
	}

	public void setRules_status(String rules_status) {
		Rules_status = rules_status;
	}

	public String getRules_context() {
		return Rules_context;
	}

	public void setRules_context(String rules_context) {
		Rules_context = rules_context;
	}

	public String getRules_Creater() {
		return Rules_Creater;
	}

	public void setRules_Creater(String rules_Creater) {
		Rules_Creater = rules_Creater;
	}

	public String getRules_Createtime() {
		return Rules_Createtime;
	}

	public void setRules_Createtime(String rules_Createtime) {
		Rules_Createtime = rules_Createtime;
	}
	
	
}
