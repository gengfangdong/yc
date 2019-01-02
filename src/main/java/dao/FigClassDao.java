package dao;

import java.util.List;
import java.util.Map;

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
	public void deleteFig(@Param("FigClass_id")String FigClass_id,@Param("User_id")String user_id,@Param("updatetime")String updatetime);
	public void updateReview(@Param("figclass_id")String figclass_id, @Param("result_review")String review_result, @Param("updater")String updater, @Param("updatetime")String updatetime);
	public List<Map<String,Object>> getMemProject(@Param("user_id")String user_id,@Param("start")int start,@Param("limit")int limit,@Param("status")String status);
	public int getProjectCount(@Param("user_id")String user_id,@Param("start")int start,@Param("limit")int limit,@Param("status")String status);
}
