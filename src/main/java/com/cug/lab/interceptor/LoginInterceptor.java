package com.cug.lab.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cug.lab.model.SysUser;


public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//设置basepath
		request.getSession().setAttribute("basepath", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/" );
		return true;
		/*//获取请求的RUi:去除http:localhost:8080这部分剩下的
		String uri = request.getRequestURI();
		//UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
		if (uri.indexOf("/login") >= 0) {
		    return true;
		}
		//获取session
		SysUser user = (SysUser) request.getSession().getAttribute("user_session");
		
		//判断session中是否有用户数据，如果有，则返回true，继续向下执行
		if (user != null) {
		    return true;
		}
		//不符合条件的给出提示信息，并转发到登录页面
		request.setAttribute("login_session", "您还没有登录，请先登录！");
		System.out.println("拦截了"+uri);
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		return false;*/
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
