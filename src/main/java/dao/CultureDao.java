package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Culture;

@Repository
public interface CultureDao {
	public void insertCulture(Culture culture);
	public int getCultureCount();
	public List<Culture> getCultureAllBypage(@Param("start")int start,@Param("length")int length);
	public Culture getCultureDetailByid(@Param("culture_id")String culture_id);
	public void updateCulture(Culture culture);
	public void deleteCulture(@Param("culture_id")String culture_id);
	public List<Culture> findAllCulture();
}
