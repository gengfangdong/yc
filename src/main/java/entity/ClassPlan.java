package entity;

import java.io.Serializable;


public class ClassPlan implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7088254882251557896L;
	private String classplan_id;
	private String classplan_name;
	private String classplan_context;
	private String creater;
	private String createtime;
	private String isdelete;
	public ClassPlan() {
		super();
	}
	
	public ClassPlan(String classplan_id, String classplan_name,
			String classplan_context, String creater, String createtime,
			String isdelete) {
		super();
		this.classplan_id = classplan_id;
		this.classplan_name = classplan_name;
		this.classplan_context = classplan_context;
		this.creater = creater;
		this.createtime = createtime;
		this.isdelete = isdelete;
	}

	public String getClassplan_id() {
		return classplan_id;
	}
	public void setClassplan_id(String classplan_id) {
		this.classplan_id = classplan_id;
	}
	public String getClassplan_name() {
		return classplan_name;
	}
	public void setClassplan_name(String classplan_name) {
		this.classplan_name = classplan_name;
	}
	public String getClassplan_context() {
		return classplan_context;
	}
	public void setClassplan_context(String classplan_context) {
		this.classplan_context = classplan_context;
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

	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	
	
}
