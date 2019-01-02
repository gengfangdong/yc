package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.News;

@Repository
public interface NewsDao {
	public void insertNews(News news);
	public int getNewsCount();
	public List<News> getNewsAllBypage(@Param("start")int start,@Param("length")int length);
	public News getNewsDetailByid(@Param("news_id")String news_id);
	public void updateNews(News news);
	public void deleteNews(@Param("news_id")String news_id);
	public List<News> findAllNews();
}
