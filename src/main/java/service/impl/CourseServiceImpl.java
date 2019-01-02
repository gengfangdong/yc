package service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ConstomDao;
import dao.CourseDao;
import dao.FigClassDao;
import entity.About;
import entity.ApplyShowVo;
import entity.Course;
import entity.CourseVo;
import entity.DatatablesViewPage;
import entity.FigClass;
import entity.Free_constom;
import entity.LayuiDataTable;
import entity.Notice;
import service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private ConstomDao constomDao;
	@Autowired
	private FigClassDao figClassDao;
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

	public LayuiDataTable<Course> gnpDataTable(String First_course, String Second_course) {
		// TODO Auto-generated method stub

		LayuiDataTable<Course> cDataTable = new LayuiDataTable<Course>();
		int count = 0;
		count = courseDao.getCourseCount(First_course, Second_course);
		List<Course> courses = new ArrayList<Course>();
		courses = courseDao.getnopage(First_course, Second_course);
		cDataTable.setCount(count);
		cDataTable.setData(courses);
		return cDataTable;
	}

	public LayuiDataTable<CourseVo> gnpDataTableByid(String First_course, String Second_course, String constom_id) {
		// TODO Auto-generated method stub
		LayuiDataTable<CourseVo> cDataTable = new LayuiDataTable<CourseVo>();
		int count = 0;
		count = courseDao.getCourseCount(First_course, Second_course);
		List<CourseVo> coursevos = new ArrayList<CourseVo>();
		List<Course> courses = new ArrayList<Course>();
		courses = courseDao.getnopage(First_course, Second_course);
		List<Free_constom> free_constoms = constomDao.getDetailByid(constom_id);
		Free_constom free_constom = new Free_constom();
		if(free_constoms!=null&&free_constoms.size()>0){
			free_constom = free_constoms.get(0);
		}
		String outline = free_constom.getFreeco_outline();
		coursevos = tranfrom(courses, outline);
		cDataTable.setCount(count);
		cDataTable.setData(coursevos);
		return cDataTable;
	}

	public List<CourseVo> tranfrom(List<Course> courses,String outline){
		List<CourseVo> courseVos = new ArrayList<CourseVo>();
		for (Course course : courses) {
			CourseVo courseVo = new CourseVo();
			courseVo.setCourse_id(course.getCourse_id());
			courseVo.setCourse_context(course.getCourse_context());
			courseVo.setCreater(course.getCreater());
			courseVo.setCreatetime(course.getCreatetime());
			courseVo.setFirst_course(course.getFirst_course());
			courseVo.setIsDelete(course.getIsDelete());
			courseVo.setSecond_course(course.getSecond_course());
			courseVo.setThird_course(course.getThird_course());
			if(outline.indexOf(course.getCourse_id())>=0){
				courseVo.setLAY_CHECKED(true);
			}
			else
				courseVo.setLAY_CHECKED(false);
			courseVos.add(courseVo);
		}
		return courseVos;
	}

	public LayuiDataTable<CourseVo> gnpDataTableBYfid(int page, int limit, String first_course, String second_course,
			String figClass_id) {
		// TODO Auto-generated method stub
		LayuiDataTable<CourseVo> cDataTable = new LayuiDataTable<CourseVo>();
		int count = 0;
		count = courseDao.getCourseCount(first_course, second_course);
		List<CourseVo> coursevos = new ArrayList<CourseVo>();
		List<Course> courses = new ArrayList<Course>();
		courses = courseDao.getnopage(first_course, second_course);
		List<FigClass> figClasses = figClassDao.getDetail(figClass_id);
		FigClass figClass = new FigClass();
		if (figClasses != null && figClasses.size() > 0) {
			figClass = figClasses.get(0);
		}
		String outline = figClass.getFigClass_outline();
		coursevos = tranfrom(courses, outline);
		cDataTable.setCount(count);
		cDataTable.setData(coursevos);
		return cDataTable;
	}
	
	
}
