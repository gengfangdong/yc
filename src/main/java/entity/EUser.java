package entity;

import java.io.Serializable;
		

public class EUser implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2091459487465280866L;
	private String EUser_id;//人员id
	private String EUser_name;//人员名字
	private String EUser_companyname;//单位
	private String EUser_department;//部门
	private String EUser_hold;//职务
	private String EUser_sex;//性别
	private String EUser_remark;//备注
	private String EUser_indentitynumber;//身份证号
	private String EUser_phone;//联系方式
	private String EUser_isdelete;//是否删除 0为未删除 1为已删除
	private String EUser_creater;//导入人
	private String EUser_createtime;//导入时间
	private String EUser_updater;//修改人
	private String EUser_updatetime;//修改时间
	
	
	public EUser() {
		super();
	}


	


	public String getEUser_id() {
		return EUser_id;
	}


	public void setEUser_id(String eUser_id) {
		EUser_id = eUser_id;
	}


	public String getEUser_name() {
		return EUser_name;
	}


	public void setEUser_name(String eUser_name) {
		EUser_name = eUser_name;
	}


	public String getEUser_companyname() {
		return EUser_companyname;
	}


	public void setEUser_companyname(String eUser_companyname) {
		EUser_companyname = eUser_companyname;
	}


	public String getEUser_department() {
		return EUser_department;
	}


	public void setEUser_department(String eUser_department) {
		EUser_department = eUser_department;
	}
	public String getEUser_hold() {
		return EUser_hold;
	}





	public void setEUser_hold(String eUser_hold) {
		EUser_hold = eUser_hold;
	}





	public String getEUser_sex() {
		return EUser_sex;
	}


	public void setEUser_sex(String eUser_sex) {
		EUser_sex = eUser_sex;
	}
	public String getEUser_remark() {
		return EUser_remark;
	}





	public void setEUser_remark(String eUser_remark) {
		EUser_remark = eUser_remark;
	}





	public String getEUser_indentitynumber() {
		return EUser_indentitynumber;
	}

	public void setEUser_indentitynumber(String eUser_indentitynumber) {
		EUser_indentitynumber = eUser_indentitynumber;
	}

	public String getEUser_phone() {
		return EUser_phone;
	}


	public void setEUser_phone(String eUser_phone) {
		EUser_phone = eUser_phone;
	}

	public String getEUser_isdelete() {
		return EUser_isdelete;
	}


	public void setEUser_isdelete(String eUser_isdelete) {
		EUser_isdelete = eUser_isdelete;
	}

	public String getEUser_creater() {
		return EUser_creater;
	}


	public void setEUser_creater(String eUser_creater) {
		EUser_creater = eUser_creater;
	}


	public String getEUser_createtime() {
		return EUser_createtime;
	}


	public void setEUser_createtime(String eUser_createtime) {
		EUser_createtime = eUser_createtime;
	}


	public String getEUser_updater() {
		return EUser_updater;
	}


	public void setEUser_updater(String eUser_updater) {
		EUser_updater = eUser_updater;
	}


	public String getEUser_updatetime() {
		return EUser_updatetime;
	}


	public void setEUser_updatetime(String eUser_updatetime) {
		EUser_updatetime = eUser_updatetime;
	}
	
	
	
	
}
