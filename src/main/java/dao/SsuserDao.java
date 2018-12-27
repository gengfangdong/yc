package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.Ssuser;
@Repository
@Transactional
public interface SsuserDao {
	public void insertSsuser(Ssuser ssuser);
	public List<Ssuser> getSsuserByUserId(@Param("User_id")String User_id);
	public void deleteSsuser(@Param("ssuid")String ssuid,@Param("Project_id")String Project_id,@Param("User_id")String User_id);
}