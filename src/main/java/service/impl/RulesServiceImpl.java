package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.RulesService;
import dao.RulesDao;
import entity.DatatablesViewPage;
import entity.Rules;

/**
 * @author my
 *
 */
@Service
public class RulesServiceImpl implements RulesService{

	@Autowired
	private RulesDao rulesDao;
	public void insertRules(Rules rules) {
		// TODO Auto-generated method stub
		rulesDao.insertRules(rules);
	}
	public DatatablesViewPage<Rules> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Rules> datatablesViewPage = new DatatablesViewPage<Rules>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Rules> rulesList = new ArrayList<Rules>();
		
		rulesList = rulesDao.getRulesAllBypage(start, start+length);
		
		recordsTotal = rulesDao.getRulesCount();
		recordsFiltered = rulesDao.getRulesCount();
		
		datatablesViewPage.setData(rulesList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Rules getRulesDetailByid(String rules_id) {
		// TODO Auto-generated method stub
		
		return rulesDao.getRulesDetailByid(rules_id);
	}
	public void updateRules(Rules rules) {
		// TODO Auto-generated method stub
		rulesDao.updateRules(rules);
	}
	public void deleteRules(String rules_id) {
		// TODO Auto-generated method stub
		rulesDao.deleteRules(rules_id);
	}
	public DatatablesViewPage<Rules> findAllRules() {
		DatatablesViewPage<Rules> datatablesViewPage = new DatatablesViewPage<Rules>();
		
		List<Rules> rulesList = new ArrayList<Rules>();
		
		rulesList = rulesDao.findAllRules();
		
		datatablesViewPage.setData(rulesList);
		datatablesViewPage.setRecordsFiltered(1);
		datatablesViewPage.setRecordsTotal(1);
		
		return datatablesViewPage;
	}
	
	
	
}
