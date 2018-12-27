package aop;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import entity.IUser;

@Component
@Aspect
public class RequestAop {
	private static Logger logger = Logger.getLogger(RequestAop.class);//参数里面的类名称是logger所在类的名称
	

	// 声明一个切点 里面是 execution表达式
	@Pointcut("execution(* action.*.*(..))")
	private void controllerAspect() {
	}
	@Before(value="controllerAspect()")
	public void doAfter(JoinPoint joinPoint)throws Throwable {
		// 接收到请求，记录请求内容

        //logger.info("WebLogAspect.doBefore()");

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

         HttpServletRequest request = attributes.getRequest();

      // 记录下请求内容
/*
        logger.info("URL : " + request.getRequestURL().toString());

        logger.info("HTTP_METHOD : " + request.getMethod());

        logger.info("IP : " + request.getRemoteAddr());

        logger.info("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() +"." + joinPoint.getSignature().getName());

        logger.info("ARGS : " + Arrays.toString(joinPoint.getArgs()));*/

       //获取所有参数方法一：

        /*Enumeration<String> enu=request.getParameterNames(); 

        while(enu.hasMoreElements()){ 

            String paraName=(String)enu.nextElement(); 

            System.out.println(paraName+": "+request.getParameter(paraName)); 

        } */
        String url = request.getRequestURI();
        Map<String,String[]> requestMap = request.getParameterMap();
		StringBuffer requestBuffer = new StringBuffer();
		for (Entry<String, String[]> e : requestMap.entrySet()) {
			String value = Arrays.toString(e.getValue())
					.replaceAll("\\[|\\]","")
					.replaceAll("\\s", ",");
			requestBuffer.append(e.getKey()+":"+value+";");		
		}
		String IP = request.getRemoteAddr();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		IUser iuser = (IUser) request.getSession().getAttribute("user");
		String username = "未登录";
		if(iuser!=null){
			username = iuser.getUser_name()+iuser.getUser_loginname();
		}
		logger.info("用户:"+username+";请求时间"+df.format(new Date())+"请求ip-->"+IP+";请求路径为-->"+url+";请求参数为-->"+requestBuffer.toString());
	}
	@AfterReturning(returning = "result",pointcut ="controllerAspect()")
    public void  doAfterReturning(JoinPoint joinPoint,Object result){

		// 处理完请求，返回内容
		//System.out.println(result);
		if(result!=null)
			logger.info("返回结果:"+result.toString());

    }
	
}
