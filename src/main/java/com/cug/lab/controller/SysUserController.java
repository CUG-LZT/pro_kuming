 package com.cug.lab.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cug.lab.beans.City;
import com.cug.lab.beans.EasyuiData;
import com.cug.lab.beans.MsgToPage;
import com.cug.lab.beans.Page;
import com.cug.lab.model.SysUser;
import com.cug.lab.service.SysUserService;

@Controller
@RequestMapping("/sys/user")
public class SysUserController {
	
	@Resource
	private SysUserService userService;
	
	@RequestMapping(value = "/psd.page")
	public String acl() {
		return "psd";
	}
	
	@RequestMapping(value = "/user.page")
	public String user() {
		return "user";
	}
	
	@RequestMapping(value = "/userInfo.page")
	public String userInfo() {
		return "userInfo";
	}
	 
	@RequestMapping(value = "/count.page")
	public String count() {
		return "usercount";
	}

	@ResponseBody
	@RequestMapping(value = "/getCity.json")
	public List<City> getCity() {
		List<City> list = new ArrayList<City>(); 
		String city = "其他,北京市,天津市,河北省,山西省,内蒙古自治区,辽宁省,吉林省,黑龙江省,上海市,江苏省,浙江省,安徽省,福建省,江西省,山东省,"
				+ "河南省,湖北省,湖南省,广东省,海南省,广西壮族自治区,甘肃省,陕西省,新疆维吾尔自治区,青海省,宁夏回族自治区,重庆市,四川省,"
				+ "贵州省,云南省,西藏自治区,台湾省,澳门特别行政区,香港特别行政区,海外";
		String[] citys = city.split(",");
		for (int i = 0; i < citys.length; i++) {
			list.add(new City(i,citys[i]));
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectAllUser.json")
	public EasyuiData<SysUser> selectAllUser(Page page,String value , String name) {
		EasyuiData<SysUser> easyuiData = new EasyuiData<SysUser>();
		List<SysUser> list = new ArrayList<SysUser>();
		int count = 0;
		//value为空 说明输入框没有输入 则加载所有内容
		if(value == null || value.length() <= 0) {
			list = userService.selectAllUser(page); 
			count = userService.selectAllUserCount();
		}else{//不为空 则根据 name的值进行判断 
			if(name.equals("userName")) {
				list = userService.selectAllUserByName(page,value); 
				count = userService.selectAllUserCountByName(value);
			}else if(name.equals("userCode")){
				list = userService.selectAllUserByCode(page,value); 
				count = userService.selectAllUserCountByCode(value);
			}else if(name.equals("userAdress")){
				list = userService.selectAllUserByAdress(page,value); 
				count = userService.selectAllUserCountByAdress(value);
			}else if(name.equals("userRole")){
				list = userService.selectAllUserByRole(page,value); 
				count = userService.selectAllUserCountByRole(value);
			}
		}
		easyuiData.setTotal(count);
		easyuiData.setRows(list);
		return easyuiData;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertUser.json")
	public MsgToPage<SysUser> insertUser(SysUser user) {
		System.out.println(user);
		MsgToPage<SysUser> msgToPage = new MsgToPage<SysUser>();
		if(checkName(user)) {
			//id cede CreateTime 由后台生成
			user.setUserCode(12345);
			user.setUserCreateTime(new Date());
			
			int count = userService.insertUser(user);
			if(count == 1) {
				msgToPage.setCode(200);
				msgToPage.setMsg("添加"+user.getUserName()+"用户成功！"+"用户编码是"+user.getUserCode()+"请牢记！");
			}else {
				msgToPage.setCode(404);
				msgToPage.setMsg("添加"+user.getUserName()+"用户失败！");
			}
		}else {
			msgToPage.setCode(404);
			msgToPage.setMsg("'"+user.getUserName()+"'此用户名已存在！");
		}
		return msgToPage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateUser.json")
	public MsgToPage<SysUser> updateUser(SysUser user) {
		MsgToPage<SysUser> msgToPage = new MsgToPage<SysUser>();
			int count = userService.updateUser(user);
			if(count == 1) {
				msgToPage.setCode(200);
				msgToPage.setMsg("编辑"+user.getUserName()+"用户成功！");
			}else {
				msgToPage.setCode(404);
				msgToPage.setMsg("编辑"+user.getUserName()+"用户失败！");
			}
		return msgToPage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteOneUser.json")
	public MsgToPage<SysUser> deleteOneUser(SysUser user) {
		MsgToPage<SysUser> msgToPage = new MsgToPage<SysUser>();
			int count = userService.deleteOneUser(user);
			if(count == 1) {
				msgToPage.setCode(200);
				msgToPage.setMsg("删除用户成功！");
			}else {
				msgToPage.setCode(404);
				msgToPage.setMsg("删除用户失败！");
			}
		return msgToPage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteListUser.json")
	public MsgToPage<SysUser> deleteListUser(String[] ids) {
		MsgToPage<SysUser> msgToPage = new MsgToPage<SysUser>();
			int count = userService.deleteListUser(ids);
			if(count > 0) {
				msgToPage.setCode(200);
				msgToPage.setMsg("删除"+count+"条用户成功！");
			}else {
				msgToPage.setCode(404);
				msgToPage.setMsg("删除用户失败！");
			}
		return msgToPage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatePsd.json")
	public MsgToPage<SysUser> updatePsd(SysUser sysUser,String newUserPsd) {
		MsgToPage<SysUser> msgToPage = new MsgToPage<SysUser>();
		SysUser user = userService.selectOneUserByNameAndPsd(sysUser);
		if(user != null && user.getUserPsd() != null && user.getUserPsd() != "") {
			user.setUserPsd(newUserPsd);
			int count = userService.updatePsd(user);
			if(count == 1){
				msgToPage.setCode(200);
				msgToPage.setMsg(user.getUserName()+" 更新更新密码成功！");
			}else {
				msgToPage.setCode(404);
				msgToPage.setMsg("更新失败！");
			}
		}else {
			msgToPage.setCode(404);
			msgToPage.setMsg("原密码错误！");
		}
		
		/*	int count = userService.deleteListUser(ids);
			if(count > 0) {
				msgToPage.setCode(200);
				msgToPage.setMsg("删除"+count+"条用户成功！");
			}else {
				msgToPage.setCode(404);
				msgToPage.setMsg("删除用户失败！");
			}*/
		return msgToPage;
	}
	
	public Boolean checkName(SysUser user){
		return userService.checkName(user);
	}
}
