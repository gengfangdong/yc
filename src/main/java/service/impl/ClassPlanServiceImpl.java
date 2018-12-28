package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClassPlanDao;
import dao.ConstomDao;
import entity.ClassPlan;
import entity.ClassPlanVo;
import entity.ConstomVo;
import entity.DatatablesViewPage;
import entity.Free_constom;
import entity.LayuiDataTable;
import service.ClassPlanService;
@Service
public class ClassPlanServiceImpl implements ClassPlanService{

	@Autowired
	private ClassPlanDao classPlanDao;
	@Autowired
	private ConstomDao constomDao;

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

	public LayuiDataTable<ClassPlan> getListNoPage() {
		// TODO Auto-generated method stub
		LayuiDataTable<ClassPlan> cDataTable = new LayuiDataTable<ClassPlan>();
		
		List<ClassPlan> classPlans = new ArrayList<ClassPlan>();
		classPlans = classPlanDao.getlistnopage();
		int count = 0;
		count = classPlanDao.getClassPlanCount();
		cDataTable.setCount(count);
		cDataTable.setData(classPlans);
		return cDataTable;
	}

	public LayuiDataTable<ClassPlanVo> getListNoPageById(String constom_id) {
		// TODO Auto-generated method stub
		List<ClassPlanVo> classPlanVos = new ArrayList<ClassPlanVo>();
		LayuiDataTable<ClassPlanVo> cDataTable = new LayuiDataTable<ClassPlanVo>();
		List<ClassPlan> classPlans = new ArrayList<ClassPlan>();
		classPlans = classPlanDao.getlistnopage();
		int count = 0;
		count = classPlanDao.getClassPlanCount();
		if(classPlans!=null&&classPlans.size()>0){
			for (ClassPlan classPlan : classPlans) {
				ClassPlanVo classPlanVo = tranfrom(classPlan);
				List<Free_constom> free_constoms = constomDao.getDetailByid(constom_id);
				Free_constom free_constom = new Free_constom();
				if(free_constoms!=null&&free_constoms.size()>0){
					free_constom = free_constoms.get(0);
				}
				String outline = free_constom.getFreeco_outline();
				if(outline.indexOf(classPlan.getClassplan_id())>=0){
					classPlanVo.setLAY_CHECKED(true);
				}
				else
					classPlanVo.setLAY_CHECKED(false);
				classPlanVos.add(classPlanVo);
			}
		}
		cDataTable.setCount(count);
		cDataTable.setData(classPlanVos);
		return cDataTable;
	}
	
	private ClassPlanVo tranfrom(ClassPlan classPlan){
		ClassPlanVo classPlanVo = new ClassPlanVo();
		classPlanVo.setClassplan_context(classPlan.getClassplan_context());
		classPlanVo.setClassplan_id(classPlan.getClassplan_id());
		classPlanVo.setClassplan_name(classPlan.getClassplan_name());
		classPlanVo.setCreater(classPlan.getCreater());
		classPlanVo.setCreatetime(classPlan.getCreatetime());
		classPlanVo.setIsdelete(classPlan.getIsdelete());
		return classPlanVo;
	}

}
