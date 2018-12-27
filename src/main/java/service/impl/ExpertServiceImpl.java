package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ExpertDao;
import service.ExpertService;
import entity.DatatablesViewPage;
import entity.Expert;

/**
 * @author my
 *
 */
@Service
public class ExpertServiceImpl implements ExpertService{

	@Autowired
	private ExpertDao expertDao;
	public void insertExpert(Expert expert) {
		// TODO Auto-generated method stub
		expertDao.insertExpert(expert);
	}
	public DatatablesViewPage<Expert> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Expert> datatablesViewPage = new DatatablesViewPage<Expert>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Expert> expertList = new ArrayList<Expert>();
		
		expertList = expertDao.getExpertAllBypage(start, start+length);
		
		recordsTotal = expertDao.getExpertCount();
		recordsFiltered = expertDao.getExpertCount();
		
		datatablesViewPage.setData(expertList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Expert getExpertDetailByid(String expert_id) {
		// TODO Auto-generated method stub
		
		return expertDao.getExpertDetailByid(expert_id);
	}
	public void updateExpert(Expert expert) {
		// TODO Auto-generated method stub
		expertDao.updateExpert(expert);
	}
	public void deleteExpert(String expert_id) {
		// TODO Auto-generated method stub
		expertDao.deleteExpert(expert_id);
	}
	
	
	
}
