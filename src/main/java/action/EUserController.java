/**
 * 
 */
package action;


import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.Course;
import entity.EUser;
import entity.IUser;
import entity.LayuiDataTable;
import service.EUserService;
import service.impl.EUserServiceImpl;
import util.ExcelUtil;
import util.StringUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/EUser")
public class EUserController {
	private static Logger logger = Logger.getLogger(EUserController.class);
	
	@Autowired
	private EUserService eUserService;   
	/**
	 * 单独新增一个人员
	 * @param EUser_name
	 * @param EUser_companyname
	 * @param EUser_department
	 * @param EUser_hold
	 * @param EUser_sex
	 * @param EUser_remark
	 * @param EUser_indentitynumber
	 * @param EUser_phone
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public Map<String,Object> insertEUser(String EUser_name,String EUser_companyname,String EUser_department,
			String EUser_hold,String EUser_sex,String EUser_remark,String EUser_indentitynumber,String EUser_phone,HttpServletRequest request){
		//结果map
		Map<String,Object> resultMap = new HashMap<String, Object>();
		IUser user = new IUser();
		user = (IUser) request.getSession().getAttribute("user");
		if(user == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//未登录
			return resultMap;
		}
		if(eUserService == null){
			System.out.println("NULL");
			//eUserService = new EUserServiceImpl();
		}
		//判断身份证号是否重复  稍后写
		if(eUserService.checkInu(EUser_indentitynumber, "")){
			resultMap.put("success", false);
			resultMap.put("message", "0");//身份证号重复
			return resultMap;
		}
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		EUser eUser = new EUser();
		eUser.setEUser_companyname(EUser_companyname);
		eUser.setEUser_creater(user.getUser_id());
		eUser.setEUser_department(EUser_department);
		eUser.setEUser_hold(EUser_hold);
		eUser.setEUser_id(UUIDUtil.getUUid("eus"));
		eUser.setEUser_indentitynumber(EUser_indentitynumber);
		eUser.setEUser_isdelete("0");
		eUser.setEUser_name(EUser_name);
		eUser.setEUser_phone(EUser_phone);
		eUser.setEUser_phone(EUser_phone);
		eUser.setEUser_remark(EUser_remark);
		eUser.setEUser_sex(EUser_sex);
		eUser.setEUser_createtime(APPLYDATE);
		eUser.setEUser_updatetime(APPLYDATE);
		eUser.setEUser_updater(user.getUser_id());
		eUserService.insertEUser(eUser);
		resultMap.put("success", true);
		resultMap.put("message", "1");//新增成功!
		return resultMap;
	}
	
	/**
	 * 批量导入人员
	 * @param fileEuser
	 * @return
	 */
	@RequestMapping("/importfile")
	@ResponseBody
	public Map<String,Object> importfileEUser(@RequestParam("file") MultipartFile fileEuser,HttpServletRequest request){
		//结果map
		Map<String,Object> resultMap = new HashMap<String, Object>();
		IUser user = new IUser();
		user = (IUser) request.getSession().getAttribute("user");
		if(user == null){
			resultMap.put("success", false);
			resultMap.put("code", 3);//未登录
			return resultMap;
		}
		//读取execl
		List<List<Object>> list = new ArrayList<List<Object>>();
		//EUSER列表
		List<EUser> eUsers = new ArrayList<EUser>();
		list = new ExcelUtil().getBankListByExcel(fileEuser);
		if(list == null || list.size() == 0){
			resultMap.put("success", false);
			resultMap.put("code", 0);
			return resultMap;
		}
		Map<String,Object> idnummap = new HashMap<String, Object>();
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		for (List<Object> list2 : list) {
			if(idnummap.get(list2.get(5).toString())!=null){
				resultMap.put("success", false);
				resultMap.put("code", 4);
				return resultMap;
			}
			EUser eUser = new EUser();
			eUser.setEUser_id(UUIDUtil.getUUid("eus"));
			eUser.setEUser_name(list2.get(0).toString());//姓名
			String sex = list2.get(1).toString();
			if("男".equals(sex)){
				eUser.setEUser_sex("0");//性别
			}else if("女".equals(sex)){
				eUser.setEUser_sex("1");//性别
			}
			
			eUser.setEUser_isdelete("0");
			eUser.setEUser_companyname(list2.get(2).toString());//工作单位
			eUser.setEUser_department(list2.get(3).toString());//部门
			eUser.setEUser_hold(list2.get(4).toString());//职务
			eUser.setEUser_indentitynumber(list2.get(5).toString());//身份证号
			eUser.setEUser_phone(list2.get(6).toString());//联系方式
			eUser.setEUser_remark(list2.get(7).toString());//备注
			eUser.setEUser_creater(user.getUser_id());
			eUser.setEUser_createtime(APPLYDATE);
			eUser.setEUser_updatetime(APPLYDATE);
			eUser.setEUser_updater(user.getUser_id());
/*			//判断身份证号是否重复  稍后写
			if(eUserService.checkInu(list2.get(5).toString(), "")){
				resultMap.put("success", false);
				resultMap.put("code", 3);//身份证号重复
				return resultMap;
			}*/
			idnummap.put(list2.get(5).toString(), eUser);
			eUsers.add(eUser);
		}
		try{
			eUserService.importEUser(eUsers,user.getUser_id());
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", true);
			resultMap.put("code", 2);//数据失败
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("code", 1);//成功!
		return resultMap;
	}
	
	/**
	 * 更新人员
	 * @param EUser_id
	 * @param EUser_name
	 * @param EUser_companyname
	 * @param EUser_department
	 * @param EUser_hold
	 * @param EUser_sex
	 * @param EUser_remark
	 * @param EUser_indentitynumber
	 * @param EUser_phone
	 * @return
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	public Map<String,Object> updateEUser(String EUser_id,String EUser_name,String EUser_companyname,String EUser_department,
			String EUser_hold,String EUser_sex,String EUser_remark,String EUser_indentitynumber,String EUser_phone,HttpServletRequest request){
		//结果map
		Map<String,Object> resultMap = new HashMap<String, Object>();
		IUser user = new IUser();
		user = (IUser) request.getSession().getAttribute("user");
		if(user == null){
			resultMap.put("success", false);
			resultMap.put("message", "3");//未登录
			return resultMap;
		}
		//判断身份证号是否重复  稍后写
		if(eUserService.checkInu(EUser_indentitynumber,EUser_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//身份证号重复
			return resultMap;
		}
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		EUser eUser = new EUser();
		eUser = eUserService.getDetailByid(EUser_id);
		if(eUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");// 获取人员失败!
			return resultMap;
		}
		eUser.setEUser_companyname(EUser_companyname);
		eUser.setEUser_department(EUser_department);
		eUser.setEUser_hold(EUser_hold);
		eUser.setEUser_indentitynumber(EUser_indentitynumber);
		eUser.setEUser_name(EUser_name);
		eUser.setEUser_phone(EUser_phone);
		eUser.setEUser_phone(EUser_phone);
		eUser.setEUser_remark(EUser_remark);
		eUser.setEUser_sex(EUser_sex);
		eUser.setEUser_updatetime(APPLYDATE);
		eUser.setEUser_updater(user.getUser_id());
		eUserService.updateEUser(eUser);
		resultMap.put("success", true);
		resultMap.put("message", "2");//新增成功!
		return resultMap;
	}
	
	/**
	 * 获取人员详情
	 * @param EUser_id
	 * @return
	 */
	@RequestMapping("/getDetailByid")
	@ResponseBody
	public Map<String, Object> getDetailByid(String EUser_id) {
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(StringUtil.isblack(EUser_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		EUser eUser = new EUser();
		eUser = eUserService.getDetailByid(EUser_id);
		if(eUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");// 获取人员失败!
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("data", eUser);// 新增成功!
		return resultMap;
	}
	
	/**
	 * 根据id删除人员 逻辑
	 * @param EUser_id
	 * @return
	 */
	@RequestMapping("/deleteEUser")
	@ResponseBody
	public Map<String, Object> deleteEUserByid(String EUser_id,HttpServletRequest request) {
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		IUser user = new IUser();
		user = (IUser) request.getSession().getAttribute("user");
		if(user == null){
			resultMap.put("success", false);
			resultMap.put("message", "3");//未登录
			return resultMap;
		}
		if(StringUtil.isblack(EUser_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		EUser eUser = new EUser();
		eUser = eUserService.getDetailByid(EUser_id);
		if(eUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");// 获取人员失败!
			return resultMap;
		}
		eUser.setEUser_isdelete("1");
		eUser.setEUser_updater(user.getUser_id());
		eUser.setEUser_updatetime(APPLYDATE);
		eUserService.deleteEUser(EUser_id);
		resultMap.put("success", true);
		resultMap.put("message", "2");// 删除成功!
		return resultMap;
	}
	
	/**
	 * layui 接口
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getlistLay")
	@ResponseBody
	public LayuiDataTable<EUser> getListBypageLay(@RequestParam("page")int page,@RequestParam("limit")int limit,HttpServletRequest request){
		LayuiDataTable<EUser> cDataTable = new LayuiDataTable<EUser>();
		IUser user = new IUser();
		user = (IUser) request.getSession().getAttribute("user");
		if(user == null){
			cDataTable.setCode(0);
			cDataTable.setMsg("");
			return cDataTable;
		}
		cDataTable = eUserService.getListBypage(page, limit,user.getUser_id());
		cDataTable.setCode(0);
		cDataTable.setMsg("");
		return cDataTable;
	}
	
	@RequestMapping("/exportUser")
	public void ExportUser(HttpServletRequest request,HttpServletResponse response){
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = eUserService.getList(iUser.getUser_id());
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
			logger.info("yes");
		}
	   
	}
	
}
