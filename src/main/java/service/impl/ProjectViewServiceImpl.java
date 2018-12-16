package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProjectViewDao;
import service.ProjectViewService;
import entity.DatatablesViewPage;
import entity.ProjectView;

/**
 * @author my
 *
 */
@Service
public class ProjectViewServiceImpl implements ProjectViewService{

	@Autowired
	private ProjectViewDao ProjectViewDao;
	public void insertProjectView(ProjectView ProjectView) {
		// TODO Auto-generated method stub
		ProjectViewDao.insertProjectView(ProjectView);
	}
	public DatatablesViewPage<ProjectView> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<ProjectView> datatablesViewPage = new DatatablesViewPage<ProjectView>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<ProjectView> ProjectViewList = new ArrayList<ProjectView>();
		
		ProjectViewList = ProjectViewDao.getProjectViewAllBypage(start, start+length);
		
		recordsTotal = ProjectViewDao.getProjectViewCount();
		recordsFiltered = ProjectViewDao.getProjectViewCount();
		
		datatablesViewPage.setData(ProjectViewList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public ProjectView getProjectViewDetailByid(String ProjectView_id) {
		// TODO Auto-generated method stub
		
		return ProjectViewDao.getProjectViewDetailByid(ProjectView_id);
	}
	public void updateProjectView(ProjectView ProjectView) {
		// TODO Auto-generated method stub
		ProjectViewDao.updateProjectView(ProjectView);
	}
	public void deleteProjectView(String ProjectView_id) {
		// TODO Auto-generated method stub
		ProjectViewDao.deleteProjectView(ProjectView_id);
	}
	
	
	
}
