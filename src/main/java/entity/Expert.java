package entity;

import java.io.Serializable;

public class Expert implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 370659657678055295L;
	
	private String Expert_id;//专家id
	private String Expert_titile;//专家标题
	private String Expert_title_page;//专家封面url
	private String Expert_Introduction;//专家简介
	private String Expert_KeyWords;//专家关键字  以逗号分隔  5个关键字
	private String Expert_Release_time;//发布时间
	private String Expert_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String Expert_context;//专家内容  ckeditor
	private String Expert_Creater;//专家创建人
	private String Expert_Createtime;//专家创建时间
	
	public Expert() {
		super();
	}

	public Expert(String expert_id, String expert_titile,
			String expert_title_page, String expert_Introduction,
			String expert_KeyWords, String expert_Release_time,
			String expert_status, String expert_context, String expert_Creater,
			String expert_Createtime) {
		super();
		Expert_id = expert_id;
		Expert_titile = expert_titile;
		Expert_title_page = expert_title_page;
		Expert_Introduction = expert_Introduction;
		Expert_KeyWords = expert_KeyWords;
		Expert_Release_time = expert_Release_time;
		Expert_status = expert_status;
		Expert_context = expert_context;
		Expert_Creater = expert_Creater;
		Expert_Createtime = expert_Createtime;
	}

	public String getExpert_id() {
		return Expert_id;
	}

	public void setExpert_id(String expert_id) {
		Expert_id = expert_id;
	}

	public String getExpert_titile() {
		return Expert_titile;
	}

	public void setExpert_titile(String expert_titile) {
		Expert_titile = expert_titile;
	}

	public String getExpert_title_page() {
		return Expert_title_page;
	}

	public void setExpert_title_page(String expert_title_page) {
		Expert_title_page = expert_title_page;
	}

	public String getExpert_Introduction() {
		return Expert_Introduction;
	}

	public void setExpert_Introduction(String expert_Introduction) {
		Expert_Introduction = expert_Introduction;
	}

	public String getExpert_KeyWords() {
		return Expert_KeyWords;
	}

	public void setExpert_KeyWords(String expert_KeyWords) {
		Expert_KeyWords = expert_KeyWords;
	}

	public String getExpert_Release_time() {
		return Expert_Release_time;
	}

	public void setExpert_Release_time(String expert_Release_time) {
		Expert_Release_time = expert_Release_time;
	}

	public String getExpert_status() {
		return Expert_status;
	}

	public void setExpert_status(String expert_status) {
		Expert_status = expert_status;
	}

	public String getExpert_context() {
		return Expert_context;
	}

	public void setExpert_context(String expert_context) {
		Expert_context = expert_context;
	}

	public String getExpert_Creater() {
		return Expert_Creater;
	}

	public void setExpert_Creater(String expert_Creater) {
		Expert_Creater = expert_Creater;
	}

	public String getExpert_Createtime() {
		return Expert_Createtime;
	}

	public void setExpert_Createtime(String expert_Createtime) {
		Expert_Createtime = expert_Createtime;
	}
	
	
}
