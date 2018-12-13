package entity;

import java.io.Serializable;

/** 单位报名信息
 * @author my
 *
 */
public class ApplyUnit implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4137436588651110449L;
	private String applyunit_id;//单位报名id
	private String applyunit_caogery;//报名类别 默认1  单位
	private String applyunit_date;//报名日期
	private String applyunit_name;//报名单位
	private String applyunit_person;//联系人
	private String applyunit_phone;//联系人电话
	private String applyunit_mail;//联系人邮箱
	private String applyunit_file;//报名名单
	private String applyunit_creater;//创建人
	private String applyunit_createtime;//创建时间
	private String project_id;//项目id
	private String applyunit_status;//审核状态 0未审核 1审核不通过 2 审核通过
	private String isdelete;// 是否删除 0为未删除 1为删除
	public ApplyUnit() {
		super();
	}
	public ApplyUnit(String applyunit_id, String applyunit_caogery,
			String applyunit_date, String applyunit_name,
			String applyunit_person, String applyunit_phone,
			String applyunit_mail, String applyunit_file,
			String applyunit_creater, String applyunit_createtime,
			String project_id, String applyunit_status, String isdelete) {
		super();
		this.applyunit_id = applyunit_id;
		this.applyunit_caogery = applyunit_caogery;
		this.applyunit_date = applyunit_date;
		this.applyunit_name = applyunit_name;
		this.applyunit_person = applyunit_person;
		this.applyunit_phone = applyunit_phone;
		this.applyunit_mail = applyunit_mail;
		this.applyunit_file = applyunit_file;
		this.applyunit_creater = applyunit_creater;
		this.applyunit_createtime = applyunit_createtime;
		this.project_id = project_id;
		this.applyunit_status = applyunit_status;
		this.isdelete = isdelete;
	}
	public String getApplyunit_id() {
		return applyunit_id;
	}
	public void setApplyunit_id(String applyunit_id) {
		this.applyunit_id = applyunit_id;
	}
	public String getApplyunit_caogery() {
		return applyunit_caogery;
	}
	public void setApplyunit_caogery(String applyunit_caogery) {
		this.applyunit_caogery = applyunit_caogery;
	}
	public String getApplyunit_date() {
		return applyunit_date;
	}
	public void setApplyunit_date(String applyunit_date) {
		this.applyunit_date = applyunit_date;
	}
	public String getApplyunit_name() {
		return applyunit_name;
	}
	public void setApplyunit_name(String applyunit_name) {
		this.applyunit_name = applyunit_name;
	}
	public String getApplyunit_person() {
		return applyunit_person;
	}
	public void setApplyunit_person(String applyunit_person) {
		this.applyunit_person = applyunit_person;
	}
	public String getApplyunit_phone() {
		return applyunit_phone;
	}
	public void setApplyunit_phone(String applyunit_phone) {
		this.applyunit_phone = applyunit_phone;
	}
	public String getApplyunit_mail() {
		return applyunit_mail;
	}
	public void setApplyunit_mail(String applyunit_mail) {
		this.applyunit_mail = applyunit_mail;
	}
	public String getApplyunit_file() {
		return applyunit_file;
	}
	public void setApplyunit_file(String applyunit_file) {
		this.applyunit_file = applyunit_file;
	}
	public String getApplyunit_creater() {
		return applyunit_creater;
	}
	public void setApplyunit_creater(String applyunit_creater) {
		this.applyunit_creater = applyunit_creater;
	}
	public String getApplyunit_createtime() {
		return applyunit_createtime;
	}
	public void setApplyunit_createtime(String applyunit_createtime) {
		this.applyunit_createtime = applyunit_createtime;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getApplyunit_status() {
		return applyunit_status;
	}
	public void setApplyunit_status(String applyunit_status) {
		this.applyunit_status = applyunit_status;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	
	
}
