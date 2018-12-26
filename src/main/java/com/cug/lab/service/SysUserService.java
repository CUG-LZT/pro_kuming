package com.cug.lab.service;

import java.util.List;

import com.cug.lab.beans.Page;
import com.cug.lab.model.SysUser;

public interface SysUserService {
	SysUser selectOneUserByNameAndPsd(SysUser sysUser);
	List<SysUser> selectAllUser(Page page);
	int selectAllUserCount();
	List<SysUser> selectAllUserByCode(Page page,String value); 
	int selectAllUserCountByCode(String value);
	List<SysUser> selectAllUserByName(Page page,String value); 
	int selectAllUserCountByName(String value);
	List<SysUser> selectAllUserByAdress(Page page,String value); 
	int selectAllUserCountByAdress(String value);
	List<SysUser> selectAllUserByRole(Page page,String value); 
	int selectAllUserCountByRole(String value);
	int insertUser(SysUser user);
	int updateUser(SysUser user);
	int updatePsd(SysUser user);
	int deleteOneUser(SysUser user);
	int deleteListUser(String[] ids);
	Boolean checkName(SysUser user);
}
