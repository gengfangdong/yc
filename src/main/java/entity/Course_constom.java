package entity;

import java.io.Serializable;
/*
COURSECO_ID	N	VARCHAR2(64)	N			课程定制id
COURSECO_NAME	N	VARCHAR2(100)	N			课程定制班级名称
COURSECO_DATA	N	VARCHAR2(100)	N			课程定制举办日期
COURSECO_PERNUM	N	VARCHAR2(10)	N			课程定制计划参加人数
COURSECO_ADDRESS	N	VARCHAR2(100)	N			课程定制举办地点
COURSECO_PERSON	N	VARCHAR2(100)	N			课程定制联系人
COURSECO_PHONE	N	VARCHAR2(30)	N			课程定制联系电话
COURSECO_CREATER	N	VARCHAR2(64)	N			课程定制创建人
COURSECO_CREATETIME	N	VARCHAR2(100)	N			课程定制创建时间
COURSECO_UPDATER	N	VARCHAR2(64)	N			课程定制修改人
COURSECO_UPDATETIME	N	VARCHAR2(100)	N			课程定制修改时间
COURSECO_ISDELETE	N	VARCHAR2(2)	N			课程定制是否删除 0 为未删除  1为删除
COURSECO_STATUS	N	VARCHAR2(2)	N			课程定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课
COURSECO_OUTLINE	N	VARCHAR2(500)	N			课程定制大纲

 * */
public class Course_constom implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6071573654417951325L;
	private String Courseco_id;//课程定制id
	private String Courseco_name;//课程定制班级名称
	private String Courseco_data;//课程定制举办日期
	private String Courseco_pernum;//课程定制计划参加人数
	private String Courseco_address;//课程定制举办地点
	private String Courseco_person;//课程定制联系人
	private String Courseco_phone;//课程定制联系电话
	private String Courseco_creater;//课程定制创建人
	private String Courseco_createtime;//课程定制创建时间
	private String Courseco_updater;//课程定制修改人
	private String Courseco_updatetime;//课程定制修改时间
	private String Courseco_isdelete;//课程定制是否删除 0 为未删除  1为删除
	private String Courseco_status;//课程定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课
	private String Courseco_outline;//课程定制大纲
	public Course_constom() {
		super();
	}
	public Course_constom(String courseco_id, String courseco_name, String courseco_data, String courseco_pernum,
			String courseco_address, String courseco_person, String courseco_phone, String courseco_creater,
			String courseco_createtime, String courseco_updater, String courseco_updatetime, String courseco_isdelete,
			String courseco_status, String courseco_outline) {
		super();
		Courseco_id = courseco_id;
		Courseco_name = courseco_name;
		Courseco_data = courseco_data;
		Courseco_pernum = courseco_pernum;
		Courseco_address = courseco_address;
		Courseco_person = courseco_person;
		Courseco_phone = courseco_phone;
		Courseco_creater = courseco_creater;
		Courseco_createtime = courseco_createtime;
		Courseco_updater = courseco_updater;
		Courseco_updatetime = courseco_updatetime;
		Courseco_isdelete = courseco_isdelete;
		Courseco_status = courseco_status;
		Courseco_outline = courseco_outline;
	}
	public String getCourseco_id() {
		return Courseco_id;
	}
	public void setCourseco_id(String courseco_id) {
		Courseco_id = courseco_id;
	}
	public String getCourseco_name() {
		return Courseco_name;
	}
	public void setCourseco_name(String courseco_name) {
		Courseco_name = courseco_name;
	}
	public String getCourseco_data() {
		return Courseco_data;
	}
	public void setCourseco_data(String courseco_data) {
		Courseco_data = courseco_data;
	}
	public String getCourseco_pernum() {
		return Courseco_pernum;
	}
	public void setCourseco_pernum(String courseco_pernum) {
		Courseco_pernum = courseco_pernum;
	}
	public String getCourseco_address() {
		return Courseco_address;
	}
	public void setCourseco_address(String courseco_address) {
		Courseco_address = courseco_address;
	}
	public String getCourseco_person() {
		return Courseco_person;
	}
	public void setCourseco_person(String courseco_person) {
		Courseco_person = courseco_person;
	}
	public String getCourseco_phone() {
		return Courseco_phone;
	}
	public void setCourseco_phone(String courseco_phone) {
		Courseco_phone = courseco_phone;
	}
	public String getCourseco_creater() {
		return Courseco_creater;
	}
	public void setCourseco_creater(String courseco_creater) {
		Courseco_creater = courseco_creater;
	}
	public String getCourseco_createtime() {
		return Courseco_createtime;
	}
	public void setCourseco_createtime(String courseco_createtime) {
		Courseco_createtime = courseco_createtime;
	}
	public String getCourseco_updater() {
		return Courseco_updater;
	}
	public void setCourseco_updater(String courseco_updater) {
		Courseco_updater = courseco_updater;
	}
	public String getCourseco_updatetime() {
		return Courseco_updatetime;
	}
	public void setCourseco_updatetime(String courseco_updatetime) {
		Courseco_updatetime = courseco_updatetime;
	}
	public String getCourseco_isdelete() {
		return Courseco_isdelete;
	}
	public void setCourseco_isdelete(String courseco_isdelete) {
		Courseco_isdelete = courseco_isdelete;
	}
	public String getCourseco_status() {
		return Courseco_status;
	}
	public void setCourseco_status(String courseco_status) {
		Courseco_status = courseco_status;
	}
	public String getCourseco_outline() {
		return Courseco_outline;
	}
	public void setCourseco_outline(String courseco_outline) {
		Courseco_outline = courseco_outline;
	}
	@Override
	public String toString() {
		return "Course_constom [Courseco_id=" + Courseco_id + ", Courseco_name=" + Courseco_name + ", Courseco_data="
				+ Courseco_data + ", Courseco_pernum=" + Courseco_pernum + ", Courseco_address=" + Courseco_address
				+ ", Courseco_person=" + Courseco_person + ", Courseco_phone=" + Courseco_phone + ", Courseco_creater="
				+ Courseco_creater + ", Courseco_createtime=" + Courseco_createtime + ", Courseco_updater="
				+ Courseco_updater + ", Courseco_updatetime=" + Courseco_updatetime + ", Courseco_isdelete="
				+ Courseco_isdelete + ", Courseco_status=" + Courseco_status + ", Courseco_outline=" + Courseco_outline
				+ "]";
	}
	
}
