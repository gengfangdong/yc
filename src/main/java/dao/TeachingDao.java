package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Teaching;

@Repository
public interface TeachingDao {
	public void insertTeaching(Teaching teaching);
	public int getTeachingCount();
	public List<Teaching> getTeachingAllBypage(@Param("start")int start,@Param("length")int length);
	public Teaching getTeachingDetailByid(@Param("teaching_id")String teaching_id);
	public void updateTeaching(Teaching teaching);
	public void deleteTeaching(@Param("teaching_id")String teaching_id);
	public List<Teaching> findAllTeaching();
}
