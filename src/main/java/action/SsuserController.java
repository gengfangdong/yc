package action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	
	
}
