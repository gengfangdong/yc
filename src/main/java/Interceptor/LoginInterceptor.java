package Interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.util.StringUtils;

import entity.IUser;
import Contant.Contant;
public class LoginInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String url = request.getRequestURI();
		System.out.println(url);
		Boolean preflag = false;;
		String[] preurl = Contant.preHandler;
		for (String string : preurl) {
			if(url.indexOf(string)>=0){
				preflag = true;
				break;
			}
		}
		if(preflag){
			HttpSession httpSession = request.getSession();
			
			IUser user = (IUser) httpSession.getAttribute("user");
			if(user != null){
				return true;
			}
			else
				redirect(request, response);
		}
		return true;
	}

	// 对于请求是ajax请求重定向问题的处理方法
	public void redirect(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 获取当前请求的路径
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + request.getContextPath();
		System.out.println(basePath);
		// 如果request.getHeader("X-Requested-With")
		// 返回的是"XMLHttpRequest"说明就是ajax请求，需要特殊处理 否则直接重定向就可以了
		if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
			// 告诉ajax我是重定向
			response.setHeader("REDIRECT", "REDIRECT");
			// 告诉ajax我重定向的路径
			response.setHeader("CONTENTPATH", basePath+"/show/dist/");
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		} else {
			response.sendRedirect(basePath+"/show/dist/");
		}
	}

}
