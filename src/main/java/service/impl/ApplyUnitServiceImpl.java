package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;










import dao.ApplyDao;
import dao.ApplyUnitDao;
import dao.ProjectDao;
import service.ApplyService;
import service.ApplyUnitService;
import service.ProjectService;
import entity.Apply;
import entity.ApplyUnit;
import entity.DatatablesViewPage;
import entity.Project;

/**
 * @author my
 *
 */
@Service
public class ApplyUnitServiceImpl implements ApplyUnitService{
	
	@Autowired
	private ApplyUnitDao applyUnitDao;
	
	public void insertApplyUnit(ApplyUnit Applyunit) {
		// TODO Auto-generated method stub
		if(Applyunit != null){
			applyUnitDao.insertApplyUnit(Applyunit);
		}
	}

	public ApplyUnit getApplyUnitDetail(String Applyunit_id) {
		// TODO Auto-generated method stub
		List<ApplyUnit> applyUnits = new ArrayList<ApplyUnit>();
		
		applyUnits = applyUnitDao.getApplyUnitDetail(Applyunit_id);
		
		if(applyUnits != null && applyUnits.size()>0){
			return applyUnits.get(0);
		}
		return null;
	}

	public void update(ApplyUnit applyUnit) {
		// TODO Auto-generated method stub
		applyUnitDao.update(applyUnit);
	}

	public void deleteapplyunit(String applyunit_id) {
		// TODO Auto-generated method stub
		applyUnitDao.deleteapplyunit(applyunit_id);
	}
	
	
}
