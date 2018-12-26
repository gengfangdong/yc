package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.ClassPlan;

@Repository
public interface ClassPlanDao {
	public void insertClassPlan(ClassPlan classPlan);
	public void updateClassPlan(ClassPlan classPlan);
	public void deleteClassPlan(@Param("ClassPlan_id")String classPlan_id);
	public List<ClassPlan> getlist(@Param("start")int start,@Param("length")int length);
	public List<ClassPlan> getlistnopage();
	public int getClassPlanCount();
	public List<ClassPlan> getDetailByid(@Param("ClassPlan_id")String classPlan_id);
}
