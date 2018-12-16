package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NewsDao;
import service.NewsService;
import entity.DatatablesViewPage;
import entity.News;

/**
 * @author my
 *
 */
@Service
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDao newsDao;
	public void insertNews(News news) {
		// TODO Auto-generated method stub
		newsDao.insertNews(news);
	}
	public DatatablesViewPage<News> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<News> datatablesViewPage = new DatatablesViewPage<News>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<News> newsList = new ArrayList<News>();
		
		newsList = newsDao.getNewsAllBypage(start, start+length);
		
		recordsTotal = newsDao.getNewsCount();
		recordsFiltered = newsDao.getNewsCount();
		
		datatablesViewPage.setData(newsList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public News getNewsDetailByid(String news_id) {
		// TODO Auto-generated method stub
		
		return newsDao.getNewsDetailByid(news_id);
	}
	public void updateNews(News news) {
		// TODO Auto-generated method stub
		newsDao.updateNews(news);
	}
	public void deleteNews(String news_id) {
		// TODO Auto-generated method stub
		newsDao.deleteNews(news_id);
	}
	
	
	
}
