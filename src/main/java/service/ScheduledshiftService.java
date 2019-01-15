package service;



import java.util.List;





import entity.DatatablesViewPage;
import entity.EUser;
import entity.LayuiDataTable;
import entity.ScheduledShiftShow;
import entity.Scheduledshift;

public interface ScheduledshiftService {
	public void insertScheduledshift(Scheduledshift scheduledshift);
	public void updateSch(Scheduledshift scheduledshift);
	public void deleteSch(String Scheduled_id);
	public Scheduledshift getDetailByid(String Scheduled_id);
	public DatatablesViewPage<Scheduledshift> getListBystatus(String Scheduled_status,int start,int length);
	public String getByScheduledfile(String filename);
	public void startScheduled();
	public LayuiDataTable<ScheduledShiftShow> getScByPage(int start,int limit,String user_id,String scstatus,String memstatus);
	//管理员自主报名
	public LayuiDataTable<ScheduledShiftShow> getAdminScByPage(int start,int limit,String status);
	public List<EUser> getListUserByid(String user_id, String scheduled_id);
	public void updateStatus(Scheduledshift scheduledshift);
}
