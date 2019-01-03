package action;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.EUser;
import entity.IUser;
import entity.Scheduledshift;
import entity.Ssuser;
import service.ScheduledshiftService;
import service.SsuserService;
import util.ExcelUtil;
import util.UUIDUtil;

@RequestMapping("/Ssuser")
@RestController
public class SsuserController {
	
	
	@Autowired
	private ScheduledshiftService scheduledshiftService;
	@Autowired
	private SsuserService ssuserService;
	
	
	

	@RequestMapping("/SignUp")
	@ResponseBody
	public Map<String,Object> SignUp(@RequestParam("file") MultipartFile file,String Ssu_ssid,String Ssu_usernumber,
			String Ssu_username,String Ssu_ydphone,String Ssu_phone,String Ssu_department,HttpServletRequest request){
		//结果map
		Map<String,Object> resultmap = new HashMap<String, Object>();
		//获取人员
		IUser user = new IUser();
		user = (IUser) request.getSession().getAttribute("user");
		if(user == null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		//1、判断规定班次是否存在
		Scheduledshift scheduledshift = new Scheduledshift();
		scheduledshift = scheduledshiftService.getDetailByid(Ssu_ssid);
		if(scheduledshift == null){
			resultmap.put("success", false);
			resultmap.put("message", "1");//班次不存在
			return resultmap;
		}
		//2、判断报名人数是否超过剩余人数
		//获取规定班次剩余的人数
		int allSign = 0;
		allSign = Integer.valueOf(scheduledshift.getScheduled_class_pnumber())-ssuserService.getCount(scheduledshift.getScheduled_id());
		// 获取上传的execl
		List<List<Object>> list = new ArrayList<List<Object>>();
		// EUSER列表
		List<EUser> eUsers = new ArrayList<EUser>();
		list = new ExcelUtil().getBankListByExcel(file);
		if (list == null || list.size() == 0) {
			resultmap.put("success", false);
			resultmap.put("message", "2");//execl无数据
			return resultmap;
		}
		else if(list.size()>Integer.valueOf(Ssu_usernumber)){
			resultmap.put("success", false);
			resultmap.put("message", "3");//人员数量与execl不符合
			return resultmap;
		}else if(Integer.valueOf(Ssu_usernumber)>allSign){
			resultmap.put("success", false);
			resultmap.put("message", "5");//人员数量超出剩余人数
			return resultmap;
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
			eUser.setEUser_creater(user.getUser_id());
			eUser.setEUser_createtime(APPLYDATE);
			eUser.setEUser_updatetime(APPLYDATE);
			eUser.setEUser_updater(user.getUser_id());
			eUsers.add(eUser);
		}
		//检测execl里面身份证是否重复
		Map<String,Object> idnumber = new HashMap<String, Object>();
		for (EUser eUser : eUsers) {
			if(idnumber.put(eUser.getEUser_indentitynumber(), eUser)!=null){
				resultmap.put("success", false);
				resultmap.put("message", "4");//execl存在身份证重复!
				return resultmap;
			}
		}
		//人员信息表
		Ssuser ssuser = new Ssuser();
		ssuser.setSsu_creater(user.getUser_id());
		ssuser.setSsu_createtime(APPLYDATE);
		ssuser.setSsu_department(Ssu_department);
		ssuser.setSsu_isdelete("0");
		ssuser.setSsu_phone(Ssu_phone);
		ssuser.setSsu_id(UUIDUtil.getUUid("ssu"));
		ssuser.setSsu_status("0");
		ssuser.setSsu_userid(user.getUser_id());
		ssuser.setSsu_username(Ssu_username);
		ssuser.setSsu_usernumber(Ssu_usernumber);
		ssuser.setSsu_ydphone(Ssu_ydphone);
		ssuser.setSsu_ssid(Ssu_ssid);
		ssuserService.UpdateorInsert(eUsers, user.getUser_id(),ssuser);
		
		resultmap.put("success", true);
		resultmap.put("message", "4");//报名成功!
		return resultmap;
		
	}
	
	@RequestMapping("SignOut")
	@ResponseBody
	public Map<String,Object> SignOut(String Project_id,HttpServletRequest request,String ssuid){
		//结果集
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//检查班次是否存在
		Scheduledshift scheduledshift = new Scheduledshift();
		scheduledshift = scheduledshiftService.getDetailByid(Project_id);
		if(scheduledshift==null){
			resultMap.put("success", false);
			resultMap.put("message", "0");//班次不存在
			return resultMap;
		}
		//获取登录人
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		if(iUser==null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//未登录
			return resultMap;
		}
		try{
			ssuserService.SignOut(Project_id, iUser.getUser_id(),ssuid);
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "2");//取消报名失败
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "3");//取消报名成功
		return resultMap;
	}
	
	@RequestMapping("/exportUser/{ssuid}")
	public void ExportUser(HttpServletRequest request,HttpServletResponse response,@PathVariable String ssuid){
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = ssuserService.getListUserByid(iUser.getUser_id(), ssuid);
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
	
	
	
}
