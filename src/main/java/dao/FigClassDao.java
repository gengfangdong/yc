package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.FigClass;

@Repository
public interface FigClassDao {
	public void insertFig(FigClass figClass);
	public List<FigClass> getDetail(@Param("figClass_id")String FigClass_id);
	public List<FigClass> getListBypage(@Param("status")String status,@Param("caogery")String caogery,@Param("start")int start,@Param("length")int limit);
	public int getListCount(@Param("caogery")String caogery,@Param("status")String status);
	public FigClass getFigbyidanduser(@Param("figClass_id")String figClass_id,@Param("User_id")String User_id);
}
