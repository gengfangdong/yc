/**
 * 
 */
package action;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;







import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import entity.DatatablesViewPage;
import entity.IUser;
import service.IUserService;
import util.StringUtil;
import util.UUIDUtil;

/**
 * @author: my
 * @Package: com.yc.action
 * @date: 2018年12月4日 下午5:09:54
 * @ClassName:tNewController
 */
@RestController
@RequestMapping("/IUser")
public class IUserController {
	
	@Autowired
	private IUserService iUserService;
	
	/**
	 * 判断登录名是否存在
	 * @param loginname 登录名
	 * @return
	 */
	@RequestMapping(value="/checkloginname",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> TitlePage(String loginname){
		//结果map
		Map<String,Object> resultmap = new HashMap<String, Object>();
		if("".equals(loginname)||loginname == null){
			resultmap.put("success", true);
			resultmap.put("msg", "2");//参数错误
			return resultmap;
		}
		else{
			if(iUserService.checkloginname(loginname)){//true 为存在
				resultmap.put("success", true);
				resultmap.put("msg", "1");//登录名存在
				return resultmap;
			}
			else{
				resultmap.put("success", true);
				resultmap.put("msg","0");//登录名不存在
				return resultmap;
			}
				
		}
		
	}
	/**
	 * 注册非管理员
	 * @param User_loginname
	 * @param User_name
	 * @param User_phone
	 * @param User_mail
	 * @param User_companyname
	 * @param User_department
	 * @param User_job
	 * @param User_hold
	 * @param User_password
	 * @return
	 */
	@RequestMapping(value="/regist",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> Insert(String User_loginname,
			String User_name,String User_phone,String User_mail,
			String User_companyname,String User_department,String User_job,
			String User_hold,String User_password){
		//返回结果
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//校验登录名
		if("".equals(User_loginname)||User_loginname == null){
			resultMap.put("success", false);
			resultMap.put("msg", "2");//参数错误
			return resultMap;
		}
		else{
			if(iUserService.checkloginname(User_loginname)){//true 为存在
				resultMap.put("success", false);
				resultMap.put("msg", "1");//登录名存在
				return resultMap;
			}
				
		}
		//构建用户
		IUser iUser = new IUser();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		
		iUser.setUser_id(UUIDUtil.getUUid("user"));
		iUser.setUser_loginname(User_loginname);
		iUser.setUser_companyname(User_companyname);
		iUser.setUser_department(User_department);
		iUser.setUser_hold(User_hold);
		iUser.setUser_job(User_job);
		iUser.setUser_mail(User_mail);
		iUser.setUser_name(User_name);
		iUser.setUser_password(User_password);
		iUser.setUser_phone(User_phone);
		iUser.setIsadmin("0");//非管理员
		iUser.setIsdelete("0");//未删除
		iUser.setCreatetime(news_Createtime);
		iUser.setUser_status("1");//默认为可用
		iUser.setUser_ydphone(User_loginname);//移动电话
		
		iUserService.insertIUser(iUser);
		resultMap.put("success", true);
		resultMap.put("msg", 1);//注册成功!
		return resultMap;	
	}
	
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Map<String,Object> login(String username,String password,HttpServletRequest request,HttpServletResponse response){
		//返回的map
		Map<String,Object> resultmap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(username)||StringUtil.isblack(password)){
			resultmap.put("success", true);
			resultmap.put("msg", "1");//参数错误
			return resultmap;
		}
		
		IUser iUser = new IUser();
		iUser = iUserService.login(username,password);
		if(iUser == null){
			resultmap.put("success", false);
			resultmap.put("msg", "0");//登录失败
			return resultmap;
		}
		else if("0".equals(iUser.getUser_status())){
			resultmap.put("success", false);
			resultmap.put("msg", "1");//用户被锁定
			return resultmap;
		}
		iUser.setUser_password("");
		HttpSession session = request.getSession();
		session.setAttribute("user", iUser);
		session.setMaxInactiveInterval(30 * 60);
		resultmap.put("success", true);
		resultmap.put("msg", "0");//登录失败
		return resultmap;
	}
	
	
	/**
	 * 后台登录
	 * @param username
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/loginadmin")
	@ResponseBody
	public Map<String,Object> loginAdmin(String username,String password,HttpServletRequest request){
		// 结果map
		Map<String, Object> resultmap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(username)||StringUtil.isblack(password)){
			resultmap.put("success", true);
			resultmap.put("msg", "1");//参数错误
			return resultmap;
		}
		
		IUser iUser = new IUser();
		iUser = iUserService.login(username,password);
		if(iUser == null){
			resultmap.put("success", false);
			resultmap.put("msg", "0");//登录失败
			return resultmap;
		}else if("0".equals(iUser.getUser_status())){
			resultmap.put("success", false);
			resultmap.put("msg", "1");//用户被锁定
			return resultmap;
		}
		iUser.setUser_password("");
		HttpSession session = request.getSession();
		session.setAttribute("user", iUser);
		session.setMaxInactiveInterval(30 * 60);
		if("0".equals(iUser.getIsadmin())){
			resultmap.put("success", true);
			resultmap.put("msg", "1");//登录失败
		}
		else if("1".equals(iUser.getIsadmin())){
			resultmap.put("success", true);
			resultmap.put("msg", "2");//登录失败
		}
		
		return resultmap;
	}
	/**
	 * 增加人员
	 * @param User_loginname
	 * @param User_name
	 * @param User_phone
	 * @param User_mail
	 * @param User_companyname
	 * @param User_department
	 * @param User_job
	 * @param User_hold
	 * @param User_address
	 * @param User_password
	 * @param User_status
	 * @return
	 */
	@RequestMapping("/addIUser")
	@ResponseBody
	public Map<String, Object> addIUser(String User_loginname, String User_name, String User_phone, String User_mail,
			String User_companyname, String User_department, String User_job, String User_hold, String User_address,
			String User_password,String User_status) {

		// 返回结果
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 校验登录名
		if ("".equals(User_loginname) || User_loginname == null) {
			resultMap.put("success", false);
			resultMap.put("msg", "2");// 参数错误
			return resultMap;
		} else {
			if (iUserService.checkloginname(User_loginname)) {// true 为存在
				resultMap.put("success", false);
				resultMap.put("msg", "1");// 登录名存在
				return resultMap;
			}

		}
		// 构建用户
		IUser iUser = new IUser();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳

		iUser.setUser_id(UUIDUtil.getUUid("user"));
		iUser.setUser_loginname(User_loginname);
		iUser.setUser_companyname(User_companyname);
		iUser.setUser_department(User_department);
		iUser.setUser_hold(User_hold);
		iUser.setUser_job(User_job);
		iUser.setUser_mail(User_mail);
		iUser.setUser_name(User_name);
		iUser.setUser_password(User_password);
		iUser.setUser_phone(User_phone);
		iUser.setUser_address(User_address);
		iUser.setIsadmin("0");// 非管理员
		iUser.setIsdelete("0");//未删除
		iUser.setUser_status(User_status);
		iUser.setCreatetime(news_Createtime);
		iUser.setUser_ydphone(User_loginname);
		iUserService.insertIUser(iUser);
		resultMap.put("success", true);
		resultMap.put("msg", "2");// 注册成功!
		return resultMap;
	}
	/**
	 * 获取详情
	 * @param User_id
	 * @return
	 */
	@RequestMapping("/showDetail")
	@ResponseBody
	public Map<String,Object> getDetailByid(String User_id){
		//返回的map
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		if(StringUtil.isblack(User_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误
			return resultMap;
		}
		IUser iUser = new IUser();
		iUser = iUserService.getDetailByid(User_id);
		if(iUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//没有人员
			return resultMap;
		}
		
		resultMap.put("success", true);
		resultMap.put("data", iUser);
		return resultMap;
	}
	
	/**
	 * 更新人员
	 * @param User_id
	 * @param User_loginname
	 * @param User_name
	 * @param User_phone
	 * @param User_mail
	 * @param User_companyname
	 * @param User_department
	 * @param User_job
	 * @param User_hold
	 * @param User_address
	 * @param User_password
	 * @param User_status
	 * @return
	 */
	@RequestMapping("/updateIUser")
	@ResponseBody
	public Map<String, Object> updateIUser(String User_id, String User_loginname, String User_name, String User_phone,
			String User_mail, String User_companyname, String User_department, String User_job, String User_hold,
			String User_address, String User_password, String User_status,HttpServletRequest request) {

		// 返回结果
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (iUserService.checkLoginNameAndUser_id(User_id, User_loginname)) {// true 为存在
			resultMap.put("success", false);
			resultMap.put("msg", "0");// 登录名存在
			return resultMap;
		}
		
		HttpSession session = request.getSession();
		IUser user = (IUser) session.getAttribute("user");
		String user_id = user.getUser_id();
		
		// 构建用户
		IUser iUser = new IUser();
		
		iUser = iUserService.getDetailByid(User_id);
		if(iUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//没有人员
			return resultMap;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳

		iUser.setUser_loginname(User_loginname);
		iUser.setUser_companyname(User_companyname);
		iUser.setUser_department(User_department);
		iUser.setUser_hold(User_hold);
		iUser.setUser_job(User_job);
		iUser.setUser_mail(User_mail);
		iUser.setUser_name(User_name);
		iUser.setUser_password(User_password);
		iUser.setUser_phone(User_phone);
		iUser.setUser_address(User_address);
		iUser.setIsadmin("0");// 非管理员
		iUser.setUser_status(User_status);
		iUser.setIsdelete("0");//未删除
		iUser.setCreatetime(news_Createtime);
		iUserService.updateIUser(iUser);
		resultMap.put("success", true);
		resultMap.put("msg", "2");// 更新成功!
		return resultMap;
	}
	
	/**
	 * 根据id删除人员
	 * @param User_id
	 * @return
	 */
	@RequestMapping("/deleteIUser")
	@ResponseBody
	public Map<String, Object> deleteIUserByid(String User_id) {

		// 返回的map
		Map<String, Object> resultMap = new HashMap<String, Object>();

		if (StringUtil.isblack(User_id)) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 参数错误
			return resultMap;
		}
		IUser iUser = new IUser();
		iUser = iUserService.getDetailByid(User_id);
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 没有人员
			return resultMap;
		}
		iUserService.deleteIUser(iUser.getUser_id());
		resultMap.put("success", true);
		resultMap.put("message", "2");//删除成功!
		return resultMap;
	}
	
	@RequestMapping("/getlistBypage")
	@ResponseBody
	public DatatablesViewPage<IUser> getListBypage(@RequestParam("draw")int draw,@RequestParam("start")int start,
			@RequestParam("length")int length){
		//返回的Data
		DatatablesViewPage<IUser> datatablesViewPage = new DatatablesViewPage<IUser>();
		datatablesViewPage = iUserService.GetlistPage(start, length);
		
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
		
	}
	
	@RequestMapping("/getdetailShow")
	@ResponseBody
	public Map<String,Object> getDetailshow(HttpServletRequest request){
		// 返回的map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		IUser user = (IUser) session.getAttribute("user");
		if (user == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 参数错误
			return resultMap;
		}
		String user_id = user.getUser_id(); //"user626e64ef8dfe49389fc1a358da95442e";
		if (StringUtil.isblack(user_id)) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 参数错误
			return resultMap;
		}
		IUser iUser = new IUser();
		iUser = iUserService.getDetailByid(user_id);
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 没有人员
			return resultMap;
		}

