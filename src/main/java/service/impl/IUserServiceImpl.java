package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.IUserService;
import dao.IUserDao;
import entity.IUser;

@Service
public class IUserServiceImpl implements IUserService{
	@Autowired
	private IUserDao iUserDao;

	public void insertIUser(IUser IUser) {
		// TODO Auto-generated method stub
		if(IUser != null)
			iUserDao.insertIUser(IUser);
		
	}

	public Boolean checkloginname(String user_loginname) {
		// TODO Auto-generated method stub
		Boolean ishave = false;
		List<IUser> iUsers = new ArrayList<IUser>();
		iUsers = iUserDao.checkloginname(user_loginname);
		if(iUsers != null && iUsers.size()>0){
			ishave = true;
		}
		else
			ishave = false;
		return ishave;
	}

	public IUser login(String username,String password) {
		// TODO Auto-generated method stub
		IUser iUser = new IUser();
		iUser.setUser_loginname(username);
		iUser.setUser_password(password);
		List<IUser> iUsers = new ArrayList<IUser>();
		iUsers = iUserDao.login(iUser);
		if(iUsers != null&&iUsers.size() > 0){
			return iUsers.get(0);
		}
		else
			return null;
	}
	
}
