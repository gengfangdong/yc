package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.IUserService;
import dao.IUserDao;
import entity.DatatablesViewPage;
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

	public IUser getDetailByid(String User_id) {
		// TODO Auto-generated method stub
		List<IUser> iUsers = new ArrayList<IUser>();
		iUsers = iUserDao.getDetailByid(User_id);
		if(iUsers != null && iUsers.size()>0){
			return iUsers.get(0);
		}
		return null;
	}

	public void updateIUser(IUser iUser) {
		// TODO Auto-generated method stub
		iUserDao.updateIUser(iUser);
	}

	public void deleteIUser(String User_id) {
		// TODO Auto-generated method stub
		iUserDao.deleteIUser(User_id);
	}

	public DatatablesViewPage<IUser> GetlistPage(int start, int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<IUser> datatablesViewPage = new DatatablesViewPage<IUser>();
		
		List<IUser> iUsers = new ArrayList<IUser>();
		iUsers = iUserDao.getListByPage(start, start+length);
		datatablesViewPage.setData(iUsers);
		int recordsTotal =0;
		int recordsFiltered = 0;
		recordsTotal = iUserDao.getCount();
		recordsFiltered = iUserDao.getCount();
		datatablesViewPage.setRecordsTotal(recordsTotal);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		return datatablesViewPage;
	}

	public boolean checkLoginNameAndUser_id(String user_id, String loginname) {
		// TODO Auto-generated method stub
		Boolean ishave = false;
		List<IUser> iUsers = new ArrayList<IUser>();
		iUsers = iUserDao.checkLoginNameAndUser_id(loginname, user_id);
		if (iUsers != null && iUsers.size() > 0) {
			ishave = true;
		} else
			ishave = false;
		return ishave;
	}

	public void updateShow(IUser iUser) {
		// TODO Auto-generated method stub
		iUserDao.updateShow(iUser);
	}

	public void updatePassword(String password, String user_id) {
		// TODO Auto-generated method stub
		iUserDao.updatePassword(password, user_id);
	}
	
}
