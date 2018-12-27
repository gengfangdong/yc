package service;

import java.util.List;

import entity.EUser;
import entity.Ssuser;

public interface SsuserService {
	public int UpdateorInsert(List<EUser> eUsers,String creater,Ssuser ssuser);
	public void SignOut(String Project_id,String User_id,String ssuid);
}
