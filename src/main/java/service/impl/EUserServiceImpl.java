package service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.EUserDao;
import entity.EUser;
import entity.LayuiDataTable;
import entity.User_Constom;
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
		if("".equals(EUser_id)){
			eUsers = eUserDao.checkInum(EUser_indentitynumber, "");
		}
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
		eUsers = eUserDao.getEuserBypage((page-1)*limit, (page-1)*limit+limit,user_id);
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
	public void importEUser(List<EUser> eUsers, String user_id) {
		// TODO Auto-generated method stub
		List<EUser> newinsertEuser = new ArrayList<EUser>();
		List<EUser> newupdateEuser = new ArrayList<EUser>();
		//获取旧的人员列表
		List<EUser> oldEuser = new ArrayList<EUser>();
		oldEuser = eUserDao.getListBycreater(user_id);
		if(oldEuser != null && oldEuser.size()>0){
			//旧的人员map 身份证号为key 用来检测和新的人员表重复
			Map<String,Object> oldMap = new HashMap<String, Object>();
			for (EUser eUser : oldEuser) {
				oldMap.put(eUser.getEUser_indentitynumber(), eUser);
			}
			//判断人员
			for (EUser eUser : eUsers) {
				String indentitynumber = eUser.getEUser_indentitynumber();
				if(oldMap.get(indentitynumber)!=null){//如果人员存在  就把id替换
					eUser.setEUser_id(((EUser)oldMap.get(indentitynumber)).getEUser_id());
					newupdateEuser.add(eUser);
				}
				else{
					newinsertEuser.add(eUser);
				}
			}

			//获取新增的人员列表
			if(newinsertEuser != null && newinsertEuser.size()>0){
				eUserDao.insertByBatch(newinsertEuser);
			}
			if(newupdateEuser != null && newupdateEuser.size()>0){
				eUserDao.updatebatch(newupdateEuser);
			}
			
			
		}
		else{
			eUserDao.insertByBatch(eUsers);
		}
	}


}
