package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import entity.Scheduledshift;

public interface ScheduledshiftDao {
	public void insertScheduledshift(Scheduledshift scheduledshift);
	public void updateSch(Scheduledshift scheduledshift);
	public void deleteSch(@Param("Scheduled_id")String Scheduled_id);
	public List<Scheduledshift> getDetailByid(@Param("Scheduled_id")String Scheduled_id);
	public List<Scheduledshift> getListBystatus(@Param("Scheduled_status")String Scheduled_status,@Param("start")int start,@Param("length")int length);
	public int getcountBystatus(@Param("Scheduled_status")String Scheduled_status);
	public void startScheduled();
	public List<Map<String,Object>> getLastNumber(@Param("start")int start,@Param("length")int limit,@Param("user_id")String user_id,
			@Param("scstatus")String scstatus,@Param("memstatus")String memstatus);
	public int getCountLastNumber(@Param("user_id")String user_id,
			@Param("scstatus")String scstatus,@Param("memstatus")String memstatus);
	public List<Map<String,Object>> getAdminLastNumber(@Param("start")int start,@Param("length")int limit,@Param("status")String status);
	public int getAdminCountLastNumber(@Param("status")String status);
	public void updateStatus(Scheduledshift scheduledshift);
}
