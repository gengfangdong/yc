package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Free_constom;

@Repository
public interface ConstomDao {
	public void insertConstom(Free_constom constom);
	public List<Free_constom> getDetailByid(@Param("Constom_id")String constom_id);
	public void updateReview(@Param("Constom_id")String Constom_id,@Param("status")String status,
			@Param("updater")String updater,@Param("updatetime")String updatetime);
	public List<Free_constom> getListBypage(@Param("start")int start,@Param("length")int length,
			@Param("caogery")String caogery,@Param("status")String status,@Param("user_id")String user_id);
	public int getListCount(@Param("caogery")String caogery,@Param("status")String status,@Param("user_id")String user_id);
	public void deleteConstom(@Param("Constom_id")String constom_id,@Param("updater")String updater,@Param("updatetime")String updatetime);
	public void updateConstom(Free_constom free_constom);
	public void uploadfile(Free_constom free_constom);
	public void startScheduledco();
}
