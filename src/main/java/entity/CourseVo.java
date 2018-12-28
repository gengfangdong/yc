package entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JacksonInject;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
//定制和拼班的回显  加上了是否选中字段
public class CourseVo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4438195783998530498L;
	private String Course_id;
	private String First_course;
	private String Second_course;
	private String Third_course;
	private String Course_context;
	private String Creater;
	private String Createtime;
	private String isDelete;
	@JsonProperty("LAY_CHECKED")
	private Boolean LAY_CHECKED;
	public CourseVo() {
		super();
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
	public String getCourse_context() {
		return Course_context;
	}
	public void setCourse_context(String course_context) {
		Course_context = course_context;
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
	@JsonIgnore
	public Boolean getLAY_CHECKED() {
		return LAY_CHECKED;
	}
	@JsonIgnore
	public void setLAY_CHECKED(Boolean lAY_CHECKED) {
		LAY_CHECKED = lAY_CHECKED;
	}
}
