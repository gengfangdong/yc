package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.User_project;

@Repository
@Transactional
public interface User_projectDao {
	public void insertUser_project(List<User_project> user_projects);
	public void deleteUserProject(@Param("ssuid")String ssuid);
	public int getCount(@Param("project_id")String project_id);
}
