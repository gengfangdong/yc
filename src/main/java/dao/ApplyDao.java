package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Apply;

@Repository
public interface ApplyDao {
	public void insertApply(Apply Apply);
	public int getApplyCount();
	public List<Apply> getApplyAllBypage(@Param("start")int start,@Param("length")int length);
	public Apply getApplyDetailByid(@Param("Apply_id")String Apply_id);

	
	public List<Map<String,Object>> getApplyshow(@Param("start")int start,@Param("length")int length);
	public int getApplyshowcount();
	
	public void deleteapply(@Param("Apply_id")String Apply_id);
	public void updatestatus(@Param("status")String status,@Param("Apply_id")String Apply_id);
	
	public void updateapply(Apply apply);
}
