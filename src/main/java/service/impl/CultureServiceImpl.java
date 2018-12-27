package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CultureDao;
import service.CultureService;
import entity.DatatablesViewPage;
import entity.Culture;

/**
 * @author my
 *
 */
@Service
public class CultureServiceImpl implements CultureService{

	@Autowired
	private CultureDao cultureDao;
	public void insertCulture(Culture culture) {
		// TODO Auto-generated method stub
		cultureDao.insertCulture(culture);
	}
	public DatatablesViewPage<Culture> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Culture> datatablesViewPage = new DatatablesViewPage<Culture>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Culture> cultureList = new ArrayList<Culture>();
		
		cultureList = cultureDao.getCultureAllBypage(start, start+length);
		
		recordsTotal = cultureDao.getCultureCount();
		recordsFiltered = cultureDao.getCultureCount();
		
		datatablesViewPage.setData(cultureList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Culture getCultureDetailByid(String culture_id) {
		// TODO Auto-generated method stub
		
		return cultureDao.getCultureDetailByid(culture_id);
	}
	public void updateCulture(Culture culture) {
		// TODO Auto-generated method stub
		cultureDao.updateCulture(culture);
	}
	public void deleteCulture(String culture_id) {
		// TODO Auto-generated method stub
		cultureDao.deleteCulture(culture_id);
	}
	
	
	
}
