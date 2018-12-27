package entity;

import java.io.Serializable;
/*
Progarmco_ID	N	VARCHAR2(64)	N			课程定制id
Progarmco_NAME	N	VARCHAR2(100)	N			课程定制班级名称
Progarmco_DATA	N	VARCHAR2(100)	N			课程定制举办日期
Progarmco_PERNUM	N	VARCHAR2(10)	N			课程定制计划参加人数
Progarmco_ADDRESS	N	VARCHAR2(100)	N			课程定制举办地点
Progarmco_PERSON	N	VARCHAR2(100)	N			课程定制联系人
Progarmco_PHONE	N	VARCHAR2(30)	N			课程定制联系电话
Progarmco_CREATER	N	VARCHAR2(64)	N			课程定制创建人
Progarmco_CREATETIME	N	VARCHAR2(100)	N			课程定制创建时间
Progarmco_UPDATER	N	VARCHAR2(64)	N			课程定制修改人
Progarmco_UPDATETIME	N	VARCHAR2(100)	N			课程定制修改时间
Progarmco_ISDELETE	N	VARCHAR2(2)	N			课程定制是否删除 0 为未删除  1为删除
Progarmco_STATUS	N	VARCHAR2(2)	N			课程定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课
Progarmco_OUTLINE	N	VARCHAR2(500)	N			课程定制大纲

 * */
public class Progarm_constom implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6071573654417951325L;
	private String Progarmco_id;//课程定制id
	private String Progarmco_name;//课程定制班级名称
	private String Progarmco_data;//课程定制举办日期
	private String Progarmco_pernum;//课程定制计划参加人数
	private String Progarmco_address;//课程定制举办地点
	private String Progarmco_person;//课程定制联系人
	private String Progarmco_phone;//课程定制联系电话
	private String Progarmco_creater;//课程定制创建人
	private String Progarmco_createtime;//课程定制创建时间
	private String Progarmco_updater;//课程定制修改人
	private String Progarmco_updatetime;//课程定制修改时间
	private String Progarmco_isdelete;//课程定制是否删除 0 为未删除  1为删除
	private String Progarmco_status;//课程定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课
	private String Progarmco_outline;//课程定制大纲
	public Progarm_constom() {
		super();
	}
	public Progarm_constom(String progarmco_id, String progarmco_name, String progarmco_data, String progarmco_pernum,
			String progarmco_address, String progarmco_person, String progarmco_phone, String progarmco_creater,
			String progarmco_createtime, String progarmco_updater, String progarmco_updatetime,
			String progarmco_isdelete, String progarmco_status, String progarmco_outline) {
		super();
		Progarmco_id = progarmco_id;
		Progarmco_name = progarmco_name;
		Progarmco_data = progarmco_data;
		Progarmco_pernum = progarmco_pernum;
		Progarmco_address = progarmco_address;
		Progarmco_person = progarmco_person;
		Progarmco_phone = progarmco_phone;
		Progarmco_creater = progarmco_creater;
		Progarmco_createtime = progarmco_createtime;
		Progarmco_updater = progarmco_updater;
		Progarmco_updatetime = progarmco_updatetime;
		Progarmco_isdelete = progarmco_isdelete;
		Progarmco_status = progarmco_status;
		Progarmco_outline = progarmco_outline;
	}
	public String getProgarmco_id() {
		return Progarmco_id;
	}
	public void setProgarmco_id(String progarmco_id) {
		Progarmco_id = progarmco_id;
	}
	public String getProgarmco_name() {
		return Progarmco_name;
	}
	public void setProgarmco_name(String progarmco_name) {
		Progarmco_name = progarmco_name;
	}
	public String getProgarmco_data() {
		return Progarmco_data;
	}
	public void setProgarmco_data(String progarmco_data) {
		Progarmco_data = progarmco_data;
	}
	public String getProgarmco_pernum() {
		return Progarmco_pernum;
	}
	public void setProgarmco_pernum(String progarmco_pernum) {
		Progarmco_pernum = progarmco_pernum;
	}
	public String getProgarmco_address() {
		return Progarmco_address;
	}
	public void setProgarmco_address(String progarmco_address) {
		Progarmco_address = progarmco_address;
	}
	public String getProgarmco_person() {
		return Progarmco_person;
	}
	public void setProgarmco_person(String progarmco_person) {
		Progarmco_person = progarmco_person;
	}
	public String getProgarmco_phone() {
		return Progarmco_phone;
	}
	public void setProgarmco_phone(String progarmco_phone) {
		Progarmco_phone = progarmco_phone;
	}
	public String getProgarmco_creater() {
		return Progarmco_creater;
	}
	public void setProgarmco_creater(String progarmco_creater) {
		Progarmco_creater = progarmco_creater;
	}
	public String getProgarmco_createtime() {
		return Progarmco_createtime;
	}
	public void setProgarmco_createtime(String progarmco_createtime) {
		Progarmco_createtime = progarmco_createtime;
	}
	public String getProgarmco_updater() {
		return Progarmco_updater;
	}
	public void setProgarmco_updater(String progarmco_updater) {
		Progarmco_updater = progarmco_updater;
	}
	public String getProgarmco_updatetime() {
		return Progarmco_updatetime;
	}
	public void setProgarmco_updatetime(String progarmco_updatetime) {
		Progarmco_updatetime = progarmco_updatetime;
	}
	public String getProgarmco_isdelete() {
		return Progarmco_isdelete;
	}
	public void setProgarmco_isdelete(String progarmco_isdelete) {
		Progarmco_isdelete = progarmco_isdelete;
	}
	public String getProgarmco_status() {
		return Progarmco_status;
	}
	public void setProgarmco_status(String progarmco_status) {
		Progarmco_status = progarmco_status;
	}
	public String getProgarmco_outline() {
		return Progarmco_outline;
	}
	public void setProgarmco_outline(String progarmco_outline) {
		Progarmco_outline = progarmco_outline;
	}
	
	
}
