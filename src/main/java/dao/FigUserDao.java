package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.FigUser;

@Repository
public interface FigUserDao {
	public void insertFiu(FigUser figUser);
	public void deleteFiu(@Param("fiu_id")String fiu_id);
	public List<FigUser> getByPage(@Param("start")int start,@Param("limit")int limit,@Param("figClass_id")String figClass_id);
	public int getcountByPage(@Param("figClass_id")String figClass_id);
	public List<String> getPage(@Param("figClass_id")String figClass_id);
	public List<FigUser> getByFigClassidanduserid(@Param("figClass_id")String figClass_id,@Param("user_id")String user_id);
	public void updateStatus(FigUser figUser);
	public List<FigUser> getBynoPage(@Param("figClass_id")String figClass_id);
}
