package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.EUser;
import entity.LayuiDataTable;
import entity.Ssuser;

public interface SsuserService {
	public int UpdateorInsert(List<EUser> eUsers,String creater,Ssuser ssuser);
	public void SignOut(String Project_id,String User_id,String ssuid);
	public List<EUser> getListUserByid(String user_id, String ssuid);
    public int getCount(String project_id);
	public List<EUser> getListUserByscid(String scheduled_id);
	public List<EUser> getListUserByidmp(String user_id, String sc_id);
	public void SignOutmp(String project_id, String user_id);
	public void insertSSuser(Ssuser ssuser);
	public int getLavenumber(String project_id);
	public LayuiDataTable<Ssuser> getSsuserByPage(int start,int page,String project_id);
	public Ssuser getDetailById(String ssu_id);
	public List<Ssuser> getcountBynoPage(String project_id);
	
}
