package service;

import java.util.List;



import entity.About;
import entity.Course;
import entity.DatatablesViewPage;

public interface CourseService {
	public void insertCourse(Course course);
	public void deleteCourse(String Course_id);
	public void updateCourse(Course course);
	public List<String> getfirst();
	public List<String> getsecond(String First_Course);
	public List<Course> getbyfands(String First_Course,String Second_course);
	public Course getCourseDetail(String Course_id);
	
	//DataTables 
	public DatatablesViewPage<Course> GetlistPage(int start,int length,String First_course,String Second_course);
}