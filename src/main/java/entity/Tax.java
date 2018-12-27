package entity;

import java.io.Serializable;

public class Tax implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5076338608251572185L;
	
	private String Tax_id;//领税id
	private String Tax_titile;//领税标题
	private String Tax_title_page;//领税封面url
	private String Tax_Introduction;//领税简介
	private String Tax_KeyWords;//领税关键字  以逗号分隔  5个关键字
	private String Tax_Release_time;//发布时间
	private String Tax_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String Tax_context;//领税内容  ckeditor
	private String Tax_Creater;//领税创建人
	private String Tax_Createtime;//领税创建时间
	
	public Tax() {
		super();
	}

	public Tax(String tax_id, String tax_titile, String tax_title_page,
			String tax_Introduction, String tax_KeyWords,
			String tax_Release_time, String tax_status, String tax_context,
			String tax_Creater, String tax_Createtime) {
		super();
		Tax_id = tax_id;
		Tax_titile = tax_titile;
		Tax_title_page = tax_title_page;
		Tax_Introduction = tax_Introduction;
		Tax_KeyWords = tax_KeyWords;
		Tax_Release_time = tax_Release_time;
		Tax_status = tax_status;
		Tax_context = tax_context;
		Tax_Creater = tax_Creater;
		Tax_Createtime = tax_Createtime;
	}

	public String getTax_id() {
		return Tax_id;
	}

	public void setTax_id(String tax_id) {
		Tax_id = tax_id;
	}

	public String getTax_titile() {
		return Tax_titile;
	}

	public void setTax_titile(String tax_titile) {
		Tax_titile = tax_titile;
	}

	public String getTax_title_page() {
		return Tax_title_page;
	}

	public void setTax_title_page(String tax_title_page) {
		Tax_title_page = tax_title_page;
	}

	public String getTax_Introduction() {
		return Tax_Introduction;
	}

	public void setTax_Introduction(String tax_Introduction) {
		Tax_Introduction = tax_Introduction;
	}

	public String getTax_KeyWords() {
		return Tax_KeyWords;
	}

	public void setTax_KeyWords(String tax_KeyWords) {
		Tax_KeyWords = tax_KeyWords;
	}

	public String getTax_Release_time() {
		return Tax_Release_time;
	}

	public void setTax_Release_time(String tax_Release_time) {
		Tax_Release_time = tax_Release_time;
	}

	public String getTax_status() {
		return Tax_status;
	}

	public void setTax_status(String tax_status) {
		Tax_status = tax_status;
	}

	public String getTax_context() {
		return Tax_context;
	}

	public void setTax_context(String tax_context) {
		Tax_context = tax_context;
	}

	public String getTax_Creater() {
		return Tax_Creater;
	}

	public void setTax_Creater(String tax_Creater) {
		Tax_Creater = tax_Creater;
	}

	public String getTax_Createtime() {
		return Tax_Createtime;
	}

	public void setTax_Createtime(String tax_Createtime) {
		Tax_Createtime = tax_Createtime;
	}
	
	
}
