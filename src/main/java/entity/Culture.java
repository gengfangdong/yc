package entity;

import java.io.Serializable;

public class Culture implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8352017155858947874L;
	
	private String Culture_id;//培养id
	private String Culture_titile;//培养标题
	private String Culture_title_page;//培养封面url
	private String Culture_Introduction;//培养简介
	private String Culture_KeyWords;//培养关键字  以逗号分隔  5个关键字
	private String Culture_Release_time;//发布时间
	private String Culture_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String Culture_context;//培养内容  ckeditor
	private String Culture_Creater;//培养创建人
	private String Culture_Createtime;//培养创建时间
	
	public Culture() {
		super();
	}

	public Culture(String culture_id, String culture_titile,
			String culture_title_page, String culture_Introduction,
			String culture_KeyWords, String culture_Release_time,
			String culture_status, String culture_context,
			String culture_Creater, String culture_Createtime) {
		super();
		Culture_id = culture_id;
		Culture_titile = culture_titile;
		Culture_title_page = culture_title_page;
		Culture_Introduction = culture_Introduction;
		Culture_KeyWords = culture_KeyWords;
		Culture_Release_time = culture_Release_time;
		Culture_status = culture_status;
		Culture_context = culture_context;
		Culture_Creater = culture_Creater;
		Culture_Createtime = culture_Createtime;
	}

	public String getCulture_id() {
		return Culture_id;
	}

	public void setCulture_id(String culture_id) {
		Culture_id = culture_id;
	}

	public String getCulture_titile() {
		return Culture_titile;
	}

	public void setCulture_titile(String culture_titile) {
		Culture_titile = culture_titile;
	}

	public String getCulture_title_page() {
		return Culture_title_page;
	}

	public void setCulture_title_page(String culture_title_page) {
		Culture_title_page = culture_title_page;
	}

	public String getCulture_Introduction() {
		return Culture_Introduction;
	}

	public void setCulture_Introduction(String culture_Introduction) {
		Culture_Introduction = culture_Introduction;
	}

	public String getCulture_KeyWords() {
		return Culture_KeyWords;
	}

	public void setCulture_KeyWords(String culture_KeyWords) {
		Culture_KeyWords = culture_KeyWords;
	}

	public String getCulture_Release_time() {
		return Culture_Release_time;
	}

	public void setCulture_Release_time(String culture_Release_time) {
		Culture_Release_time = culture_Release_time;
	}

	public String getCulture_status() {
		return Culture_status;
	}

	public void setCulture_status(String culture_status) {
		Culture_status = culture_status;
	}

	public String getCulture_context() {
		return Culture_context;
	}

	public void setCulture_context(String culture_context) {
		Culture_context = culture_context;
	}

	public String getCulture_Creater() {
		return Culture_Creater;
	}

	public void setCulture_Creater(String culture_Creater) {
		Culture_Creater = culture_Creater;
	}

	public String getCulture_Createtime() {
		return Culture_Createtime;
	}

	public void setCulture_Createtime(String culture_Createtime) {
		Culture_Createtime = culture_Createtime;
	}

	
	
}
