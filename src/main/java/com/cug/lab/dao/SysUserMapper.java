package com.cug.lab.dao;

import java.util.List;
import java.util.Map;

import com.cug.lab.beans.Page;
import com.cug.lab.model.SysUser;

public interface SysUserMapper {
	SysUser selectOneUserByNameAndPsd(SysUser sysUser);
	List<SysUser> selectAllUser(Page page);
	int selectAllUserCount();
	List<SysUser> selectAllUserByCode(Map<String,Object> map); 
	int selectAllUserCountByCode(int value);
	List<SysUser> selectAllUserByName(Map<String,Object> map); 
	int selectAllUserCountByName(String value);
	List<SysUser> selectAllUserByAdress(Map<String,Object> map); 
	int selectAllUserCountByAdress(int value);
	List<SysUser> selectAllUserByRole(Map<String,Object> map); 
	int selectAllUserCountByRole(int value);
	int insertUser(SysUser user);
	int updateUser(SysUser user);
	int updatePsd(SysUser user);
	int deleteOneUser(SysUser user);
	int deleteListUser(List<Integer> ids);
	List<SysUser> checkName(SysUser user);
}
