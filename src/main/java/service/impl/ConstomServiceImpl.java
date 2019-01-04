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

import dao.ClassPlanDao;
import dao.ConstomDao;
import dao.ConstomfileDao;
import dao.CourseDao;
import dao.EUserDao;
import dao.User_ConstomDao;
import entity.ConstomVo;
import entity.Constomfile;
import entity.EUser;
import entity.Free_constom;
import entity.LayuiDataTable;
import entity.User_Constom;
import service.ConstomService;
@Service
@Transactional
public class ConstomServiceImpl implements ConstomService {

	@Autowired
	private ConstomDao constomDao;
	@Autowired
	private ConstomfileDao constomfileDao;
	@Autowired
	private EUserDao eUserDao;
	@Autowired
	private User_ConstomDao user_ConstomDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private ClassPlanDao classPlanDao;
	@Transactional
	public void insertConstom(Free_constom free_constom, List<Constomfile> constomfiles) {
		// TODO Auto-generated method stub
		constomDao.insertConstom(free_constom);
		constomfileDao.insertBatch(constomfiles);
		
	}

	public void updateReview(String Constom_id, String status, String updater, String updatetime) {
		// TODO Auto-generated method stub
		constomDao.updateReview(Constom_id, status, updater, updatetime);
	}

	public Free_constom getDetailByid(String constom_id) {
		// TODO Auto-generated method stub
		List<Free_constom> free_constoms = new ArrayList<Free_constom>();
		free_constoms = constomDao.getDetailByid(constom_id);
		if(free_constoms != null&&free_constoms.size()>0){
			Free_constom free_constom = free_constoms.get(0);
			List<Constomfile> constomfiles = new ArrayList<Constomfile>();
			constomfiles = constomfileDao.getConstomFilesByid(constom_id);
			if(constomfiles!=null && constomfiles.size()>0){
				free_constom.setConstomFiles(constomfiles);
			}
			return free_constom;
		}
		return null;
	}
	@Transactional
	public int ImportUser(List<EUser> eUsers, String Constom_id, String user_id) {
		// TODO Auto-generated method stub
		
		int insert = 0;
		int update = 0;
		List<EUser> newinsertEuser = new ArrayList<EUser>();
		List<EUser> newupdateEuser = new ArrayList<EUser>();
		List<User_Constom> user_Constoms = new ArrayList<User_Constom>();
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
				
				//创建时间
				SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
				String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
				User_Constom user_Constom = new User_Constom();
				user_Constom.setConstom_id(Constom_id);
				user_Constom.setCreater(user_id);
				user_Constom.setCreatetime(APPLYDATE);
				user_Constom.setIsdelete("0");
				user_Constom.setStatus("1");
				user_Constom.setUpdater(user_id);
				user_Constom.setUpdatetime(APPLYDATE);
				user_Constom.setUserid(eUser.getEUser_id());
				user_Constoms.add(user_Constom);
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
				User_Constom user_Constom = new User_Constom();
				user_Constom.setConstom_id(Constom_id);
				user_Constom.setCreater(user_id);
				user_Constom.setCreatetime(APPLYDATE);
				user_Constom.setIsdelete("0");
				user_Constom.setStatus("1");
				user_Constom.setUpdater(user_id);
				user_Constom.setUpdatetime(APPLYDATE);
				user_Constom.setUserid(eUser.getEUser_id());
				user_Constoms.add(user_Constom);
			}
			eUserDao.insertByBatch(eUsers);
		}
		user_ConstomDao.insertBatch(user_Constoms);
		//创建时间
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		Free_constom free_constom = new Free_constom();
		free_constom = getDetailByid(Constom_id);
		free_constom.setFreeco_numfile("1");
		free_constom.setFreeco_updater(user_id);
		free_constom.setFreeco_updatetime(APPLYDATE);
		constomDao.uploadfile(free_constom);
		return insert+update;
	}

	public LayuiDataTable<Free_constom> getListBypage(String status, String caogery, int page, int limit,String user_id) {
		// TODO Auto-generated method stub
		LayuiDataTable<Free_constom> fDataTable = new LayuiDataTable<Free_constom>();
		int count = 0;
		List<Free_constom> free_constoms = new ArrayList<Free_constom>();
		free_constoms = constomDao.getListBypage((page-1)*limit, (page-1)*limit+limit, caogery, status, user_id);
		if(free_constoms!=null&free_constoms.size()>0){
			fDataTable.setData(free_constoms);
			count = constomDao.getListCount(caogery, status, user_id);
		}
		
		fDataTable.setCount(count);
		return fDataTable;
	}

	public ConstomVo getShow(String constom_id) {
		// TODO Auto-generated method stub
		ConstomVo constomVo = new ConstomVo();
		Free_constom free_constom = new Free_constom();
		free_constom = getDetailByid(constom_id);
		constomVo.setConstom(free_constom);
		List<Object> cbject = new ArrayList<Object>();
		if("0".equals(free_constom.getFreeco_gaoery())){
			//方案
			cbject.addAll(classPlanDao.getList(free_constom.getFreeco_outline()));
		}else if("1".equals(free_constom.getFreeco_gaoery())){
			//课程
			cbject.addAll(courseDao.getList(free_constom.getFreeco_outline()));
		}else if("2".equals(free_constom.getFreeco_gaoery())){
			//自由
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("data", free_constom.getFreeco_outline());
			cbject.add(map);
		}
		constomVo.setObject(cbject);
		return constomVo;
	}

	public void deleteConstom(String Constom_id,String User_id) {
		// TODO Auto-generated method stub
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String updatetime = simpleDateFormat.format(new Date());
		constomfileDao.deleteConstom(Constom_id);
		constomDao.deleteConstom(Constom_id, User_id, updatetime);
	}

	public void updateConstom(Free_constom free_constom) {
		// TODO Auto-generated method stub
		constomfileDao.deleteConstom(free_constom.getFreeco_id());
		constomDao.updateConstom(free_constom);
		constomfileDao.insertBatch(free_constom.getConstomFiles());
	}
	
	public String getByfilename(String filename) {
		// TODO Auto-generated method stub
		List<String> filenames = new ArrayList<String>();
		filenames = constomfileDao.getByfilename(filename);
		if(filenames!=null&&filenames.size()>0){
			return filenames.get(0);
		}
		return null;
	}

	public List<EUser> getListUserByid(String user_id, String constom_id) {
		// TODO Auto-generated method stub
		List<String> ids = new ArrayList<String>();
		List<EUser> eUsers = new ArrayList<EUser>();
		ids = user_ConstomDao.getListUserByid(user_id, constom_id);
		if(ids == null || ids.size()<=0){
			return null;
		}
		else{
			eUsers = eUserDao.getEUserList(ids);
		}
		return eUsers;
	}
	
}
