package entity;
/*USER_ID	N	VARCHAR2(64)	N			用户id
PROJECT_ID	N	VARCHAR2(64)	N			项目id
ISDELETE	N	VARCHAR2(2)	N			是否删除 0为未删除 1为删除
STATUS	N	VARCHAR2(2)	N			状态 0为报名中 1为成功 2为失败
CREATETIME	N	VARCHAR2(100)	N			创建时间
UP_ID	N	VARCHAR2(64)	N			ID
*/
import java.io.Serializable;
/**
 * 用户的项目表
 * @author my
 *
 */
public class User_project implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -331527958536817785L;
	private String Up_id;//ID
	private String User_id;//用户id
	private String Project_id;//项目id
	private String isdelete;//是否删除 0为未删除 1为删除
	private String status;//状态 0为报名中 1为成功 2为失败
	private String createtime;//创建时间
	private String ssu_id;//项目记录id
	public User_project() {
		super();
	}
	
	public User_project(String up_id, String user_id, String project_id, String isdelete, String status,
			String createtime, String ssu_id) {
		super();
		Up_id = up_id;
		User_id = user_id;
		Project_id = project_id;
		this.isdelete = isdelete;
		this.status = status;
		this.createtime = createtime;
		this.ssu_id = ssu_id;
	}

	public String getUp_id() {
		return Up_id;
	}
	public void setUp_id(String up_id) {
		Up_id = up_id;
	}
	public String getUser_id() {
		return User_id;
	}
	public void setUser_id(String user_id) {
		User_id = user_id;
	}
	public String getProject_id() {
		return Project_id;
	}
	public void setProject_id(String project_id) {
		Project_id = project_id;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getSsu_id() {
		return ssu_id;
	}

	public void setSsu_id(String ssu_id) {
		this.ssu_id = ssu_id;
	}
	
}
