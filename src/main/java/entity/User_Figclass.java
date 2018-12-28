package entity;

import java.io.Serializable;

/*
 * 用户参与的拼班项目
 * USERID	N	VARCHAR2(64)	N			人员id
FIGCLASS_ID	N	VARCHAR2(64)	N			拼班id
STATUS	N	VARCHAR2(2)	N			状态0为报名中1为报名成功
ISDELETE	N	VARCHAR2(2)	N			0为未删除1为已删除
CREATER	N	VARCHAR2(64)	N			创建人
CREATETIME	N	VARCHAR2(100)	N			创建成功
UPDATER	N	VARCHAR2(64)	N			修改人
UPDATETIME	N	VARCHAR2(100)	N			修改成功

 */
public class User_Figclass implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5433307873533526387L;
	private String Userid;
	private String figClass_id;
	private String status;
	private String isdelete;
	private String creater;
	private String createtime;
	private String updater;
	private String updatetime;
	public User_Figclass() {
		super();
	}
	public String getUserid() {
		return Userid;
	}
	public void setUserid(String userid) {
		Userid = userid;
	}
	public String getFigClass_id() {
		return figClass_id;
	}
	public void setFigClass_id(String figClass_id) {
		this.figClass_id = figClass_id;
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
