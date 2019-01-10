package action;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.ConstomVo;
import entity.Constomfile;
import entity.EUser;
import entity.FigClass;
import entity.FigClassVo;
import entity.FigClassshowVo;
import entity.FigUser;
import entity.Figfile;
import entity.Free_constom;
import entity.IUser;
import entity.LayuiDataTable;
import entity.UploadFilevo;
import service.FigClassService;
import util.ExcelUtil;
import util.FileUtil;
import util.MessageUtil;
import util.StringUtil;
import util.UUIDUtil;

@RequestMapping("/FigClass")
@RestController
public class FigClassController {
	@Autowired
	private FigClassService figClassService;
	
	
	/**
	 * 拼板添加
	 * @param figClass_name
	 * @param figClass_deparment
	 * @param figClass_address
	 * @param figClass_start_date
	 * @param figClass_end_date
	 * @param figClass_class_start
	 * @param figClass_class_end
	 * @param figClass_pernum
	 * @param figClass_phone
	 * @param figClass_person
	 * @param figClass_caogery
	 * @param figClass_outline
	 * @param files
	 * @param request
	 * @return
	 */
	@RequestMapping("/addFig")
	public Map<String,Object> addFigClass(String figClass_name, String figClass_deparment, String figClass_address,
			String figClass_start_date, String figClass_end_date, String figClass_class_start,
			String figClass_class_end, String figClass_pernum, String figClass_phone, String figClass_person,String figClass_caogery,
			String[] figClass_outline,@RequestParam("file")MultipartFile[] files,HttpServletRequest request){
		//结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		//构造对象
		String figClass_id = UUIDUtil.getUUid("fig");
		FigClass figClass = new FigClass();
		figClass.setFigClass_address(figClass_address);
		figClass.setFigClass_caogery(figClass_caogery);
		figClass.setFigClass_class_end(figClass_class_end);
		figClass.setFigClass_class_start(figClass_class_start);
		figClass.setFigClass_creater(iUser.getUser_id());
		figClass.setFigClass_createtime(date);
		figClass.setFigClass_deparment(figClass_deparment);
		figClass.setFigClass_end_date(figClass_end_date);
		figClass.setFigClass_id(figClass_id);
		figClass.setFigClass_isdelete("0");//未删除
		figClass.setFigClass_name(figClass_name);
		figClass.setFigClass_numstatus("0");//未上传人员名单
		figClass.setFigClass_pernum(figClass_pernum);
		figClass.setFigClass_person(figClass_person);
		figClass.setFigClass_phone(figClass_phone);
		figClass.setFigClass_start_date(figClass_start_date);
		figClass.setFigClass_status("0");
		figClass.setFigClass_updater(iUser.getUser_id());
		figClass.setFigClass_updatetime(date);
		
		StringBuffer outline = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(figClass_caogery)){
			//方案走一个方法
			if(figClass_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			figClass.setFigClass_day(figClass_outline[1]);
			outline.append(figClass_outline[0]+",");
			
		}else if("1".equals(figClass_caogery)){
			//课程走一个方法
			if(figClass_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : figClass_outline) {
				outline.append(string+",");
			}
		}
		else {
			// 课程和方案走同一个方法
			if (figClass_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(figClass_outline[0] + ",");
		}
		if (!"".equals(outline)) {
			figClass.setFigClass_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		// 批量上传文件
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();

		FileUtil fileUtil = new FileUtil();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		for (MultipartFile f : files) {
			multipartFiles.add(f);
		}
		boolean flag = fileUtil.uploadbatch(uploadFilevos, multipartFiles, request.getSession().getServletContext().getRealPath("/figclassfile"));
		if (flag == false) {
			resultMap.put("success", false);
			resultMap.put("message", "3");// 失败
			return resultMap;
		}
		
		List<Figfile> figfiles = new ArrayList<Figfile>();
		for (UploadFilevo uploadfile : uploadFilevos) {
			Figfile figfile = new Figfile();
			figfile.setCreater(iUser.getUser_id());
			figfile.setCreatetime(date);
			figfile.setIsdelete("0");
			figfile.setOldfilename(uploadfile.getOldfilename());
			figfile.setNewfilename(uploadfile.getFilename());
			figfile.setFigClass_id(figClass_id);
			figfiles.add(figfile);
		}
		
		figClassService.insertFig(figClass, figfiles);
		resultMap.put("success", true);
		resultMap.put("message", "1");//导入成功
		return resultMap;
	}
	@RequestMapping("/addFignew")
	public Map<String,Object> addFigClassnew(String figClass_name, String figClass_deparment, String figClass_address,
			String figClass_start_date, String figClass_end_date, String figClass_class_start,String contactWorkNumber,
			String figClass_class_end, String figClass_pernum, String figClass_phone, String figClass_person,String figClass_caogery,
			String[] figClass_outline,String[] figClass_day,@RequestParam("file")MultipartFile[] files,HttpServletRequest request){
		//结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		//构造对象
		String figClass_id = UUIDUtil.getUUid("fig");
		FigClass figClass = new FigClass();
		figClass.setFigClass_address(figClass_address);
		figClass.setFigClass_caogery(figClass_caogery);
		figClass.setFigClass_class_end(figClass_class_end);
		figClass.setFigClass_class_start(figClass_class_start);
		figClass.setFigClass_creater(iUser.getUser_id());
		figClass.setFigClass_createtime(date);
		figClass.setFigClass_deparment(figClass_deparment);
		figClass.setFigClass_end_date(figClass_end_date);
		figClass.setFigClass_id(figClass_id);
		figClass.setFigClass_isdelete("0");//未删除
		figClass.setFigClass_name(figClass_name);
		figClass.setFigClass_numstatus("0");//未上传人员名单
		figClass.setFigClass_pernum(figClass_pernum);
		figClass.setFigClass_person(figClass_person);
		figClass.setFigClass_phone(figClass_phone);
		figClass.setFigClass_start_date(figClass_start_date);
		figClass.setFigClass_status("0");
		figClass.setFigClass_updater(iUser.getUser_id());
		figClass.setFigClass_updatetime(date);
		figClass.setFigClass_worknum(contactWorkNumber);
		StringBuffer outline = new StringBuffer();
		StringBuffer day = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(figClass_caogery)){
			//方案
			if(figClass_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			outline.append(figClass_outline[0]+",");
		}else if("1".equals(figClass_caogery)){
			//课程
			if(figClass_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : figClass_outline) {
				outline.append(string+",");
			}
			if(figClass_day.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : figClass_day) {
				day.append(string+",");
			}
			figClass.setFigClass_day(day.toString().substring(0,day.toString().length() - 1));
		}
		else {
			// 课程和方案走同一个方法
			if (figClass_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(figClass_outline[0] + ",");
		}
		if (!"".equals(outline)) {
			figClass.setFigClass_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		// 批量上传文件
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();

		FileUtil fileUtil = new FileUtil();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		for (MultipartFile f : files) {
			multipartFiles.add(f);
		}
		boolean flag = fileUtil.uploadbatch(uploadFilevos, multipartFiles, request.getSession().getServletContext().getRealPath("/figclassfile"));
		if (flag == false) {
			resultMap.put("success", false);
			resultMap.put("message", "3");// 失败
			return resultMap;
		}
		
		List<Figfile> figfiles = new ArrayList<Figfile>();
		for (UploadFilevo uploadfile : uploadFilevos) {
			Figfile figfile = new Figfile();
			figfile.setCreater(iUser.getUser_id());
			figfile.setCreatetime(date);
			figfile.setIsdelete("0");
			figfile.setOldfilename(uploadfile.getOldfilename());
			figfile.setNewfilename(uploadfile.getFilename());
			figfile.setFigClass_id(figClass_id);
			figfiles.add(figfile);
		}
		
		try{
			figClassService.insertFig(figClass, figfiles);
			
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "1");//导入成功
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "1");//导入成功
		return resultMap;
	}
	/**
	 * 名单报名
	 * @param figClass_id
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("/importUser")
	public Map<String,Object> ImportUser(String figClass_id,@RequestParam("file")MultipartFile file,HttpServletRequest request){
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		// 获取拼班
		FigClass figClass = new FigClass();
		figClass = figClassService.getDetailByid(figClass_id);
		if (figClass == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前拼班不存在
			return resultMap;
		}
		//获取剩余拼班人数
		int allSign = 0;
		allSign = figClassService.getCountByid(figClass.getFigClass_id());
		int max = Integer.valueOf(figClass.getFigClass_pernum())-allSign;
		// 获取上传的excel
		List<List<Object>> list = new ArrayList<List<Object>>();
		// EUSER列表
		List<EUser> eUsers = new ArrayList<EUser>();
		list = new ExcelUtil().getBankListByExcel(file);
		if (list == null || list.size() == 0) {
			resultMap.put("success", false);
			resultMap.put("message", "2");// execl无数据
			return resultMap;
		} else if (list.size() > max) {
			resultMap.put("success", false);
			resultMap.put("message", "3");// 人员数量与execl不符合
			return resultMap;
		}
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		for (List<Object> list2 : list) {
			EUser eUser = new EUser();
			eUser.setEUser_id(UUIDUtil.getUUid("eus"));
			eUser.setEUser_name(list2.get(0).toString());// 姓名
			String sex = list2.get(1).toString();
			if ("男".equals(sex)) {
				eUser.setEUser_sex("0");// 性别
			} else if ("女".equals(sex)) {
				eUser.setEUser_sex("1");// 性别
			}
			eUser.setEUser_isdelete("0");
			eUser.setEUser_companyname(list2.get(2).toString());// 工作单位
			eUser.setEUser_department(list2.get(3).toString());// 部门
			eUser.setEUser_hold(list2.get(4).toString());// 职务
			eUser.setEUser_indentitynumber(list2.get(5).toString());// 身份证号
			eUser.setEUser_phone(list2.get(6).toString());// 联系方式
			eUser.setEUser_remark(list2.get(7).toString());// 备注
			eUser.setEUser_creater(iUser.getUser_id());
			eUser.setEUser_createtime(APPLYDATE);
			eUser.setEUser_updatetime(APPLYDATE);
			eUser.setEUser_updater(iUser.getUser_id());
			eUsers.add(eUser);
		}
		// 检测excel里面身份证是否重复
		Map<String, Object> idnumber = new HashMap<String, Object>();
		for (EUser eUser : eUsers) {
			if (idnumber.put(eUser.getEUser_indentitynumber(), eUser) != null) {
				resultMap.put("success", false);
				resultMap.put("message", "4");// excel存在身份证重复!
				return resultMap;
			}
		}
		
		try{
			figClassService.importUser(eUsers,figClass_id, iUser.getUser_id());
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "5");// excel存在身份证重复!
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "5");//导入成功
		return resultMap;
	}
	
	/**
	 * 分页查看 根据类型和状态筛选
	 * @param page
	 * @param limit
	 * @param caogery
	 * @param status
	 * @param request
	 * @return
	 */
	@RequestMapping("/LayFig")
	public LayuiDataTable<FigClassshowVo> getLayBypage(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="caogery",required=false,defaultValue="")String caogery,
			@RequestParam(value = "status", required = false, defaultValue = "") String status,
			@RequestParam(value = "isbm", required = false, defaultValue = "") String isbm,
			HttpServletRequest request) {
		LayuiDataTable<FigClassshowVo> fDataTable = new LayuiDataTable<FigClassshowVo>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser != null)
			fDataTable = figClassService.getListBypage(isbm,status, caogery, page, limit, iUser.getUser_id());
		fDataTable.setCode(0);
		fDataTable.setMsg("");
		return fDataTable;
	}
	/**
	 * 分页查看 根据类型和状态筛选
	 * @param page
	 * @param limit
	 * @param caogery
	 * @param status
	 * @param request
	 * @return
	 */
	@RequestMapping("/LayFigad")
	public LayuiDataTable<FigClassshowVo> getLayBypagead(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="caogery",required=false,defaultValue="")String caogery,
			@RequestParam(value = "status", required = false, defaultValue = "") String status,
			HttpServletRequest request) {
		LayuiDataTable<FigClassshowVo> fDataTable = new LayuiDataTable<FigClassshowVo>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser != null)
			fDataTable = figClassService.getListBypage("",status, caogery, page, limit, "");
		fDataTable.setCode(0);
		fDataTable.setMsg("");
		return fDataTable;
	}
	/**
	 * 根据id获取详情
	 * @param Constom_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getDetailByid")
	public Map<String, Object> getDetailByid(String FigClass_id, HttpServletRequest request) {
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		/*// 获取定制班次实例
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if (free_constom == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前定制班次不存在
			return resultMap;
		}*/
		FigClassVo figClassVo = new FigClassVo();
		figClassVo = figClassService.getDetail(FigClass_id);
		if (figClassVo == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前定制班次不存在
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("data", figClassVo);// 定制班次详情
		return resultMap;
	}
	
	/**
	 * 取消拼班
	 * @param Figclass_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/cancel")
	public Map<String,Object> cancelFigclass(String Figclass_id,HttpServletRequest request){
		//结果返回的map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		//获取拼班
		FigClass figClass = new FigClass();
		figClass = figClassService.getDetailByid(Figclass_id);
		if(figClass == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");// 定制班次不存在
			return resultMap;
		}
		figClassService.deleteFigClass(Figclass_id, iUser.getUser_id());
		resultMap.put("success", true);
		resultMap.put("message", "2");//取消成功
		return resultMap;
	}

	@RequestMapping("/apply")
	public Map<String, Object> applyFig(String figClass_id, String Fiu_number, String Fiu_username, String Fiu_ydphone,
			String Fiu_phone, String Fiu_department,HttpServletRequest request) {
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}//获取拼班
		FigClass figClass = new FigClass();
		figClass = figClassService.getDetailByid(figClass_id);
		if(figClass == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");// 定制班次不存在
			return resultMap;
		}
		//校验人数
		int count = Integer.valueOf(Fiu_number);
		int allcount = Integer.valueOf(figClass.getFigClass_pernum());
		int lavecount = figClassService.getlaveNum(figClass_id);
		if(count > allcount-lavecount){
			resultMap.put("success", false);
			resultMap.put("message", "2");// 人数超过限制
			return resultMap;
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		// 构建用户拼班对象
		FigUser figUser = new FigUser();
		figUser.setFiu_creater(iUser.getUser_id());
		figUser.setFiu_createtime(date);
		figUser.setFiu_department(Fiu_department);
		figUser.setFiu_figid(figClass_id);
		figUser.setFiu_isdelete("0");
		figUser.setFiu_number(Fiu_number);
		figUser.setFiu_phone(Fiu_phone);
		figUser.setFiu_status("0");
		figUser.setFiu_userid(iUser.getUser_id());
		figUser.setFiu_username(Fiu_username);
		figUser.setFiu_ydphone(Fiu_ydphone);
		figUser.setFiu_id(UUIDUtil.getUUid("fiu"));
		try{
			figClassService.applyFig(figUser);
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "3");//报名失败
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "2");//取消成功
		return resultMap;
	}

	@RequestMapping("/cancelbm")
	public Map<String, Object> cancelFigUser(String Fiu_id,HttpServletRequest request) {
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		try {
			figClassService.cancelFiu(Fiu_id);
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("success", false);
			resultMap.put("message", "1");// 取消失败
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "2");// 取消成功
		return resultMap;
	}
	@RequestMapping("/LayFu/{figClass_id}")
	public LayuiDataTable<FigUser> getFuByPage(@RequestParam("page")int page,@RequestParam("limit")int limit,@PathVariable String figClass_id){
		LayuiDataTable<FigUser> fDataTable = new LayuiDataTable<FigUser>();
		fDataTable = figClassService.getPage(page, limit, figClass_id);
		fDataTable.setCode(0);
		fDataTable.setMsg("");
		return fDataTable;
	}
	/**
	 * 更新带文件的拼班
	 * @param figClass_id
	 * @param file
	 * @param oldfilename
	 * @param figClass_name
	 * @param figClass_deparment
	 * @param figClass_address
	 * @param figClass_start_date
	 * @param figClass_end_date
	 * @param figClass_class_start
	 * @param figClass_class_end
	 * @param figClass_pernum
	 * @param figClass_phone
	 * @param figClass_person
	 * @param figClass_caogery
	 * @param figClass_outline
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateFigClass")
	@ResponseBody
	public Map<String,Object> updateFigClass(String figClass_id,@RequestParam("file") MultipartFile[] file,String[] oldfilename,
			String figClass_name, String figClass_deparment, String figClass_address,
			String figClass_start_date, String figClass_end_date, String figClass_class_start,
			String figClass_class_end, String figClass_pernum, String figClass_phone, String figClass_person,String figClass_caogery,
			String[] figClass_outline,HttpServletRequest request){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		FileUtil fileUtil = new FileUtil();
		if (StringUtil.isblack(figClass_id)) {
			resultMap.put("success", false);
			resultMap.put("message", "1");//参数错误!
			return resultMap;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String Scheduled_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		//获取定制班次信息
		FigClass figClass = figClassService.getDetailByid(figClass_id);
		if(figClass == null){
			resultMap.put("success", false);
			resultMap.put("message", "2");//获取定制班次失败!
			return resultMap;
		}
		List<Figfile> figfiles = figClass.getFigFiles();
		List<Figfile> deletesList = new ArrayList<Figfile>();
		for(int j = figfiles.size()-1;j>=0;j--){
			boolean flag = false;
			if(oldfilename !=null){
				for (String oldscheduledfile : oldfilename) {
					if(oldscheduledfile.equals(figfiles.get(j).getNewfilename())){
						flag = true;
					}
				}
				if(flag == true){
					flag = false;
				}
				else{
					deletesList.add(figfiles.get(j));
					figfiles.remove(j);
				}
			}
		}
		for (Figfile figfile : deletesList) {
			if("2".equals(fileUtil.delete(request.getRealPath("/figclassfile")+"\\"+figfile.getNewfilename()))){
				resultMap.put("success", false);
				resultMap.put("message", "3");//删除文件失败!
				return resultMap;
			}
		}
		
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();
		if(file!=null && file.length>0){
			List<MultipartFile> filels = Arrays.asList(file);
			fileUtil.uploadbatch(uploadFilevos, filels, request.getRealPath("/figclassfile"));
		}
		
		
		for (UploadFilevo uploadfile : uploadFilevos) {
			Figfile figfile = new Figfile();
			figfile.setCreater(iUser.getUser_id());
			figfile.setCreatetime(Scheduled_Createtime);
			figfile.setIsdelete("0");
			figfile.setOldfilename(uploadfile.getOldfilename());
			figfile.setNewfilename(uploadfile.getFilename());
			figfile.setFigClass_id(figClass_id);
			figfiles.add(figfile);
		}
		
		figClass.setFigClass_address(figClass_address);
		figClass.setFigClass_caogery(figClass_caogery);
		figClass.setFigClass_class_end(figClass_class_end);
		figClass.setFigClass_class_start(figClass_class_start);
		figClass.setFigClass_deparment(figClass_deparment);
		figClass.setFigClass_end_date(figClass_end_date);
		figClass.setFigClass_name(figClass_name);
		figClass.setFigClass_pernum(figClass_pernum);
		figClass.setFigClass_person(figClass_person);
		figClass.setFigClass_phone(figClass_phone);
		figClass.setFigClass_start_date(figClass_start_date);
		figClass.setFigClass_updater(iUser.getUser_id());
		figClass.setFigClass_updatetime(Scheduled_Createtime);
		StringBuffer outline = new StringBuffer();
		// 判断是课程方案还是自由
		if ("0".equals(figClass_caogery)) {
			// 方案走一个方法
			if (figClass_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			figClass.setFigClass_day(figClass_outline[1]);
			outline.append(figClass_outline[0]+",");

		} else if ("1".equals(figClass_caogery)) {
			// 课程走一个方法
			if (figClass_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			for (String string : figClass_outline) {
				outline.append(string + ",");
			}
		} else {
			// 课程和方案走同一个方法
			if (figClass_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "4");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(figClass_outline[0] + ",");
		}
		if (!"".equals(outline)) {
			figClass.setFigClass_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		//constomService.updateConstom(free_constom);
		figClassService.updateFig(figClass);
		resultMap.put("success", true);
		resultMap.put("message", "5");//修改成功!
		return resultMap;
	}
	@RequestMapping("/updateFigClassnew")
	@ResponseBody
	public Map<String,Object> updateFigClassnew(String figClass_id,@RequestParam("file") MultipartFile[] file,String[] oldfilename,
			String figClass_name, String figClass_deparment, String figClass_address,
			String figClass_start_date, String figClass_end_date, String figClass_class_start,String contactWorkNumber,
			String figClass_class_end, String figClass_pernum, String figClass_phone, String figClass_person,String figClass_caogery,
			String[] figClass_outline,String[] figClass_day,HttpServletRequest request){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		FileUtil fileUtil = new FileUtil();
		if (StringUtil.isblack(figClass_id)) {
			resultMap.put("success", false);
			resultMap.put("message", "1");//参数错误!
			return resultMap;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String Scheduled_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		//获取定制班次信息
		FigClass figClass = figClassService.getDetailByid(figClass_id);
		if(figClass == null){
			resultMap.put("success", false);
			resultMap.put("message", "2");//获取定制班次失败!
			return resultMap;
		}
		List<Figfile> figfiles = figClass.getFigFiles();
		List<Figfile> deletesList = new ArrayList<Figfile>();
		for(int j = figfiles.size()-1;j>=0;j--){
			boolean flag = false;
			if(oldfilename !=null){
				for (String oldscheduledfile : oldfilename) {
					if(oldscheduledfile.equals(figfiles.get(j).getNewfilename())){
						flag = true;
					}
				}
				if(flag == true){
					flag = false;
				}
				else{
					deletesList.add(figfiles.get(j));
					figfiles.remove(j);
				}
			}
		}
		for (Figfile figfile : deletesList) {
			if("2".equals(fileUtil.delete(request.getRealPath("/figclassfile")+"\\"+figfile.getNewfilename()))){
				resultMap.put("success", false);
				resultMap.put("message", "3");//删除文件失败!
				return resultMap;
			}
		}
		
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();
		if(file!=null && file.length>0){
			List<MultipartFile> filels = Arrays.asList(file);
			fileUtil.uploadbatch(uploadFilevos, filels, request.getRealPath("/figclassfile"));
		}
		
		
		for (UploadFilevo uploadfile : uploadFilevos) {
			Figfile figfile = new Figfile();
			figfile.setCreater(iUser.getUser_id());
			figfile.setCreatetime(Scheduled_Createtime);
			figfile.setIsdelete("0");
			figfile.setOldfilename(uploadfile.getOldfilename());
			figfile.setNewfilename(uploadfile.getFilename());
			figfile.setFigClass_id(figClass_id);
			figfiles.add(figfile);
		}
		
		figClass.setFigClass_address(figClass_address);
		figClass.setFigClass_caogery(figClass_caogery);
		figClass.setFigClass_class_end(figClass_class_end);
		figClass.setFigClass_class_start(figClass_class_start);
		figClass.setFigClass_deparment(figClass_deparment);
		figClass.setFigClass_end_date(figClass_end_date);
		figClass.setFigClass_name(figClass_name);
		figClass.setFigClass_pernum(figClass_pernum);
		figClass.setFigClass_person(figClass_person);
		figClass.setFigClass_phone(figClass_phone);
		figClass.setFigClass_start_date(figClass_start_date);
		figClass.setFigClass_updater(iUser.getUser_id());
		figClass.setFigClass_updatetime(Scheduled_Createtime);
		figClass.setFigClass_worknum(contactWorkNumber);
		StringBuffer outline = new StringBuffer();
		StringBuffer day = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(figClass_caogery)){
			//方案
			if(figClass_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			outline.append(figClass_outline[0]+",");
		}else if("1".equals(figClass_caogery)){
			//课程
			if(figClass_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : figClass_outline) {
				outline.append(string+",");
			}
			if(figClass_day.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : figClass_day) {
				day.append(string+",");
			}
			figClass.setFigClass_day(day.toString().substring(0,day.toString().length() - 1));
		} else {
			// 课程和方案走同一个方法
			if (figClass_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "4");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(figClass_outline[0] + ",");
		}
		if (!"".equals(outline)) {
			figClass.setFigClass_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		//constomService.updateConstom(free_constom);
		try{
			figClassService.updateFig(figClass);
		}catch(Exception e){
			resultMap.put("success", false);
			resultMap.put("message", "3");//修改成功!
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "5");//修改成功!
		return resultMap;
	}
	
	/**
	 * 下载拼班文件内容
	 * @param request
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/download/{filename:.+}") //匹配的是href中的download请求 带后缀名的那种
    public ResponseEntity<byte[]> download(HttpServletRequest request,@PathVariable String filename) throws IOException{
    	
    	
        FileUtil fileUtil = new FileUtil();
        HttpHeaders headers = new HttpHeaders();
        String fileoldname = figClassService.getByfilename(filename);
        return fileUtil.download(request.getRealPath("/figclassfile")+"\\"+filename, fileoldname,headers);        
    }
    

	@RequestMapping("/Review")
	public Map<String,Object> ReviewFigclass(String figclass_id,HttpServletRequest request,String review_result){
		//结果map
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		if(iUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "0");//未登录
			return resultMap;
		}
		//获取拼班的实体
		FigClass figClass = new FigClass();
		figClass = figClassService.getDetailByid(figclass_id);
		if(figClass == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//当前拼班不存在
			return resultMap;
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String updatetime = dateFormat.format(new Date());
		String updater = iUser.getUser_id();
		try{
			figClassService.updateReview(figclass_id, review_result, updater, updatetime);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		try {
			//发送短信提醒
			if("1".equals(review_result)){
				String context = "您的拼班: "+figClass.getFigClass_name()+" 审核通过!";
				String phone = figClass.getFigClass_phone();
				
				
				new MessageUtil().httpPost(phone, context);
			}else if("2".equals(review_result)){
				String context = "您的拼班: "+figClass.getFigClass_name()+" 审核不通过!";
				String phone = figClass.getFigClass_phone();
				new MessageUtil().httpPost(phone, context);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultMap.put("success", true);
		resultMap.put("message", "2");//审核成功!
		return resultMap;
	}
	
	@RequestMapping("/exportUser/{figclass_id}")
	public void ExportUser(HttpServletRequest request,HttpServletResponse response,@PathVariable String figclass_id){
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = figClassService.getListUserByid(iUser.getUser_id(), figclass_id);
		//导出excel
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet();
		HSSFRow row1 = sheet.createRow(0);//标题行
		String[] titleValue ={"姓名","性别","工作单位","部门","职务","身份证号","联系方式","备注"}; 
		for(int i=0;i<8;i++){
			HSSFCell cell = row1.createCell(i);
			cell.setCellValue(titleValue[i]);
		}
		for(int j=0;j<eUsers.size();j++){
			EUser eUser = eUsers.get(j);
			HSSFRow row = sheet.createRow(j+1);
			HSSFCell cell = row.createCell(0);
			cell.setCellValue(eUser.getEUser_name());
			HSSFCell cell1 = row.createCell(1);
			String sex = eUser.getEUser_sex();
			if("0".equals(sex)){
				cell1.setCellValue("男");
			}else if("1".equals(sex)){
				cell1.setCellValue("女");
			}
			
			HSSFCell cell2 = row.createCell(2);
			cell2.setCellValue(eUser.getEUser_companyname());
			HSSFCell cell3 = row.createCell(3);
			cell3.setCellValue(eUser.getEUser_department());
			HSSFCell cell4 = row.createCell(4);
			cell4.setCellValue(eUser.getEUser_hold());
			HSSFCell cell5 = row.createCell(5);
			cell5.setCellValue(eUser.getEUser_indentitynumber());
			HSSFCell cell6 = row.createCell(6);
			cell6.setCellValue(eUser.getEUser_phone());
			HSSFCell cell7 = row.createCell(7);
			cell7.setCellValue(eUser.getEUser_remark());
			
		}
		
		//输出Excel文件
	    OutputStream output;
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+new String("人员列表".getBytes("gbk"), "iso8859-1")+".xls");
			response.setContentType("application/x-download");
			response.setCharacterEncoding("UTF-8");
			output = response.getOutputStream();
			wb.write(output);
			output.flush();// 刷新流  
			output.close();
			wb.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				wb.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			//logger.info("yes");
		}
	   
	}
	
	@RequestMapping("/exportUserad/{figclass_id}")
	public void ExportUserad(HttpServletRequest request,HttpServletResponse response,@PathVariable String figclass_id){
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = figClassService.getListUserByid(null, figclass_id);
		//导出excel
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet();
		HSSFRow row1 = sheet.createRow(0);//标题行
		String[] titleValue ={"姓名","性别","工作单位","部门","职务","身份证号","联系方式","备注"}; 
		for(int i=0;i<8;i++){
			HSSFCell cell = row1.createCell(i);
			cell.setCellValue(titleValue[i]);
		}
		if(eUsers!=null&&eUsers.size()>0){
			for(int j=0;j<eUsers.size();j++){
				EUser eUser = eUsers.get(j);
				HSSFRow row = sheet.createRow(j+1);
				HSSFCell cell = row.createCell(0);
				cell.setCellValue(eUser.getEUser_name());
				HSSFCell cell1 = row.createCell(1);
				String sex = eUser.getEUser_sex();
				if("0".equals(sex)){
					cell1.setCellValue("男");
				}else if("1".equals(sex)){
					cell1.setCellValue("女");
				}
				
				HSSFCell cell2 = row.createCell(2);
				cell2.setCellValue(eUser.getEUser_companyname());
				HSSFCell cell3 = row.createCell(3);
				cell3.setCellValue(eUser.getEUser_department());
				HSSFCell cell4 = row.createCell(4);
				cell4.setCellValue(eUser.getEUser_hold());
				HSSFCell cell5 = row.createCell(5);
				cell5.setCellValue(eUser.getEUser_indentitynumber());
				HSSFCell cell6 = row.createCell(6);
				cell6.setCellValue(eUser.getEUser_phone());
				HSSFCell cell7 = row.createCell(7);
				cell7.setCellValue(eUser.getEUser_remark());
				
			}
		}
		//输出Excel文件
	    OutputStream output;
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+new String("人员列表".getBytes("gbk"), "iso8859-1")+".xls");
			response.setContentType("application/x-download");
			response.setCharacterEncoding("UTF-8");
			output = response.getOutputStream();
			wb.write(output);
			output.flush();// 刷新流  
			output.close();
			wb.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				wb.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			//logger.info("yes");
		}
	   
	}
	@RequestMapping("/deleteFig/{figclass_id}")
	public Map<String,Object> deleteFig(@PathVariable String figclass_id,HttpServletRequest request){
		//返回结果集
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取登录人
		IUser iuser = new IUser();
		iuser = (IUser)request.getSession().getAttribute("user");
		if(iuser == null){
			resultMap.put("success", false);
			resultMap.put("message", "0");//未登录
			return resultMap;
		}
		//删除拼班
		try{
			figClassService.deleteFig(figclass_id,iuser);
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "1");//删除失败
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "2");//删除成功
		return resultMap;
	}
	@RequestMapping("/openClass/{figClass_id}")
	public Map<String,Object> openClass(@PathVariable String figClass_id,HttpServletRequest request){
		//
		Map<String,Object> resultmap = new HashMap<>();
		IUser iuser = new IUser();
		iuser = (IUser)request.getSession().getAttribute("user");
		if(iuser == null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		//获取拼版实例
		FigClass figClass = new FigClass();
		figClass = figClassService.getDetailByid(figClass_id);
		if(figClass == null){
			resultmap.put("success", false);
			resultmap.put("message", "1");//实例不存在
			return resultmap;
		}
		//更新状态
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String updatetime = format.format(new Date());
		figClass.setFigClass_status("6");
		figClass.setFigClass_updater(iuser.getUser_id());
		figClass.setFigClass_updatetime(updatetime);
		try{
			figClassService.updateStatus(figClass);
			
		}catch(Exception e){
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "2");//开课失败
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("message", "3");//开课成功
		return resultmap;
	}
	
	@RequestMapping("/endClass/{figClass_id}")
	public Map<String,Object> endClass(@PathVariable String figClass_id,HttpServletRequest request){
		//
		Map<String,Object> resultmap = new HashMap<>();
		IUser iuser = new IUser();
		iuser = (IUser)request.getSession().getAttribute("user");
		if(iuser == null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		//获取拼版实例
		FigClass figClass = new FigClass();
		figClass = figClassService.getDetailByid(figClass_id);
		if(figClass == null){
			resultmap.put("success", false);
			resultmap.put("message", "1");//实例不存在
			return resultmap;
		}
		//更新状态
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String updatetime = format.format(new Date());
		figClass.setFigClass_status("7");
		figClass.setFigClass_updater(iuser.getUser_id());
		figClass.setFigClass_updatetime(updatetime);
		try{
			figClassService.updateStatus(figClass);
			
		}catch(Exception e){
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "2");//开课失败
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("message", "3");//开课成功
		return resultmap;
	}
	
}
