package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.About;

@Repository
public interface AboutDao {
	public void insertAbout(About About);
	public int getAboutCount();
	public List<About> getAboutAllBypage(@Param("start")int start,@Param("length")int length);
	public About getAboutDetailByid(@Param("about_id")String about_id);
	public void updateAbout(About About);
	public void deleteAbout(@Param("about_id")String about_id);
	public List<About> findAllAbout();
}
