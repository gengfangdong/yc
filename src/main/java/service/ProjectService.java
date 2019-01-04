package service;

import entity.DatatablesViewPage;
import entity.LayuiDataTable;
import entity.Project;
import entity.ProjectVo;

public interface ProjectService {
	public void insertProject(Project Project);
	//DataTables 
	public DatatablesViewPage<Project> GetlistPage(int start,int length);
	//根据id获取项目详情
	public Project getProjectDetailByid(String Project_id);
	//修改项目
	public void updateProject(Project Project);
	//删除项目
	public void deleteProject(String Project_id);
	public LayuiDataTable<ProjectVo> getListBypage(String status, int page,
			int limit, String user_id);
}
