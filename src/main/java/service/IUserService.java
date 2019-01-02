package service;



import entity.DatatablesViewPage;
import entity.IUser;


public interface IUserService {
	public void insertIUser(IUser IUser);
	public Boolean checkloginname(String user_loginname);
	public IUser login(String username,String password);
	public IUser getDetailByid(String User_id);
	public void updateIUser(IUser iUser);
	public void deleteIUser(String User_id);
	//DataTables 
	public DatatablesViewPage<IUser> GetlistPage(int start,int length);
	
	public boolean checkLoginNameAndUser_id(String user_id,String loginname);
	
	public void updateShow(IUser iUser);
	public void updatePassword(String password,String user_id);
}
