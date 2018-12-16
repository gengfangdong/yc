package entity;

import java.io.Serializable;

public class RotationPic implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7688947346521104309L;
	
	private String RotationPic_id;//轮播图片id
	private String RotationPic_titile;//轮播图片标题
	private String RotationPic_title_page;//轮播图片封面url
	private String RotationPic_Introduction;//轮播图片简介
	private String RotationPic_KeyWords;//轮播图片关键字  以逗号分隔  5个关键字
	private String RotationPic_Release_time;//发布时间
	private String RotationPic_status;//发布状态  0为保存  1为待发布  2为发布。。
	private String RotationPic_context;//轮播图片内容  ckeditor
	private String RotationPic_Creater;//轮播图片创建人
	private String RotationPic_Createtime;//轮播图片创建时间
	
	public RotationPic() {
		super();
	}

	public RotationPic(String rotationPic_id, String rotationPic_titile,
			String rotationPic_title_page, String rotationPic_Introduction,
			String rotationPic_KeyWords, String rotationPic_Release_time,
			String rotationPic_status, String rotationPic_context,
			String rotationPic_Creater, String rotationPic_Createtime) {
		super();
		RotationPic_id = rotationPic_id;
		RotationPic_titile = rotationPic_titile;
		RotationPic_title_page = rotationPic_title_page;
		RotationPic_Introduction = rotationPic_Introduction;
		RotationPic_KeyWords = rotationPic_KeyWords;
		RotationPic_Release_time = rotationPic_Release_time;
		RotationPic_status = rotationPic_status;
		RotationPic_context = rotationPic_context;
		RotationPic_Creater = rotationPic_Creater;
		RotationPic_Createtime = rotationPic_Createtime;
	}

	public String getRotationPic_id() {
		return RotationPic_id;
	}

	public void setRotationPic_id(String rotationPic_id) {
		RotationPic_id = rotationPic_id;
	}

	public String getRotationPic_titile() {
		return RotationPic_titile;
	}

	public void setRotationPic_titile(String rotationPic_titile) {
		RotationPic_titile = rotationPic_titile;
	}

	public String getRotationPic_title_page() {
		return RotationPic_title_page;
	}

	public void setRotationPic_title_page(String rotationPic_title_page) {
		RotationPic_title_page = rotationPic_title_page;
	}

	public String getRotationPic_Introduction() {
		return RotationPic_Introduction;
	}

	public void setRotationPic_Introduction(String rotationPic_Introduction) {
		RotationPic_Introduction = rotationPic_Introduction;
	}

	public String getRotationPic_KeyWords() {
		return RotationPic_KeyWords;
	}

	public void setRotationPic_KeyWords(String rotationPic_KeyWords) {
		RotationPic_KeyWords = rotationPic_KeyWords;
	}

	public String getRotationPic_Release_time() {
		return RotationPic_Release_time;
	}

	public void setRotationPic_Release_time(String rotationPic_Release_time) {
		RotationPic_Release_time = rotationPic_Release_time;
	}

	public String getRotationPic_status() {
		return RotationPic_status;
	}

	public void setRotationPic_status(String rotationPic_status) {
		RotationPic_status = rotationPic_status;
	}

	public String getRotationPic_context() {
		return RotationPic_context;
	}

	public void setRotationPic_context(String rotationPic_context) {
		RotationPic_context = rotationPic_context;
	}

	public String getRotationPic_Creater() {
		return RotationPic_Creater;
	}

	public void setRotationPic_Creater(String rotationPic_Creater) {
		RotationPic_Creater = rotationPic_Creater;
	}

	public String getRotationPic_Createtime() {
		return RotationPic_Createtime;
	}

	public void setRotationPic_Createtime(String rotationPic_Createtime) {
		RotationPic_Createtime = rotationPic_Createtime;
	}
	
	
	
}
