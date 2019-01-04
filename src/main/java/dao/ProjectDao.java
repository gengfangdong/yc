package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Project;

@Repository
public interface ProjectDao {
	public void insertProject(Project Project);
	public int getProjectCount();
	public List<Project> getProjectAllBypage(@Param("start")int start,@Param("length")int length);
	public Project getProjectDetailByid(@Param("Project_id")String Project_id);
	public void updateProject(Project Project);
	public void deleteProject(@Param("Project_id")String Project_id);
	public List<Project> getListBypage(@Param("status")String status, @Param("user_id")String user_id, @Param("start")int start,@Param("limit") int limit);
	public int getProjectCount1(@Param("status")String status, @Param("user_id")String user_id, @Param("start")int start,@Param("limit") int limit);
}
