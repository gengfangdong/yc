package entity;

import java.io.Serializable;

import org.springframework.stereotype.Repository;
public class IUser implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 304976101504202082L;
	private String User_id;//用户id
	private String User_loginname;//登录名称
	private String User_name;//姓名
	private String User_phone;//座机
	private String User_mail;//邮箱
	private String User_companyname;//单位名称
	private String User_department;//所在部门
	private String User_job;//任职岗位
	private String User_hold;//担任职务
	private String User_password;//密码
	private String createtime;//创建时间
	private String isadmin;//是否为管理员  0为否  1为是
	public IUser() {
		super();
	}

	

	public IUser(String user_id, String user_loginname, String user_name,
			String user_phone, String user_mail, String user_companyname,
			String user_department, String user_job, String user_hold,
			String user_password, String createtime, String isadmin) {
		super();
		User_id = user_id;
		User_loginname = user_loginname;
		User_name = user_name;
		User_phone = user_phone;
		User_mail = user_mail;
		User_companyname = user_companyname;
		User_department = user_department;
		User_job = user_job;
		User_hold = user_hold;
		User_password = user_password;
		this.createtime = createtime;
		this.isadmin = isadmin;
	}



	public String getUser_id() {
		return User_id;
	}

	public void setUser_id(String user_id) {
		User_id = user_id;
	}

	public String getUser_loginname() {
		return User_loginname;
	}

	public void setUser_loginname(String user_loginname) {
		User_loginname = user_loginname;
	}

	public String getUser_name() {
		return User_name;
	}

	public void setUser_name(String user_name) {
		User_name = user_name;
	}

	public String getUser_phone() {
		return User_phone;
	}

	public void setUser_phone(String user_phone) {
		User_phone = user_phone;
	}

	public String getUser_mail() {
		return User_mail;
	}

	public void setUser_mail(String user_mail) {
		User_mail = user_mail;
	}

	public String getUser_companyname() {
		return User_companyname;
	}

	public void setUser_companyname(String user_companyname) {
		User_companyname = user_companyname;
	}

	public String getUser_department() {
		return User_department;
	}

	public void setUser_department(String user_department) {
		User_department = user_department;
	}

	public String getUser_job() {
		return User_job;
	}

	public void setUser_job(String user_job) {
		User_job = user_job;
	}

	public String getUser_hold() {
		return User_hold;
	}

	public void setUser_hold(String user_hold) {
		User_hold = user_hold;
	}

	public String getUser_password() {
		return User_password;
	}

	public void setUser_password(String user_password) {
		User_password = user_password;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}



	public String getIsadmin() {
		return isadmin;
	}



	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}
	
	
	
	
}
