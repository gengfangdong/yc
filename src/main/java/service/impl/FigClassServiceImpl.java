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
import entity.Free_constom;
import entity.IUser;
import entity.LayuiDataTable;
import entity.MemProjectVo;
import entity.ScheduledShiftShow;
import entity.User_Figclass;
import service.ConstomService;
import service.FigClassService;
import service.ScheduledshiftService;
import util.StringUtil;
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
	private ScheduledshiftService sc;
	@Autowired
	private ConstomService constomService;
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

	public LayuiDataTable<FigClassshowVo> getListBypage(String isbm,String status, String caogery, int page, int limit, String user_id) {
		// TODO Auto-generated method stub
		LayuiDataTable<FigClassshowVo> fDataTable = new LayuiDataTable<FigClassshowVo>();
		List<FigClass> figClasses = new ArrayList<FigClass>();
		int count = 0;
		figClasses = figClassDao.getListBypage(isbm,user_id,status, caogery, (page-1)*limit, limit);
		List<FigClassshowVo> figClassshowVos = new ArrayList<FigClassshowVo>();
		if(figClasses!=null&&figClasses.size()>0){
			for (FigClass figClass : figClasses) {
				FigClassshowVo figClassshowVo = tranfrom(figClass);
				int num = 0;
				num = user_FigClassDao.getCountByid(null, figClassshowVo.getFigClass_id());				
				int lave = 0;	
				lave = Integer.valueOf(figClassshowVo.getFigClass_pernum())-num;
				figClassshowVo.setFigClass_number(lave);
				List<String> ids = new ArrayList<String>();
				ids = user_FigClassDao.getUserByid(figClassshowVo.getFigClass_id());
				if(ids != null && ids.size()>=0){
					if(ids.contains(user_id)){
						figClassshowVo.setUser_status("1");
					}
					else
						figClassshowVo.setUser_status("0");
				}
				else
					figClassshowVo.setUser_status("0");
				figClassshowVos.add(figClassshowVo);
			}
		}
		fDataTable.setData(figClassshowVos);
		count = figClassDao.getListCount(isbm,user_id,caogery, status);
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
		/*// 创建时间
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		FigClass figClass = new FigClass();
		figClass = getDetailByid(figClass_id);
		figClass.setFreeco_numfile("1");
		figClass.setFreeco_updater(user_id);
		figClass.setFreeco_updatetime(APPLYDATE);
		constomDao.uploadfile(free_constom);*/
		return insert+update;
	}

	public void deleteFigClass(String figclass_id, String user_id) {
		// TODO Auto-generated method stub
		//创建时间
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		user_FigClassDao.deleteFig(user_id, APPLYDATE, figclass_id, user_id);
	}

	public String getByfilename(String filename) {
		// TODO Auto-generated method stub
		List<String> filenames = new ArrayList<String>();
		filenames = figfileDao.getByfilename(filename);
		if(filenames!=null&&filenames.size()>0){
			return filenames.get(0);
		}
		return null;
	}

	public void updateReview(String figclass_id, String review_result, String updater, String updatetime) {
		// TODO Auto-generated method stub
		figClassDao.updateReview(figclass_id, review_result, updater, updatetime);
	}

	public List<EUser> getListUserByid(String user_id, String figclass_id) {
		// TODO Auto-generated method stub
		List<String> ids = new ArrayList<String>();
		List<EUser> eUsers = new ArrayList<EUser>();
		ids = user_FigClassDao.getuserlist(user_id, figclass_id);
		if(ids == null || ids.size()<=0){
			return null;
		}
		else{
			eUsers = eUserDao.getEUserList(ids);
		}
		return eUsers;
	}

	public LayuiDataTable<MemProjectVo> getMemProjectByuser(String caogery, String status, String user_id,int page,int limit) {
		// TODO Auto-generated method stub
		//判断类别信息
		LayuiDataTable<MemProjectVo> mDataTable = new LayuiDataTable<MemProjectVo>();
		int count = 0;
		List<MemProjectVo> memProjectVos = new ArrayList<MemProjectVo>();
		if("0".equals(caogery)){//定制
			LayuiDataTable<Free_constom> fDataTable = constomService.getListBypage(status, "", page, limit, user_id);
			if(fDataTable!=null&&fDataTable.getData().size()>0){
				for (Free_constom free_constom : fDataTable.getData()) {
					MemProjectVo memProjectVo = new MemProjectVo();
					memProjectVo.setProject_id(free_constom.getFreeco_id());
					memProjectVo.setProject_caogery("0");
					memProjectVo.setProject_datanum(free_constom.getFreeco_datanum());
					memProjectVo.setProject_name(free_constom.getFreeco_name());
					memProjectVo.setProject_pernum(free_constom.getFreeco_pernum());
					memProjectVo.setProject_start(free_constom.getFreeco_data());
					memProjectVos.add(memProjectVo);
				}
			}
			mDataTable.setCode(0);
			mDataTable.setCount(fDataTable.getCount());
			mDataTable.setData(memProjectVos);
			mDataTable.setMsg("");
		}else if("1".equals(caogery)){//规定
			LayuiDataTable<ScheduledShiftShow> sDataTable = sc.getScByPage(page, limit,user_id,status,"");
			if(sDataTable!=null&&sDataTable.getData().size()>0){
				for (ScheduledShiftShow scheduledShiftShow : sDataTable.getData()) {
					MemProjectVo memProjectVo = new MemProjectVo();
					memProjectVo.setProject_id(scheduledShiftShow.getSuuid());
					memProjectVo.setProject_caogery("1");
					memProjectVo.setProject_datanum(scheduledShiftShow.getDataNumber());
					memProjectVo.setProject_name(scheduledShiftShow.getScheduledshift().getScheduled_name());
					memProjectVo.setProject_pernum(scheduledShiftShow.getNumber());
					memProjectVo.setProject_start(scheduledShiftShow.getScheduledshift().getScheduled_class_start());
					memProjectVos.add(memProjectVo);
				}
			}
			mDataTable.setCode(0);
			mDataTable.setCount(sDataTable.getCount());
			mDataTable.setData(memProjectVos);
			mDataTable.setMsg("");
		}else if("2".equals(caogery)){//拼班
			LayuiDataTable<FigClassshowVo> fDataTable = getListBypage("",status, "", page, limit, user_id);
			if(fDataTable!=null&&fDataTable.getData().size()>0){
				for (FigClassshowVo figClassshowVo : fDataTable.getData()) {
					MemProjectVo memProjectVo = new MemProjectVo();
					memProjectVo.setProject_id(figClassshowVo.getFigClass_id());
					memProjectVo.setProject_caogery("1");
					memProjectVo.setProject_datanum(""+StringUtil.getDataSub(figClassshowVo.getFigClass_class_start(), figClassshowVo.getFigClass_class_end()));
					memProjectVo.setProject_name(figClassshowVo.getFigClass_name());
					memProjectVo.setProject_pernum(figClassshowVo.getFigClass_pernum());
					memProjectVo.setProject_start(figClassshowVo.getFigClass_class_start());
					memProjectVos.add(memProjectVo);
				}
			}
			mDataTable.setCode(0);
			mDataTable.setCount(fDataTable.getCount());
			mDataTable.setData(memProjectVos);
			mDataTable.setMsg("");
		}else if("".equals(caogery)){//所有
			List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
			maps = figClassDao.getMemProject(user_id, (page-1)*limit, limit, status);
			if(maps != null && maps.size()>0){
				for (Map<String, Object> map : maps) {
					MemProjectVo memProjectVo = new MemProjectVo();
					memProjectVo.setProject_id(map.get("PROJECT_ID").toString());
					String caog = map.get("PROJECT_CAOGERY").toString();
					memProjectVo.setProject_caogery(caog);
					
					memProjectVo.setProject_name(map.get("PROJECT_NAME").toString());
					if("0".equals(caog)){//定制   方案定制上面有天数   FREECO_DAY  课程定制没有  自由定制有天数   FREECO_DATANUM
						if(map.get("PROJECT_DATANUM") == null){
							if(map.get("PROJECT_DAY") == null){
								memProjectVo.setProject_datanum("待定");
							}
							else 
								memProjectVo.setProject_datanum(map.get("PROJECT_DAY").toString());
						}
						else
							memProjectVo.setProject_datanum(map.get("PROJECT_DATANUM").toString());
						memProjectVo.setProject_pernum(map.get("PROJECT_PERNUM").toString());
						
					}else if ("1".equals(caog)){//规定  SCHEDULED_CLASS_START  SCHEDULED_CLASS_END
						memProjectVo.setProject_pernum(map.get("PROJECT_PERNUM").toString());
						memProjectVo.setProject_datanum(""+StringUtil.getDataSub(map.get("PROJECT_START").toString(), map.get("PROJECT_END").toString()));
					}else if("2".equals(caog)){//拼班  FIGCLASS_CLASS_START FIGCLASS_CLASS_END
						memProjectVo.setProject_pernum(map.get("PROJECT_PERNUM").toString());
						memProjectVo.setProject_datanum(""+StringUtil.getDataSub(map.get("PROJECT_START").toString(), map.get("PROJECT_END").toString()));
					}
					memProjectVo.setProject_start(map.get("PROJECT_START").toString());
					memProjectVo.setProject_allnum(map.get("PROJECT_ALLNUM").toString());
					memProjectVo.setProject_status(map.get("PROJECT_STATUS").toString());
					memProjectVos.add(memProjectVo);
					
				}
				int counta = 0;
				counta = figClassDao.getProjectCount(user_id, (page-1)*limit, limit, status);
				mDataTable.setCode(0);
				mDataTable.setCount(counta);
				mDataTable.setData(memProjectVos);
				mDataTable.setMsg("");
			}else{
				mDataTable.setCode(0);
				mDataTable.setCount(0);
				mDataTable.setData(memProjectVos);
				mDataTable.setMsg("");
			}
			
		}
		return mDataTable;
	}

	public void deleteFig(String figclass_id, IUser iuser) {
		// TODO Auto-generated method stub
		//删除拼班
		//创建时间
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		figClassDao.deleteFig(figclass_id, iuser.getUser_id(), APPLYDATE);
		user_FigClassDao.deleteFigClass(iuser.getUser_id(), APPLYDATE, figclass_id);
	}

	public int getCountByid(String FigClass_id) {
		// TODO Auto-generated method stub
		int count = 0;
		count = user_FigClassDao.getCountByid(null, FigClass_id);
		return count;
	}

	//李  鹏   永
	
	
}
