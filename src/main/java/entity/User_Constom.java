package entity;

import java.io.Serializable;

/*
 * USERID	N	VARCHAR2(64)	N			人员id
CONSTOM_ID	N	VARCHAR2(64)	N			定制班次id
STATUS	N	VARCHAR2(2)	N			状态0为报名中1为报名成功
ISDELETE	N	VARCHAR2(2)	N			0为未删除1为已删除
CREATER	N	VARCHAR2(64)	N			创建人
CREATETIME	N	VARCHAR2(100)	N			创建成功
UPDATER	N	VARCHAR2(64)	N			修改人
UPDATETIME	N	VARCHAR2(100)	N			修改成功
定制班次人员与项目的关联表
 */
public class User_Constom implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2537710987355768200L;
	private String Userid;
	private String Constom_id;
	private String status;
	private String isdelete;
	private String creater;
	private String createtime;
	private String updater;
	private String updatetime;
	public User_Constom() {
		super();
	}
	public String getUserid() {
		return Userid;
	}
	public void setUserid(String userid) {
		Userid = userid;
	}
	public String getConstom_id() {
		return Constom_id;
	}
	public void setConstom_id(String constom_id) {
		Constom_id = constom_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
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
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	
}
