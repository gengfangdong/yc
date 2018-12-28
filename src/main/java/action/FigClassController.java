package action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.ConstomVo;
import entity.Constomfile;
import entity.EUser;
import entity.FigClass;
import entity.FigClassVo;
import entity.FigClassshowVo;
import entity.Figfile;
import entity.Free_constom;
import entity.IUser;
import entity.LayuiDataTable;
import entity.UploadFilevo;
import service.FigClassService;
import util.ExcelUtil;
import util.FileUtil;
import util.UUIDUtil;

@RequestMapping("/FigClass")
@RestController
public class FigClassController {
	@Autowired
	private FigClassService figClassService;
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

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
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
		if("0".equals(figClass_caogery)||"1".equals(figClass_caogery)){
			//课程和方案走同一个方法
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

		// 获取上传的excel
		List<List<Object>> list = new ArrayList<List<Object>>();
		// EUSER列表
		List<EUser> eUsers = new ArrayList<EUser>();
		list = new ExcelUtil().getBankListByExcel(file);
		if (list == null || list.size() == 0) {
			resultMap.put("success", false);
			resultMap.put("message", "2");// execl无数据
			return resultMap;
		} else if (list.size() > Integer.valueOf(figClass.getFigClass_pernum())) {
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
		figClassService.importUser(eUsers,figClass_id, iUser.getUser_id());
		resultMap.put("success", true);
		resultMap.put("message", "5");//导入成功
		return resultMap;
	}
	
	@RequestMapping("/LayFig")
	public LayuiDataTable<FigClassshowVo> getLayBypage(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="caogery",required=false,defaultValue="")String caogery,
			@RequestParam(value = "status", required = false, defaultValue = "") String status,
			HttpServletRequest request) {
		LayuiDataTable<FigClassshowVo> fDataTable = new LayuiDataTable<FigClassshowVo>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser != null)
			fDataTable = figClassService.getListBypage(status, caogery, page, limit, iUser.getUser_id());
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
}
