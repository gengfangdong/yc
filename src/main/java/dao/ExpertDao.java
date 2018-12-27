package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Expert;

@Repository
public interface ExpertDao {
	public void insertExpert(Expert expert);
	public int getExpertCount();
	public List<Expert> getExpertAllBypage(@Param("start")int start,@Param("length")int length);
	public Expert getExpertDetailByid(@Param("expert_id")String expert_id);
	public void updateExpert(Expert expert);
	public void deleteExpert(@Param("expert_id")String expert_id);
}
