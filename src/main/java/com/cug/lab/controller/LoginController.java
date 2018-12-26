 package com.cug.lab.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cug.lab.model.SysUser;
import com.cug.lab.service.SysUserService;

@Controller
@RequestMapping("")
public class LoginController {
	
	@Resource
	private SysUserService userService;
	
	
	
	@RequestMapping(value = "/login.page")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/welcome.page")
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping(value = "/register.page")
	public String register() {
		return "register";
	}
	
	@RequestMapping(value = "/home.page")
	public String home(SysUser user,HttpSession session) {
		SysUser su = null;
		if(user.getUserName() == null || "".equals(user.getUserName().trim())){
			session.setAttribute("msg", "");
			return "login";
		}else {
			su = userService.selectOneUserByNameAndPsd(user);
			
			if(su != null){
				session.setAttribute("user_session", su);
				return "home";
			}else{
				session.setAttribute("msg", "账号或密码错误，请重新输入！"); 
				return "login";
			}
		}
		
	}
}
