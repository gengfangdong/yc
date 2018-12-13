package service;

import entity.DatatablesViewPage;
import entity.News;

public interface NewsService {
	public void insertNews(News news);
	//DataTables 
	public DatatablesViewPage<News> GetlistPage(int start,int length);
	//根据id获取新闻详情
	public News getNewsDetailByid(String news_id);
	//修改新闻
	public void updateNews(News news);
	//删除新闻
	public void deleteNews(String news_id);
}
