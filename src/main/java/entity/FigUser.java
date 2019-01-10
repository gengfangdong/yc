package entity;

import java.io.Serializable;


/**
 *FIU_ID	N	VARCHAR2(64)	N			id
FIU_USERID	N	VARCHAR2(64)	N			用户id
FIU_FIGID	N	VARCHAR2(64)	N			拼班id
FIU_NUMBER	N	VARCHAR2(100)	N			报名人数
FIU_USERNAME	N	VARCHAR2(100)	N			联系人
FIU_YDPHONE	N	VARCHAR2(100)	N			联系人移动电话
FIU_PHONE	N	VARCHAR2(100)	N			联系人电话
FIU_DEPARTMENT	N	VARCHAR2(100)	N			联系人单位
FIU_CREATER	N	VARCHAR2(64)	N			报名人
FIU_CREATETIME	N	VARCHAR2(100)	N			报名时间
FIU_ISDELETE	N	VARCHAR2(2)	N			是否删除 0 为未删除 1为已删除
FIU_STATUS	N	VARCHAR2(2)	N			报名状态 0为成功 1为失败
 
 */

public class FigUser implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1095189895181409199L;
	private String Fiu_id;
	private String Fiu_userid;
	private String Fiu_figid;
	private String Fiu_number;
	private String Fiu_username;
	private String Fiu_ydphone;
	private String Fiu_phone;
	private String Fiu_department;
	private String Fiu_creater;
	private String Fiu_createtime;
	private String Fiu_isdelete;
	private String Fiu_status;
	public FigUser() {
		super();
	}
	public String getFiu_id() {
		return Fiu_id;
	}
	public void setFiu_id(String fiu_id) {
		Fiu_id = fiu_id;
	}
	public String getFiu_userid() {
		return Fiu_userid;
	}
	public void setFiu_userid(String fiu_userid) {
		Fiu_userid = fiu_userid;
	}
	public String getFiu_figid() {
		return Fiu_figid;
	}
	public void setFiu_figid(String fiu_figid) {
		Fiu_figid = fiu_figid;
	}
	public String getFiu_number() {
		return Fiu_number;
	}
	public void setFiu_number(String fiu_number) {
		Fiu_number = fiu_number;
	}
	public String getFiu_username() {
		return Fiu_username;
	}
	public void setFiu_username(String fiu_username) {
		Fiu_username = fiu_username;
	}
	public String getFiu_ydphone() {
		return Fiu_ydphone;
	}
	public void setFiu_ydphone(String fiu_ydphone) {
		Fiu_ydphone = fiu_ydphone;
	}
	public String getFiu_phone() {
		return Fiu_phone;
	}
	public void setFiu_phone(String fiu_phone) {
		Fiu_phone = fiu_phone;
	}
	public String getFiu_department() {
		return Fiu_department;
	}
	public void setFiu_department(String fiu_department) {
		Fiu_department = fiu_department;
	}
	public String getFiu_creater() {
		return Fiu_creater;
	}
	public void setFiu_creater(String fiu_creater) {
		Fiu_creater = fiu_creater;
	}
	public String getFiu_createtime() {
		return Fiu_createtime;
	}
	public void setFiu_createtime(String fiu_createtime) {
		Fiu_createtime = fiu_createtime;
	}
	public String getFiu_isdelete() {
		return Fiu_isdelete;
	}
	public void setFiu_isdelete(String fiu_isdelete) {
		Fiu_isdelete = fiu_isdelete;
	}
	public String getFiu_status() {
		return Fiu_status;
	}
	public void setFiu_status(String fiu_status) {
		Fiu_status = fiu_status;
	}
	
}
