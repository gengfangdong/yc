package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.EUserDao;
import entity.EUser;
import entity.LayuiDataTable;
import service.EUserService;
@Service
public class EUserServiceImpl implements EUserService{

	@Autowired
	private EUserDao eUserDao;
	
	public void insertEUser(EUser eUser) {
		// TODO Auto-generated method stub
		eUserDao.insertEuser(eUser);
	}
	public Boolean checkInu(String EUser_indentitynumber,String EUser_id) {
		// TODO Auto-generated method stub
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = eUserDao.checkInum(EUser_indentitynumber, EUser_id);
		if(eUsers != null && eUsers.size()>0){
			return true;
		}
		return false;
	}

	public EUser getDetailByid(String User_id) {
		// TODO Auto-generated method stub
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = eUserDao.getDetail(User_id);
		if(eUsers == null || eUsers.size()==0){
			return null;
		}
		else
			return eUsers.get(0);
	}

	public void updateEUser(EUser eUser) {
		// TODO Auto-generated method stub
		eUserDao.updateEuser(eUser);
	}

	public void deleteEUser(String User_id) {
		// TODO Auto-generated method stub
		eUserDao.deleteEuser(User_id);
	}

	public void insertByBatch(List<entity.EUser> eUsers) {
		// TODO Auto-generated method stub
		if(eUsers != null && eUsers.size()>0){
			eUserDao.insertByBatch(eUsers);
		}
	}
	public LayuiDataTable<EUser> getListBypage(int page, int limit,String user_id) {
		// TODO Auto-generated method stub
		LayuiDataTable<EUser> eLayuiDataTable = new LayuiDataTable<EUser>();
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = eUserDao.getEuserBypage((page-1)*limit, limit,user_id);
		int count = 0;
		count = eUserDao.getcountBy(user_id);
		eLayuiDataTable.setCount(count);
		eLayuiDataTable.setData(eUsers);
		return eLayuiDataTable;
	}
	public List<EUser> getList(String User_id) {
		// TODO Auto-generated method stub
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = eUserDao.getList(User_id);
		return eUsers;
	}


}
