package service;


import entity.ClassPlan;
import entity.DatatablesViewPage;

public interface ClassPlanService {
	public void insertClassPlan(ClassPlan classPlan);
	public void updateClassPlan(ClassPlan classPlan);
	public void deleteClassPlan(String classPlan_id);
	public DatatablesViewPage<ClassPlan> getlistBypage(int start,int length);
	public ClassPlan getDetailByid(String classPlan_id);
}
