package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Course;

@Repository
public interface CourseDao {
	public void insertCourse(Course course);
	public void deleteCourse(@Param("Course_id")String Course_id);
	public void updateCourse(Course course);
	public List<String> getfirst();
	public List<String> getsecond(@Param("First_course")String First_Course);
	public List<Course> getbyfands(@Param("First_course")String First_Course,@Param("Second_course")String Second_course,@Param("start")int start,@Param("length")int length);
	public List<Course> getCourseDetail(@Param("Course_id")String Course_id);
	
	public int getCourseCount(@Param("First_course")String First_Course,@Param("Second_course")String Second_course);
	
}
