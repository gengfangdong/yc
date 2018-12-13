/**
 * 
 */
package action;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;







import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
		iUser.setCreatetime(news_Createtime);
		
		iUserService.insertIUser(iUser);
		resultMap.put("success", true);
		resultMap.put("msg", 1);//注册成功!
		return resultMap;	
	}
	
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
		iUser.setUser_password("");
		HttpSession session = request.getSession();
		session.setAttribute("user", iUser);
		session.setMaxInactiveInterval(30 * 60);
		resultmap.put("success", true);
		resultmap.put("msg", "0");//登录失败
		return resultmap;
	}
	
	
	
}
