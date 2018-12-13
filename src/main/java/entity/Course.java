package entity;

import java.io.Serializable;

public class Course implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 302401489946391462L;
	private String Course_id;
	private String First_course;
	private String Second_course;
	private String Third_course;
	private String Course_context;
	private String Creater;
	private String Createtime;
	private String isDelete;
	public Course() {
		super();
	}
	
	

	public Course(String course_id, String first_course, String second_course,
			String third_course, String course_context, String creater,
			String createtime, String isDelete) {
		super();
		Course_id = course_id;
		First_course = first_course;
		Second_course = second_course;
		Third_course = third_course;
		Course_context = course_context;
		Creater = creater;
		Createtime = createtime;
		this.isDelete = isDelete;
	}



	public String getCourse_id() {
		return Course_id;
	}
	public void setCourse_id(String course_id) {
		Course_id = course_id;
	}
	public String getFirst_course() {
		return First_course;
	}
	public void setFirst_course(String first_course) {
		First_course = first_course;
	}
	public String getSecond_course() {
		return Second_course;
	}
	public void setSecond_course(String second_course) {
		Second_course = second_course;
	}
	public String getThird_course() {
		return Third_course;
	}
	public void setThird_course(String third_course) {
		Third_course = third_course;
	}
	public String getCreater() {
		return Creater;
	}
	public void setCreater(String creater) {
		Creater = creater;
	}
	public String getCreatetime() {
		return Createtime;
	}
	public void setCreatetime(String createtime) {
		Createtime = createtime;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}



	public String getCourse_context() {
		return Course_context;
	}



	public void setCourse_context(String course_context) {
		Course_context = course_context;
	}
	
	
	
}