		resultMap.put("success", true);
		resultMap.put("data", iUser);
		return resultMap;
	}
	
	@RequestMapping("/updateShowIUser")
	@ResponseBody
	public Map<String,Object> updateIUser(String User_id,String User_name,String User_ydphone,
			String User_phone,String User_mail,String User_companyname,String User_department,
			String User_hold){
		// 返回的map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String news_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		if (StringUtil.isblack(User_id)) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 参数错误
			return resultMap;
		}
		IUser iUser = new IUser();
		iUser = iUserService.getDetailByid(User_id);
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 没有人员
			return resultMap;
		}

		iUser.setCreatetime(news_Createtime);
		iUser.setUser_companyname(User_companyname);
		iUser.setUser_department(User_department);
		iUser.setUser_hold(User_hold);
		iUser.setUser_name(User_name);
		iUser.setUser_ydphone(User_ydphone);
		iUser.setUser_mail(User_mail);
		iUser.setUser_phone(User_phone);
		try{
			iUserService.updateShow(iUser);
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "3");//保存失败!
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "2");//保存成功!
		return resultMap;
	}
	@RequestMapping("/updatePassword")
	public Map<String,Object> updatePassword(HttpServletRequest request,String oldpassword,String newpassword){
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		
		iUser = iUserService.getDetailByid(iUser.getUser_id());
		if(!oldpassword.equals(iUser.getUser_password())){
			resultMap.put("success", false);
			resultMap.put("message", "1");//旧密码不正确
			return resultMap;
		}
		try{
			iUserService.updatePassword(newpassword,iUser.getUser_id());
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "2");//修改失败
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("message", "3");//修改成功
		return resultMap;
	}
	
	
}
