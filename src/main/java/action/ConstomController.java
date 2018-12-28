package action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.ConstomVo;
import entity.Constomfile;
import entity.EUser;
import entity.Free_constom;
import entity.IUser;
import entity.LayuiDataTable;
import entity.Scheduledfile;
import entity.Scheduledshift;
import entity.UploadFilevo;
import service.ConstomService;
import util.ExcelUtil;
import util.FileUtil;
import util.StringUtil;
import util.UUIDUtil;

@RequestMapping("/Constom")
@RestController
public class ConstomController {
	@Autowired
	private ConstomService constomService;
	
	/**
	 * 新增定制班次
	 * @param Constom_name
	 * @param Constom_data
	 * @param Constom_datanum
	 * @param Constom_pernum
	 * @param Constom_address
	 * @param Constom_person
	 * @param Constom_phone
	 * @param files
	 * @param Constom_outline
	 * @param Constom_gaoery
	 * @param request
	 * @return
	 */
	@RequestMapping("/addConstom")
	public Map<String,Object> addConstom(String Constom_name,
			String Constom_data,@RequestParam(value="Constom_datanum",required=false,defaultValue="")String Constom_datanum,
			String Constom_pernum,String Constom_address,
			String Constom_person,String Constom_phone,@RequestParam("file")MultipartFile[] files,
			String[] Constom_outline,String Constom_gaoery,
			HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		if(iUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "0");//未登录
			return resultMap;
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String date = simpleDateFormat.format(new Date());
		//构建对象
		Free_constom free_constom = new Free_constom();
		free_constom.setFreeco_address(Constom_address);
		free_constom.setFreeco_creater(iUser.getUser_id());
		free_constom.setFreeco_createtime(date);
		free_constom.setFreeco_updater(iUser.getUser_id());
		free_constom.setFreeco_updatetime(date);
		free_constom.setFreeco_data(Constom_data);
		free_constom.setFreeco_gaoery(Constom_gaoery);
		String freeco_id = UUIDUtil.getUUid("con");
		free_constom.setFreeco_id(freeco_id);
		free_constom.setFreeco_isdelete("0");//未删除
		free_constom.setFreeco_name(Constom_name);
		free_constom.setFreeco_numfile("0");//未上传
		free_constom.setFreeco_status("0");//未审核
		free_constom.setFreeco_person(Constom_person);
		free_constom.setFreeco_phone(Constom_phone);
		free_constom.setFreeco_pernum(Constom_pernum);
		free_constom.setFreeco_datanum(Constom_datanum);
		
		StringBuffer outline = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(Constom_gaoery)||"1".equals(Constom_gaoery)){
			//课程和方案走同一个方法
			if(Constom_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : Constom_outline) {
				outline.append(string+",");
			}
		}
		else {
			// 课程和方案走同一个方法
			if (Constom_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(Constom_outline[1] + ",");
		}
		if (!"".equals(outline)) {
			free_constom.setFreeco_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		// 批量上传文件
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();

		FileUtil fileUtil = new FileUtil();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		for (MultipartFile f : files) {
			multipartFiles.add(f);
		}
		boolean flag = fileUtil.uploadbatch(uploadFilevos, multipartFiles, request.getSession().getServletContext().getRealPath("/constomfile"));
		if (flag == false) {
			resultMap.put("success", false);
			resultMap.put("message", "3");// 失败
			return resultMap;
		}
		List<Constomfile> constomfiles = new ArrayList<Constomfile>();
		for (UploadFilevo uploadfile : uploadFilevos) {
			Constomfile constomfile = new Constomfile();
			constomfile.setCreater(iUser.getUser_id());
			constomfile.setCreatetime(date);
			constomfile.setIsdelete("0");
			constomfile.setOldfilename(uploadfile.getOldfilename());
			constomfile.setNewfilename(uploadfile.getFilename());
			constomfile.setFreeco_id(freeco_id);
			constomfiles.add(constomfile);
		}
		
		constomService.insertConstom(free_constom, constomfiles);
		resultMap.put("success", true);
		resultMap.put("message", "4");// 成功!
		return resultMap;
	}
	/**
	 * 根据id获取详情
	 * @param Constom_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getDetailByid")
	public Map<String, Object> getDetailByid(String Constom_id, HttpServletRequest request) {
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
		ConstomVo constomVo = new ConstomVo();
		constomVo = constomService.getShow(Constom_id);
		if (constomVo == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前定制班次不存在
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("data", constomVo);// 定制班次详情
		return resultMap;
	}
	/**
	 * 审批定制班次
	 * @param Constom_id
	 * @param request
	 * @param review_result
	 * @return
	 */
	@RequestMapping("/Review")
	public Map<String,Object> ReviewConstom(String Constom_id,HttpServletRequest request,String review_result){
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
		//获取定制班次实例
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if(free_constom == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//当前定制班次不存在
			return resultMap;
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String updatetime = dateFormat.format(new Date());
		String updater = iUser.getUser_id();
		constomService.updateReview(Constom_id, review_result, updater, updatetime);
		resultMap.put("success", true);
		resultMap.put("message", "2");//审核成功!
		return resultMap;
	}
	
	/**
	 * 人员导入
	 * @param file
	 * @param Constom_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/importUser")
	public Map<String, Object> importUser(@RequestParam("file") MultipartFile file, String Constom_id,
			HttpServletRequest request) {
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
		// 获取定制班次实例
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if (free_constom == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前定制班次不存在
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
		} else if (list.size() > Integer.valueOf(free_constom.getFreeco_pernum())) {
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
		constomService.ImportUser(eUsers, Constom_id, iUser.getUser_id());
		resultMap.put("success", true);
		resultMap.put("message", "5");//导入成功
		return resultMap;
	}
	
	@RequestMapping("/LayConstom")
	public LayuiDataTable<Free_constom> getLayBypage(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="caogery",required=false,defaultValue="")String caogery,
			@RequestParam(value = "status", required = false, defaultValue = "") String status,
			HttpServletRequest request) {
		LayuiDataTable<Free_constom> fDataTable = new LayuiDataTable<Free_constom>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser != null)
			fDataTable = constomService.getListBypage(status, caogery, page, limit, iUser.getUser_id());
		fDataTable.setCode(0);
		fDataTable.setMsg("");
		return fDataTable;
	}

	@RequestMapping("/cancel")
	public Map<String,Object> cancelConstom(String Constom_id,HttpServletRequest request){
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
		//获取定制班次实体
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if(free_constom == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");// 定制班次不存在
			return resultMap;
		}
		constomService.deleteConstom(Constom_id, iUser.getUser_id());
		resultMap.put("success", true);
		resultMap.put("message", "2");//取消成功
		return resultMap;
	}
	
	@RequestMapping("/updateConstom")
	@ResponseBody
	public Map<String,Object> updateScheduled(String constom_id,@RequestParam("file") MultipartFile[] file,String[] oldfilename,
			String Constom_name,String Constom_data,
			@RequestParam(value="Constom_datanum",required=false,defaultValue="")String Constom_datanum,
			String Constom_pernum,String Constom_address,
			String Constom_person,String Constom_phone,@RequestParam("file")MultipartFile[] files,
			String[] Constom_outline,String Constom_gaoery,
			HttpServletRequest request){
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
		if (StringUtil.isblack(constom_id)) {
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误!
			return resultMap;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String Scheduled_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		//获取定制班次信息
		Free_constom free_constom = constomService.getDetailByid(constom_id);
		if(free_constom == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取定制班次失败!
			return resultMap;
		}
		List<Constomfile> constomfiles = free_constom.getConstomFiles();
		List<Constomfile> deletesList = new ArrayList<Constomfile>();
		for(int j = constomfiles.size()-1;j>=0;j--){
			boolean flag = false;
			if(oldfilename !=null){
				for (String oldscheduledfile : oldfilename) {
					if(oldscheduledfile.equals(constomfiles.get(j).getNewfilename())){
						flag = true;
					}
				}
				if(flag == true){
					flag = false;
				}
				else{
					deletesList.add(constomfiles.get(j));
					constomfiles.remove(j);
				}
			}
		}
		for (Constomfile constomfile : deletesList) {
			if("2".equals(fileUtil.delete(request.getRealPath("/constomfile")+"\\"+constomfile.getNewfilename()))){
				resultMap.put("success", false);
				resultMap.put("message", "2");//删除文件失败!
				return resultMap;
			}
		}
		
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();
		if(file!=null && file.length>0){
			List<MultipartFile> filels = Arrays.asList(file);
			fileUtil.uploadbatch(uploadFilevos, filels, request.getRealPath("/constomfile"));
		}
		
		
		for (UploadFilevo uploadfile : uploadFilevos) {
			Constomfile constomfile = new Constomfile();
			constomfile.setCreater(iUser.getUser_id());
			constomfile.setCreatetime(Scheduled_Createtime);
			constomfile.setIsdelete("0");
			constomfile.setOldfilename(uploadfile.getOldfilename());
			constomfile.setNewfilename(uploadfile.getFilename());
			constomfile.setFreeco_id(constom_id);
			constomfiles.add(constomfile);
		}
		
		free_constom.setFreeco_address(Constom_address);
		free_constom.setFreeco_updater(iUser.getUser_id());
		free_constom.setFreeco_updatetime(Scheduled_Createtime);
		free_constom.setFreeco_data(Constom_data);
		free_constom.setFreeco_gaoery(Constom_gaoery);
		free_constom.setFreeco_name(Constom_name);
		free_constom.setFreeco_person(Constom_person);
		free_constom.setFreeco_phone(Constom_phone);
		free_constom.setFreeco_pernum(Constom_pernum);
		free_constom.setFreeco_datanum(Constom_datanum);
		StringBuffer outline = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(Constom_gaoery)||"1".equals(Constom_gaoery)){
			//课程和方案走同一个方法
			if(Constom_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : Constom_outline) {
				outline.append(string+",");
			}
		}
		else {
			// 课程和方案走同一个方法
			if (Constom_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(Constom_outline[1] + ",");
		}
		if (!"".equals(outline)) {
			free_constom.setFreeco_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		resultMap.put("success", true);
		resultMap.put("message", "3");//修改成功!
		return resultMap;
	}
	
	
}
