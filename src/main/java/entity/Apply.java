package entity;

import java.io.Serializable;

public class Apply implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6477162468877931440L;
	private String Apply_id;//申请id
	private String name;//姓名
	private String sex;//性别  0为男  1为女
	private String brithday;//出生日期
	private String indentity_number;//"身份证号	"
	private String political_status;//政治面貌  0党员 1群众 2民主党派
	private String phone_number;//手机号码
	private String phone_code;//电话号码
	private String mail;//电子邮箱
	private String department;//所在部门
	private String job;//任职岗位
	private String address;//"通讯地址	"
	private String other;//其他信息
	private String project_id;//
	private String position;//任职职务
	private String creater;//创建人
	private String createtime;//创建时间
	private String check_status;//审核状态
	private String isdelete;//是否删除 0为未删除 1为删除
	private String apply_caogery;//报名类型
	private String applydate;//申请日期
	private String remark;//审核理由
	public Apply() {
		super();
	}

	
	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getApply_id() {
		return Apply_id;
	}

	public void setApply_id(String apply_id) {
		Apply_id = apply_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBrithday() {
		return brithday;
	}

	public void setBrithday(String brithday) {
		this.brithday = brithday;
	}

	public String getIndentity_number() {
		return indentity_number;
	}

	public void setIndentity_number(String indentity_number) {
		this.indentity_number = indentity_number;
	}

	public String getPolitical_status() {
		return political_status;
	}

	public void setPolitical_status(String political_status) {
		this.political_status = political_status;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getPhone_code() {
		return phone_code;
	}

	public void setPhone_code(String phone_code) {
		this.phone_code = phone_code;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getCheck_status() {
		return check_status;
	}

	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}

	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}

	public String getApply_caogery() {
		return apply_caogery;
	}

	public void setApply_caogery(String apply_caogery) {
		this.apply_caogery = apply_caogery;
	}

	public String getApplydate() {
		return applydate;
	}

	public void setApplydate(String applydate) {
		this.applydate = applydate;
	}
	
	
	
}
