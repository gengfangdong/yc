package entity;
/*SSU_ID	N	VARCHAR2(64)	N			
SSU_USERID	N	VARCHAR2(64)	N			
SSU_SSID	N	VARCHAR2(64)	N			
SSU_USERNUMBER	N	VARCHAR2(100)	N			
SSU_USERNAME	N	VARCHAR2(100)	N			
SSU_YDPHONE	N	VARCHAR2(100)	N			联系人移动电话
SSU_PHONE	N	VARCHAR2(50)	N			联系人电话
SSU_DEPARTMENT	N	VARCHAR2(100)	N			联系人单位
SSU_CREATER	N	VARCHAR2(100)	N			报名人
SSU_CREATETIME	N	VARCHAR2(100)	N			报名时间
SSU_ISDELETE	N	VARCHAR2(2)	N			是否删除 0为未删除 1为删除
SSU_STATUS	N	VARCHAR2(2)	N			报名状态 0为成功 1为失败*/

import java.io.Serializable;
/**
 * 人员自主报名表
 * @author my
 *
 */
public class Ssuser implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7986120098133723610L;
	private String Ssu_id;//id
	private String Ssu_userid;//用户id
	private String Ssu_ssid;//自主报名id
	private String Ssu_usernumber;//报名人数
	private String Ssu_username;//联系人
	private String Ssu_ydphone;//联系人移动电话
	private String Ssu_phone;//联系人电话
	private String Ssu_department;//联系人单位
	private String Ssu_creater;//报名人
	private String Ssu_createtime;//报名时间
	private String Ssu_isdelete;//是否删除 0为未删除 1为删除
	private String Ssu_status;//报名状态 0为成功 1为失败
	public Ssuser() {
		super();
	}
	public Ssuser(String ssu_id, String ssu_userid, String ssu_ssid, String ssu_usernumber, String ssu_username,
			String ssu_ydphone, String ssu_phone, String ssu_department, String ssu_creater, String ssu_createtime,
			String ssu_isdelete, String ssu_status) {
		super();
		Ssu_id = ssu_id;
		Ssu_userid = ssu_userid;
		Ssu_ssid = ssu_ssid;
		Ssu_usernumber = ssu_usernumber;
		Ssu_username = ssu_username;
		Ssu_ydphone = ssu_ydphone;
		Ssu_phone = ssu_phone;
		Ssu_department = ssu_department;
		Ssu_creater = ssu_creater;
		Ssu_createtime = ssu_createtime;
		Ssu_isdelete = ssu_isdelete;
		Ssu_status = ssu_status;
	}
	public String getSsu_id() {
		return Ssu_id;
	}
	public void setSsu_id(String ssu_id) {
		Ssu_id = ssu_id;
	}
	public String getSsu_userid() {
		return Ssu_userid;
	}
	public void setSsu_userid(String ssu_userid) {
		Ssu_userid = ssu_userid;
	}
	public String getSsu_ssid() {
		return Ssu_ssid;
	}
	public void setSsu_ssid(String ssu_ssid) {
		Ssu_ssid = ssu_ssid;
	}
	public String getSsu_usernumber() {
		return Ssu_usernumber;
	}
	public void setSsu_usernumber(String ssu_usernumber) {
		Ssu_usernumber = ssu_usernumber;
	}
	public String getSsu_username() {
		return Ssu_username;
	}
	public void setSsu_username(String ssu_username) {
		Ssu_username = ssu_username;
	}
	public String getSsu_ydphone() {
		return Ssu_ydphone;
	}
	public void setSsu_ydphone(String ssu_ydphone) {
		Ssu_ydphone = ssu_ydphone;
	}
	public String getSsu_phone() {
		return Ssu_phone;
	}
	public void setSsu_phone(String ssu_phone) {
		Ssu_phone = ssu_phone;
	}
	public String getSsu_department() {
		return Ssu_department;
	}
	public void setSsu_department(String ssu_department) {
		Ssu_department = ssu_department;
	}
	public String getSsu_creater() {
		return Ssu_creater;
	}
	public void setSsu_creater(String ssu_creater) {
		Ssu_creater = ssu_creater;
	}
	public String getSsu_createtime() {
		return Ssu_createtime;
	}
	public void setSsu_createtime(String ssu_createtime) {
		Ssu_createtime = ssu_createtime;
	}
	public String getSsu_isdelete() {
		return Ssu_isdelete;
	}
	public void setSsu_isdelete(String ssu_isdelete) {
		Ssu_isdelete = ssu_isdelete;
	}
	public String getSsu_status() {
		return Ssu_status;
	}
	public void setSsu_status(String ssu_status) {
		Ssu_status = ssu_status;
	}
	
	
}
