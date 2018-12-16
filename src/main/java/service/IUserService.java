package service;

import java.util.List;



import entity.IUser;

public interface IUserService {
	public void insertIUser(IUser IUser);
	public Boolean checkloginname(String user_loginname);
	public IUser login(String username,String password);
	
}
