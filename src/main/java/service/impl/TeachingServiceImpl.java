package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TeachingDao;
import service.TeachingService;
import entity.DatatablesViewPage;
import entity.Teaching;

/**
 * @author my
 *
 */
@Service
public class TeachingServiceImpl implements TeachingService{

	@Autowired
	private TeachingDao teachingDao;
	public void insertTeaching(Teaching teaching) {
		// TODO Auto-generated method stub
		teachingDao.insertTeaching(teaching);
	}
	public DatatablesViewPage<Teaching> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Teaching> datatablesViewPage = new DatatablesViewPage<Teaching>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Teaching> teachingList = new ArrayList<Teaching>();
		
		teachingList = teachingDao.getTeachingAllBypage(start, start+length);
		
		recordsTotal = teachingDao.getTeachingCount();
		recordsFiltered = teachingDao.getTeachingCount();
		
		datatablesViewPage.setData(teachingList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Teaching getTeachingDetailByid(String teaching_id) {
		// TODO Auto-generated method stub
		
		return teachingDao.getTeachingDetailByid(teaching_id);
	}
	public void updateTeaching(Teaching teaching) {
		// TODO Auto-generated method stub
		teachingDao.updateTeaching(teaching);
	}
	public void deleteTeaching(String teaching_id) {
		// TODO Auto-generated method stub
		teachingDao.deleteTeaching(teaching_id);
	}
	
	
	
}
