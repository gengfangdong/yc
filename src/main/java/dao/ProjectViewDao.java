package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.ProjectView;

@Repository
public interface ProjectViewDao {
	public void insertProjectView(ProjectView ProjectView);
	public int getProjectViewCount();
	public List<ProjectView> getProjectViewAllBypage(@Param("start")int start,@Param("length")int length);
	public ProjectView getProjectViewDetailByid(@Param("projectView_id")String projectView_id);
	public void updateProjectView(ProjectView ProjectView);
	public void deleteProjectView(@Param("projectView_id")String projectView_id);
}
