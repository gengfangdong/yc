package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ApplyDao;
import dao.ApplyUnitDao;
import dao.ProjectDao;
import service.ProjectService;
import entity.Apply;
import entity.ApplyUnit;
import entity.DatatablesViewPage;
import entity.LayuiDataTable;
import entity.Project;
import entity.ProjectVo;

/**
 * @author my
 *
 */
@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao ProjectDao;
	@Autowired
	private ApplyDao applyDao;
	@Autowired
	private ApplyUnitDao applyUnitDao;
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
	public LayuiDataTable<ProjectVo> getListBypage(String status, int page,
			int limit, String user_id) {
		
		LayuiDataTable<ProjectVo> fDataTable = new LayuiDataTable<ProjectVo>();
		List<Project> projectList = new ArrayList<Project>();
		int count = 0;
		projectList = ProjectDao.getListBypage(status,user_id, (page-1)*limit, limit);
		List<ProjectVo> projectVos = new ArrayList<ProjectVo>();
		String statue="0";
		for (Project project:projectList) {
			statue="0";
			ProjectVo projectVo=new ProjectVo();
			projectVo.setProject_id(project.getProject_id());
			projectVo.setProject_name(project.getProject_name());
			projectVo.setProject_context(project.getProject_context());
			projectVo.setProject_creater(project.getProject_creater());
			projectVo.setProject_createtime(project.getProject_createtime());
			projectVo.setProject_date(project.getProject_date());
			//获取当前登录用户
			List<Apply> applyList=applyDao.getProjectStatus(user_id,project.getProject_id());
			List<ApplyUnit> applyUnitList=applyUnitDao.getProjectStatus(user_id,project.getProject_id());
			if (applyList.size()>0) {
				statue="1";
				projectVo.setApply_id(applyList.get(0).getApply_id());
				projectVo.setStatus(applyList.get(0).getCheck_status());
			}
			if (applyUnitList.size()>0) {
				statue="2";
				projectVo.setApplyunit_id(applyUnitList.get(0).getApplyunit_id());
				projectVo.setStatus(applyList.get(0).getCheck_status());
			}
			projectVo.setProject_status(statue);
			projectVos.add(projectVo);
		}
		fDataTable.setData(projectVos);
		fDataTable.setCount(ProjectDao.getProjectCount1(status,user_id, (page-1)*limit, limit));
		return fDataTable;
	}
	
	
	
}
