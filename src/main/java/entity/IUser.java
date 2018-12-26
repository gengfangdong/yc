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
	private String User_ydphone;//移动电话
	private String User_phone;//座机
	private String User_mail;//邮箱
	private String User_companyname;//单位名称
	private String User_department;//所在部门
	private String User_job;//任职岗位
	private String User_hold;//担任职务
	private String User_address;//地址
	private String User_password;//密码
	private String createtime;//创建时间
	private String isadmin;//是否为管理员  0为否  1为是
	private String User_status;//0为暂停 1为使用
	private String User_area;//区域
	private String isdelete;//是否删除  0为未删除 1为删除
	public IUser() {
		super();
	}
	public IUser(String user_id, String user_loginname, String user_name, String user_ydphone, String user_phone,
			String user_mail, String user_companyname, String user_department, String user_job, String user_hold,
			String user_address, String user_password, String createtime, String isadmin, String user_status,
			String user_area, String isdelete) {
		super();
		User_id = user_id;
		User_loginname = user_loginname;
		User_name = user_name;
		User_ydphone = user_ydphone;
		User_phone = user_phone;
		User_mail = user_mail;
		User_companyname = user_companyname;
		User_department = user_department;
		User_job = user_job;
		User_hold = user_hold;
		User_address = user_address;
		User_password = user_password;
		this.createtime = createtime;
		this.isadmin = isadmin;
		User_status = user_status;
		User_area = user_area;
		this.isdelete = isdelete;
	}
	public String getUser_ydphone() {
		return User_ydphone;
	}
	public void setUser_ydphone(String user_ydphone) {
		User_ydphone = user_ydphone;
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
	public String getUser_address() {
		return User_address;
	}
	public void setUser_address(String user_address) {
		User_address = user_address;
	}

	public String getUser_status() {
		return User_status;
	}

	public void setUser_status(String user_status) {
		User_status = user_status;
	}

	public String getUser_area() {
		return User_area;
	}

	public void setUser_area(String user_area) {
		User_area = user_area;
	}

	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	@Override
	public String toString() {
		return "IUser [User_id=" + User_id + ", User_loginname=" + User_loginname + ", User_name=" + User_name
				+ ", User_ydphone=" + User_ydphone + ", User_phone=" + User_phone + ", User_mail=" + User_mail
				+ ", User_companyname=" + User_companyname + ", User_department=" + User_department + ", User_job="
				+ User_job + ", User_hold=" + User_hold + ", User_address=" + User_address + ", User_password="
				+ User_password + ", createtime=" + createtime + ", isadmin=" + isadmin + ", User_status=" + User_status
				+ ", User_area=" + User_area + ", isdelete=" + isdelete + "]";
	}
	
	
	
	
}
