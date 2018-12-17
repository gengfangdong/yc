package service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CourseDao;
import entity.About;
import entity.ApplyShowVo;
import entity.Course;
import entity.DatatablesViewPage;
import entity.LayuiDataTable;
import entity.Notice;
import service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDao courseDao;
	public void insertCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.insertCourse(course);
	}

	public void deleteCourse(String Course_id) {
		// TODO Auto-generated method stub
		courseDao.deleteCourse(Course_id);
	}

	public void updateCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.updateCourse(course);
	}

	public List<String> getfirst() {
		// TODO Auto-generated method stub
		
		return courseDao.getfirst();
	}

	public List<String> getsecond(String First_Course) {
		// TODO Auto-generated method stub
		return courseDao.getsecond(First_Course);
	}

	public List<Course> getbyfands(String First_Course, String Second_course) {
		// TODO Auto-generated method stub
		return null;
	}

	public Course getCourseDetail(String Course_id) {
		// TODO Auto-generated method stub
		List<Course> courses = new ArrayList<Course>();
		courses = courseDao.getCourseDetail(Course_id);
		if(courses==null&&courses.size()==0){
			return null;
		}
		return courses.get(0);
	}

	public DatatablesViewPage<Course> GetlistPage(int start, int length,
			String First_course, String Second_course) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Course> datatablesViewPage = new DatatablesViewPage<Course>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Course> courses = new ArrayList<Course>();
		
		courses = courseDao.getbyfands(First_course, Second_course,start,start+length);
		
		recordsTotal = courseDao.getCourseCount(First_course, Second_course);
		recordsFiltered = courseDao.getCourseCount(First_course, Second_course);
		
		datatablesViewPage.setData(courses);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}

	public LayuiDataTable<Course> gDataTable(int page, int limit, String First_course, String Second_course) {
		// TODO Auto-generated method stub
		LayuiDataTable<Course> cDataTable = new LayuiDataTable<Course>();
		int count = 0;
		count = courseDao.getCourseCount(First_course, Second_course);
		List<Course> courses = new ArrayList<Course>();
		courses = courseDao.getbyfands(First_course, Second_course, (page-1)*limit, limit);
		cDataTable.setCount(count);
		cDataTable.setData(courses);
		return cDataTable;
	}

	
	
}
