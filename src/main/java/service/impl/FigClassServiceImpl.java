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
import dao.CourseDao;
import dao.EUserDao;
import dao.FigClassDao;
import dao.FigfileDao;
import dao.User_FigClassDao;
import entity.EUser;
import entity.FigClass;
import entity.FigClassVo;
import entity.FigClassshowVo;
import entity.Figfile;
import entity.LayuiDataTable;
import entity.User_Figclass;
import service.FigClassService;
@Service
@Transactional
public class FigClassServiceImpl implements FigClassService {

	@Autowired
	private FigClassDao figClassDao;
	@Autowired
	private FigfileDao figfileDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private ClassPlanDao classPlanDao;
	@Autowired
	private EUserDao eUserDao;
	@Autowired
	private User_FigClassDao user_FigClassDao;
	public void insertFig(FigClass figClass, List<Figfile> figfiles) {
		// TODO Auto-generated method stub
		figClassDao.insertFig(figClass);
		figfileDao.insertBatch(figfiles);
	}

	public FigClass getDetailByid(String FigClass_id) {
		// TODO Auto-generated method stub
		FigClass figClass = new FigClass();
		List<FigClass> figClasses = new ArrayList<FigClass>();

		figClasses = figClassDao.getDetail(FigClass_id);
		if(figClasses!=null && figClasses.size()>0){
			figClass = figClasses.get(0);
			List<Figfile> figfiles = new ArrayList<Figfile>();
			figfiles = figfileDao.getListByid(FigClass_id);
			figClass.setFigFiles(figfiles);
		}
		return figClass;
	}

	public FigClassVo getDetail(String FigClass_id) {
		// TODO Auto-generated method stub
		FigClassVo figClassVo = new FigClassVo();
		FigClass figClass = new FigClass();
		List<FigClass> figClasses = new ArrayList<FigClass>();
		
		List<Object> objects = new ArrayList<Object>();
		figClasses = figClassDao.getDetail(FigClass_id);
		if(figClasses!=null && figClasses.size()>0){
			figClass = figClasses.get(0);
			List<Figfile> figfiles = new ArrayList<Figfile>();
			figfiles = figfileDao.getListByid(FigClass_id);
			figClass.setFigFiles(figfiles);
		}
		if("0".equals(figClass.getFigClass_caogery())){
			//方案
			objects.addAll(classPlanDao.getList(figClass.getFigClass_outline()));
		}
		else if("1".equals(figClass.getFigClass_caogery())){
			objects.addAll(courseDao.getList(figClass.getFigClass_outline()));
		}
		else if("3".equals(figClass.getFigClass_caogery())){
			//自由
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("data", figClass.getFigClass_outline());
			objects.add(map);
		}
		figClassVo.setFigClass(figClass);
		figClassVo.setObjects(objects);
		
		return figClassVo;
	}

	public LayuiDataTable<FigClassshowVo> getListBypage(String status, String caogery, int page, int limit, String user_id) {
		// TODO Auto-generated method stub
		LayuiDataTable<FigClassshowVo> fDataTable = new LayuiDataTable<FigClassshowVo>();
		List<FigClass> figClasses = new ArrayList<FigClass>();
		int count = 0;
		figClasses = figClassDao.getListBypage(status, caogery, (page-1)*limit, limit);
		List<FigClassshowVo> figClassshowVos = new ArrayList<FigClassshowVo>();
		if(figClasses!=null&&figClasses.size()>0){
			for (FigClass figClass : figClasses) {
				FigClassshowVo figClassshowVo = tranfrom(figClass);
				int num = 0;
				num = user_FigClassDao.getCountByid(user_id, figClassshowVo.getFigClass_id());				
				int lave = 0;	
				lave = Integer.valueOf(figClassshowVo.getFigClass_pernum())-num;
				figClassshowVo.setFigClass_number(lave);
				figClassshowVo.setUser_status(figClass.getFigClass_numstatus());
				figClassshowVos.add(figClassshowVo);
			}
		}
		fDataTable.setData(figClassshowVos);
		count = figClassDao.getListCount(caogery, status);
		fDataTable.setCount(count);
		return fDataTable;
	}
	
	
	private FigClassshowVo tranfrom(FigClass figClasss){
		FigClassshowVo figClassshowVos = new FigClassshowVo();
		figClassshowVos.setFigClass_id(figClasss.getFigClass_id());//id
		figClassshowVos.setFigClass_name(figClasss.getFigClass_name());//name
		figClassshowVos.setFigClass_start(figClasss.getFigClass_start_date());//报名开始
		figClassshowVos.setFigClass_end(figClasss.getFigClass_end_date());//报名结束
		figClassshowVos.setFigClass_class_start(figClasss.getFigClass_class_start());//开课
		figClassshowVos.setFigClass_class_end(figClasss.getFigClass_class_end());//结课
		figClassshowVos.setFigClass_pernum(figClasss.getFigClass_pernum());//容纳人数
		figClassshowVos.setFigClass_status(figClasss.getFigClass_status());//状态
		
		return figClassshowVos;
	}

	public int importUser(List<EUser> eUsers, String figClass_id, String user_id) {
		// TODO Auto-generated method stub
		int insert = 0;
		int update = 0;
		List<EUser> newinsertEuser = new ArrayList<EUser>();
		List<EUser> newupdateEuser = new ArrayList<EUser>();
		List<User_Figclass> user_Figclasses = new ArrayList<User_Figclass>();
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
				User_Figclass user_Figclass = new User_Figclass();
				user_Figclass.setCreater(user_id);
				user_Figclass.setCreatetime(APPLYDATE);
				user_Figclass.setFigClass_id(figClass_id);
				user_Figclass.setIsdelete("0");
				user_Figclass.setStatus("1");
				user_Figclass.setUpdater(user_id);
				user_Figclass.setUpdatetime(APPLYDATE);
				user_Figclass.setUserid(eUser.getEUser_id());
				user_Figclasses.add(user_Figclass);
				
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
				User_Figclass user_Figclass = new User_Figclass();
				user_Figclass.setCreater(user_id);
				user_Figclass.setCreatetime(APPLYDATE);
				user_Figclass.setFigClass_id(figClass_id);
				user_Figclass.setIsdelete("0");
				user_Figclass.setStatus("1");
				user_Figclass.setUpdater(user_id);
				user_Figclass.setUpdatetime(APPLYDATE);
				user_Figclass.setUserid(eUser.getEUser_id());
				user_Figclasses.add(user_Figclass);
				
			}
			eUserDao.insertByBatch(eUsers);
		}
		user_FigClassDao.insertUser_Fig(user_Figclasses);
		return insert+update;
	}

	//李  鹏   永
	
}
