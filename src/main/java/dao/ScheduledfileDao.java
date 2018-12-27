package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Scheduledfile;
@Repository
public interface ScheduledfileDao {
	public List<Scheduledfile> getbyScheduledid(@Param("Scheduled_id")String Scheduled_id);
	public void deleteScheduled(@Param("Scheduled_id")String Scheduled_id);
	public void insertScheduledfile(Scheduledfile scheduledfile);
	public List<String> getByfilename(@Param("filename")String filename);
}
