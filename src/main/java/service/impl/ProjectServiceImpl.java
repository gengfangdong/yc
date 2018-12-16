package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import dao.ProjectDao;
import service.ProjectService;
import entity.DatatablesViewPage;
import entity.Project;

/**
 * @author my
 *
 */
@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao ProjectDao;
	public void insertProject(Project Project) {
		// TODO Auto-generated method stub
		ProjectDao.insertProject(Project);
	}
	public DatatablesViewPage<Project> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Project> datatablesViewPage = new DatatablesViewPage<Project>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Project> ProjectList = new ArrayList<Project>();
		
		ProjectList = ProjectDao.getProjectAllBypage(start, start+length);
		
		recordsTotal = ProjectDao.getProjectCount();
		recordsFiltered = ProjectDao.getProjectCount();
		
		datatablesViewPage.setData(ProjectList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Project getProjectDetailByid(String Project_id) {
		// TODO Auto-generated method stub
		
		return ProjectDao.getProjectDetailByid(Project_id);
	}
	public void updateProject(Project Project) {
		// TODO Auto-generated method stub
		ProjectDao.updateProject(Project);
	}
	public void deleteProject(String Project_id) {
		// TODO Auto-generated method stub
		ProjectDao.deleteProject(Project_id);
	}
	
	
	
}
