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
import dao.IUserDao;
import dao.SsuserDao;
import dao.User_projectDao;
import entity.EUser;
import entity.LayuiDataTable;
import entity.Ssuser;
import entity.User_project;
import service.SsuserService;
import util.UUIDUtil;
@Service
@Transactional
public class SsuserServiceImpl implements SsuserService {

	@Autowired
	private EUserDao eUserDao;
	@Autowired
	private User_projectDao user_projectDao;
	@Autowired
	private SsuserDao ssuserDao;
	@Autowired
	private IUserDao iuserDao;
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
		user_projectDao.deleteUserProject(ssuser.getSsu_id());	
		user_projectDao.insertUser_project(user_projects);
		ssuserDao.updteStatus(ssuser);
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
	
	@Transactional
	public void SignOutmp(String Project_id, String User_id) {
		// TODO Auto-generated method stub
		String ssuid = ssuserDao.getsuuid(User_id, Project_id).get(0);
		//1、将ssuser 表中的数据置为已删除
		ssuserDao.deleteSsuser(ssuid, Project_id, User_id);
		//2、批量将user_project表中的数据置为已删除
		user_projectDao.deleteUserProject(ssuid);
	}
	public List<EUser> getListUserByid(String user_id, String ssuid) {
		// TODO Auto-generated method stub
		List<String> ssusers = new ArrayList<String>();
		ssusers = ssuserDao.getListUserByid(user_id, ssuid);
		if(ssusers != null && ssusers.size()>0){
			List<EUser> eUsers = new ArrayList<EUser>();
			eUsers = eUserDao.getEUserList(ssusers);
			return eUsers;
		}
		return null;
	}
	public int getCount(String project_id) {
		// TODO Auto-generated method stub
		return user_projectDao.getCount(project_id);
	}

	public List<EUser> getListUserByscid(String scheduled_id) {
		// TODO Auto-generated method stub
		List<String> ssusers = new ArrayList<String>();
		ssusers = ssuserDao.getListUserByscid(scheduled_id);
		if (ssusers != null && ssusers.size() > 0) {
			List<EUser> eUsers = new ArrayList<EUser>();
			eUsers = eUserDao.getEUserList(ssusers);
			return eUsers;
		}
		return null;
	}
	@Override
	public List<EUser> getListUserByidmp(String user_id, String sc_id) {
		// TODO Auto-generated method stub
		List<String> ssusers = new ArrayList<String>();
		ssusers = ssuserDao.getListUserByidsc(user_id, sc_id);
		if (ssusers != null && ssusers.size() > 0) {
			List<EUser> eUsers = new ArrayList<EUser>();
			eUsers = eUserDao.getEUserList(ssusers);
			return eUsers;
		}
		return null;
	}
	@Override
	public void insertSSuser(Ssuser ssuser) {
		// TODO Auto-generated method stub
		ssuserDao.insertSsuser(ssuser);
	}
	@Override
	public int getLavenumber(String project_id) {
		// TODO Auto-generated method stub
		int count = 0;
		count = ssuserDao.getLavenumber(project_id);
		return count;
	}
	@Override
	public LayuiDataTable<Ssuser> getSsuserByPage(int start, int page, String project_id) {
		// TODO Auto-generated method stub
		LayuiDataTable<Ssuser> sDataTable = new LayuiDataTable<>();
		List<Ssuser> ssusers = new ArrayList<>();
		int count = 0;
		ssusers = ssuserDao.getByPage(project_id, (start-1)*page, start*page);
		if(ssusers != null && ssusers.size()>0){
			for (Ssuser ssuser : ssusers) {
				ssuser.setSsu_creater(iuserDao.getDetailByid(ssuser.getSsu_creater()).get(0).getUser_name());
			}
			sDataTable.setData(ssusers);
			count = ssuserDao.getcountByPage(project_id);
		}
		sDataTable.setCount(count);
		return sDataTable;
	}
	@Override
	public Ssuser getDetailById(String ssu_id) {
		// TODO Auto-generated method stub
		List<Ssuser> ssusers = new ArrayList<>();
		ssusers = ssuserDao.getDetailById(ssu_id);
		if(ssusers!=null&&ssusers.size()>0){
			return ssusers.get(0);
		}
		return null;
	}
	

}
