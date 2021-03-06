package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.EUser;
import entity.Ssuser;
@Repository
@Transactional
public interface SsuserDao {
	public void insertSsuser(Ssuser ssuser);
	public List<Ssuser> getSsuserByUserId(@Param("User_id")String User_id);
	public void deleteSsuser(@Param("ssuid")String ssuid,@Param("Project_id")String Project_id,@Param("User_id")String User_id);
	public List<String> getListUserByid(@Param("User_id")String user_id, @Param("ssuid")String ssuid);
	public List<String> getListUserByscid(@Param("scheduled_id")String scheduled_id);
	public List<String> getListUserByidsc(@Param("User_id")String user_id, @Param("scheduled_id")String sc_id);
	public List<String> getsuuid(@Param("User_id")String user_id,@Param("scheduled_id")String scheduled_id);
	public int getLavenumber(@Param("project_id")String project_id);
	public List<Ssuser> getByPage(@Param("project_id")String project_id,@Param("start")int start,@Param("limit")int limit);
	public int getcountByPage(@Param("project_id")String project_id);
	public List<Ssuser> getcountBynoPage(@Param("project_id")String project_id);
	public List<Ssuser> getDetailById(@Param("ssu_id")String ssu_id);
	public void updteStatus(Ssuser ssuser);
}
