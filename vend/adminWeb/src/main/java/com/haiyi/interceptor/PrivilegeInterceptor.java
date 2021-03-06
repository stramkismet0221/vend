package com.haiyi.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.haiyi.domain.base.LoginInfo;
import com.haiyi.utils.JsonUtil;
import com.haiyi.utils.SessionUtil;
import com.maizi.anno.AuthAnno;

 
/**
 * 
  * @ClassName: PrivilegeInterceptor
  * @Company: 麦子科技
  * @Description: 权限过滤器
  * @author 技术部-谢维乐
  * @date 2016年4月6日 下午7:18:35
  *
 */
public class PrivilegeInterceptor implements HandlerInterceptor  {
	
	//登录请求
	private static final String LOGIN_URI="/session";
	//注册请求
	private static final String REGIST_URI="/register";
 
	//session过期
	private final static int RESPONSETYPE_SESSION_INVALID =0;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception {
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
	         Method method = handlerMethod.getMethod();
	         AuthAnno authAnno = method.getAnnotation(AuthAnno.class);
	         if (authAnno != null ) {
	             boolean needLogin = authAnno.verifyLogin();
	             if (needLogin) {
	            	 //需要登录
	            	 LoginInfo loginInfo =  SessionUtil.getCurrentLoginInfo(request.getSession());
	            	 if(loginInfo!=null){
	            		 String requestURI=request.getRequestURI();
	            		 requestURI = requestURI.substring(request.getContextPath().length());
	            		 if(requestURI.startsWith(LOGIN_URI) || requestURI.startsWith(REGIST_URI)){
	            		 	redirect(response,request.getContextPath());
	            		 	return false;
	            		 }
	            	 }else{
	            		 //跳转到登录界面 或 返回 JSON提示数据
	            		 if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
	            		 	response.addHeader("sessionstatus", "timeOut");
	            		 	Map<String, Object> result = new HashMap<String, Object>();  
	            		 	result.put("success",false); 
	            		 	result.put("msg","会话过期,请重新登录.");
	            		 	result.put("responseType",RESPONSETYPE_SESSION_INVALID);
	            		 	PrintWriter out = response.getWriter();  
	            		 	out.print(JsonUtil.mapToJson(result));
	            		 	if(out!=null){
	            		 		out.flush();
	            		 		out.close();
	            		 	}
	            		 }else{
	            			 redirect(response,request.getContextPath()+"/session/new");
	            		 }
	            		 return false;
	            	 }
	             }
	         }else{  
	        	 //不需要登录
	        	 String requestURI=request.getRequestURI();
        		 requestURI = requestURI.substring(request.getContextPath().length());
        		 if(requestURI.startsWith(LOGIN_URI) || requestURI.startsWith(REGIST_URI)){  //不需要登录的,但是已经登陆了,又来登录
        			if(SessionUtil.getCurrentLoginInfo(request.getSession())!=null){
        				redirect(response,request.getContextPath()+"/");
        				return false;
        			}
        		 }
	         }
		}
		return true;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception exception)throws Exception {
	}
 

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,Object arg2, ModelAndView arg3) throws Exception {
	}
	
	/**
	 *重定向   
	 * @param response
	 * @param URI
	 * @throws ServletException
	 * @throws IOException
	 */
	private void redirect(HttpServletResponse response,String URI) throws ServletException, IOException{
		response.sendRedirect(URI);
	}
}
