package service;

import entity.DatatablesViewPage;
import entity.ProjectView;

public interface ProjectViewService {
	public void insertProjectView(ProjectView projectView);
	//DataTables 
	public DatatablesViewPage<ProjectView> GetlistPage(int start,int length);
	//根据id获取项目概况详情
	public ProjectView getProjectViewDetailByid(String projectView_id);
	//修改项目概况
	public void updateProjectView(ProjectView projectView);
	//删除项目概况
	public void deleteProjectView(String projectView_id);
}
