package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AboutDao;
import service.AboutService;
import entity.DatatablesViewPage;
import entity.About;

/**
 * @author my
 *
 */
@Service
public class AboutServiceImpl implements AboutService{

	@Autowired
	private AboutDao AboutDao;
	public void insertAbout(About About) {
		// TODO Auto-generated method stub
		AboutDao.insertAbout(About);
	}
	public DatatablesViewPage<About> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<About> datatablesViewPage = new DatatablesViewPage<About>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<About> AboutList = new ArrayList<About>();
		
		AboutList = AboutDao.getAboutAllBypage(start, start+length);
		
		recordsTotal = AboutDao.getAboutCount();
		recordsFiltered = AboutDao.getAboutCount();
		
		datatablesViewPage.setData(AboutList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public About getAboutDetailByid(String about_id) {
		// TODO Auto-generated method stub
		
		return AboutDao.getAboutDetailByid(about_id);
	}
	public void updateAbout(About About) {
		// TODO Auto-generated method stub
		AboutDao.updateAbout(About);
	}
	public void deleteAbout(String about_id) {
		// TODO Auto-generated method stub
		AboutDao.deleteAbout(about_id);
	}
	
	
	
}
