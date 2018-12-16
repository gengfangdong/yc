package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClassPlanDao;
import entity.ClassPlan;
import entity.DatatablesViewPage;
import service.ClassPlanService;
@Service
public class ClassPlanServiceImpl implements ClassPlanService{

	@Autowired
	private ClassPlanDao classPlanDao;

	public void insertClassPlan(ClassPlan classPlan) {
		// TODO Auto-generated method stub
		classPlanDao.insertClassPlan(classPlan);
	}

	public void updateClassPlan(ClassPlan classPlan) {
		// TODO Auto-generated method stub
		classPlanDao.updateClassPlan(classPlan);
	}

	public void deleteClassPlan(String classPlan_id) {
		// TODO Auto-generated method stub
		classPlanDao.deleteClassPlan(classPlan_id);
	}

	public DatatablesViewPage<ClassPlan> getlistBypage(int start, int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<ClassPlan> datatablesViewPage = new DatatablesViewPage<ClassPlan>();
		
		int recordsTotal  = 0 ;
		int recordsFiltered = 0;
		recordsTotal = classPlanDao.getClassPlanCount();
		recordsFiltered = classPlanDao.getClassPlanCount();
		
		List<ClassPlan> classPlans = new ArrayList<ClassPlan>();
		
		classPlans = classPlanDao.getlist(start, start+length);
		
		if(classPlans != null){
			datatablesViewPage.setData(classPlans);
		}
		else
			datatablesViewPage.setData(null);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		return datatablesViewPage;
	}

	public ClassPlan getDetailByid(String classPlan_id) {
		// TODO Auto-generated method stub
		List<ClassPlan> classPlans = new ArrayList<ClassPlan>();
		classPlans = classPlanDao.getDetailByid(classPlan_id);
		if(classPlans != null &&classPlans.size()>0){
			return classPlans.get(0);
		}
		return null;
	}

}
