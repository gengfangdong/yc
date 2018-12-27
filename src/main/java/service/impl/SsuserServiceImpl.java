package service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.EUserDao;
import dao.SsuserDao;
import dao.User_projectDao;
import entity.EUser;
import entity.Ssuser;
import entity.User_project;
import service.SsuserService;
import util.UUIDUtil;
@Service
public class SsuserServiceImpl implements SsuserService {

	@Autowired
	private EUserDao eUserDao;
	@Autowired
	private User_projectDao user_projectDao;
	@Autowired
	private SsuserDao ssuserDao;
	@Transactional
	public int UpdateorInsert(List<EUser> eUsers,String creater,Ssuser ssuser) {
		// TODO Auto-generated method stub
		int insert = 0;
		int update = 0;
		List<EUser> newinsertEuser = new ArrayList<EUser>();
		List<EUser> newupdateEuser = new ArrayList<EUser>();
		List<User_project> user_projects = new ArrayList<User_project>();
		//获取旧的人员列表
		List<EUser> oldEuser = new ArrayList<EUser>();
		oldEuser = eUserDao.getListBycreater(creater);
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
				
				//创建时间
				SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
				String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
				//人员项目映射表
				User_project user_project = new User_project();
				user_project.setCreatetime(APPLYDATE);
				user_project.setIsdelete("0");
				user_project.setProject_id(ssuser.getSsu_ssid());
				user_project.setStatus("0");
				user_project.setUp_id(UUIDUtil.getUUid("up"));
				user_project.setUser_id(eUser.getEUser_id());
				user_project.setSsu_id(ssuser.getSsu_id());
				user_projects.add(user_project);
			}

			insert = newinsertEuser.size();
			update = newupdateEuser.size();
			//获取新增的人员列表
			if(newinsertEuser != null && newinsertEuser.size()>0){
				eUserDao.insertByBatch(newinsertEuser);
			}
			if(newupdateEuser != null && newupdateEuser.size()>0){
				eUserDao.updatebatch(newupdateEuser);
			}
			
			
		}
		else{
			//直接批量增加人员列表eUsers
			insert = eUsers.size();
			for (EUser eUser : eUsers) {
				//创建时间
				SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
				String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
				//人员项目映射表
				User_project user_project = new User_project();
				user_project.setCreatetime(APPLYDATE);
				user_project.setIsdelete("0");
				user_project.setProject_id(ssuser.getSsu_ssid());
				user_project.setStatus("0");
				user_project.setUp_id(UUIDUtil.getUUid("up"));
				user_project.setUser_id(eUser.getEUser_id());
				user_project.setSsu_id(ssuser.getSsu_id());
				user_projects.add(user_project);
			}
			eUserDao.insertByBatch(eUsers);
		}
			
		user_projectDao.insertUser_project(user_projects);
		ssuserDao.insertSsuser(ssuser);
		return insert + update;
	}
	@Transactional
	public void SignOut(String Project_id, String User_id,String ssuid) {
		// TODO Auto-generated method stub
		
		//1、将ssuser 表中的数据置为已删除
		ssuserDao.deleteSsuser(ssuid, Project_id, User_id);
		//2、批量将user_project表中的数据置为已删除
		user_projectDao.deleteUserProject(ssuid);
	}

}
