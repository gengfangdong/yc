package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.ApplyUnit;

@Repository
public interface ApplyUnitDao {
	public void insertApplyUnit(ApplyUnit ApplyUnit);
	public void deleteapplyunit(@Param("applyunit_id")String applyunit_id);
	public void update(ApplyUnit applyUnit);
	
	public List<ApplyUnit> getApplyUnitDetail(@Param("Applyunit_id")String Applyunit_id);
	public List<ApplyUnit> getProjectStatus(@Param("user_id")String user_id, @Param("project_id")String project_id);
	public void updatefile(ApplyUnit applyUnit);
}
