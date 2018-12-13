package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import dao.RotationPicDao;

import service.RotationPicService;
import entity.DatatablesViewPage;

import entity.RotationPic;

/**
 * @author my
 *
 */
@Service
public class RotationPicServiceImpl implements RotationPicService{

	@Autowired
	private RotationPicDao RotationPicDao;
	public void insertRotationPic(RotationPic RotationPic) {
		// TODO Auto-generated method stub
		RotationPicDao.insertRotationPic(RotationPic);
	}
	public DatatablesViewPage<RotationPic> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<RotationPic> datatablesViewPage = new DatatablesViewPage<RotationPic>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<RotationPic> RotationPicList = new ArrayList<RotationPic>();
		
		RotationPicList = RotationPicDao.getRotationPicAllBypage(start, start+length);
		
		recordsTotal = RotationPicDao.getRotationPicCount();
		recordsFiltered = RotationPicDao.getRotationPicCount();
		
		datatablesViewPage.setData(RotationPicList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public RotationPic getRotationPicDetailByid(String RotationPic_id) {
		// TODO Auto-generated method stub
		
		return RotationPicDao.getRotationPicDetailByid(RotationPic_id);
	}
	public void updateRotationPic(RotationPic RotationPic) {
		// TODO Auto-generated method stub
		RotationPicDao.updateRotationPic(RotationPic);
	}
	public void deleteRotationPic(String RotationPic_id) {
		// TODO Auto-generated method stub
		RotationPicDao.deleteRotationPic(RotationPic_id);
	}
	
	
	
}
