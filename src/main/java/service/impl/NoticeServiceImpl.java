package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NewsDao;
import dao.NoticeDao;
import service.NewsService;
import service.NoticeService;
import entity.DatatablesViewPage;
import entity.News;
import entity.Notice;

/**
 * @author my
 *
 */
@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	public void insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		noticeDao.insertNotice(notice);
	}
	public DatatablesViewPage<Notice> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Notice> datatablesViewPage = new DatatablesViewPage<Notice>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Notice> noticeList = new ArrayList<Notice>();
		
		noticeList = noticeDao.getNoticeAllBypage(start, start+length);
		
		recordsTotal = noticeDao.getNoticeCount();
		recordsFiltered = noticeDao.getNoticeCount();
		
		datatablesViewPage.setData(noticeList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Notice getNoticeDetailByid(String notice_id) {
		// TODO Auto-generated method stub
		
		return noticeDao.getNoticeDetailByid(notice_id);
	}
	public void updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		noticeDao.updateNotice(notice);
	}
	public void deleteNotice(String notice_id) {
		// TODO Auto-generated method stub
		noticeDao.deleteNotice(notice_id);
	}
	
	
	
}
