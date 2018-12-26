package com.cug.lab.serviceImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cug.lab.beans.Page;
import com.cug.lab.dao.SysUserMapper;
import com.cug.lab.model.SysUser;
import com.cug.lab.service.SysUserService;

@Service("SysUserService")
public class SysUserServiceImpl implements SysUserService{

	@Resource
	SysUserMapper sysUserMapper;
	
	@Override
	public SysUser selectOneUserByNameAndPsd(SysUser sysUser) {
		return sysUserMapper.selectOneUserByNameAndPsd(sysUser);
	}

	@Override
	public List<SysUser> selectAllUser(Page page) {
		page.setCourent();
		return sysUserMapper.selectAllUser(page);
	}

	@Override
	public int insertUser(SysUser user) {
		return sysUserMapper.insertUser(user);
	}

	@Override
	public Boolean checkName(SysUser user) {
		if(sysUserMapper.checkName(user).size() > 0) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public int selectAllUserCount() {
		
		return sysUserMapper.selectAllUserCount();
	}

	@Override
	public int updateUser(SysUser user) {
		return sysUserMapper.updateUser(user);
	}

	@Override
	public int deleteOneUser(SysUser user) {
		return sysUserMapper.deleteOneUser(user);
	}

	@Override
	public int deleteListUser(String[] ids) {
		List<Integer> list = new ArrayList<Integer>();
		if(ids!=null && ids.length > 0) {
			for (int i = 0; i < ids.length; i++) {
				list.add(Integer.parseInt(ids[i]));
			}
			return sysUserMapper.deleteListUser(list);
		}else {
			return 0;
		}
	}


	@Override
	public List<SysUser> selectAllUserByCode(Page page, String value) {
		page.setCourent();
		Map<String,Object> map = new HashMap<String,Object>();
		int code = -1;
		try {
			code = Integer.parseInt(value);
		} catch (Exception e) {
			code = -1;
		}
		map.put("code", code);
		map.put("courent", page.getCourent());
		map.put("rows", page.getRows());
		return sysUserMapper.selectAllUserByCode(map);
	}

	@Override
	public int selectAllUserCountByCode(String value) {
		int code = -1;
		try {
			code = Integer.parseInt(value);
		} catch (Exception e) {
			code = -1;
		}
		return sysUserMapper.selectAllUserCountByCode(code);
	}

	
	
	@Override
	public List<SysUser> selectAllUserByName(Page page, String value) {
		page.setCourent();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", value);
		map.put("courent", page.getCourent());
		map.put("rows", page.getRows());
		return sysUserMapper.selectAllUserByName(map);
	}

	@Override
	public int selectAllUserCountByName(String value) {
		return sysUserMapper.selectAllUserCountByName(value);
	}

	
	
	
	@Override
	public List<SysUser> selectAllUserByAdress(Page page, String value) {
		page.setCourent();
		Map<String,Object> map = new HashMap<String,Object>();
		int address = -1;
		try {
			address = Integer.parseInt(value);
		} catch (Exception e) {
			address = -1;
		}
		map.put("address", address);
		map.put("courent", page.getCourent());
		map.put("rows", page.getRows());
		return sysUserMapper.selectAllUserByAdress(map);
	}

	@Override
	public int selectAllUserCountByAdress(String value) {
		int address = -1;
		try {
			address = Integer.parseInt(value);
		} catch (Exception e) {
			address = -1;
		}
		return sysUserMapper.selectAllUserCountByAdress(address);
	}

	
	@Override
	public List<SysUser> selectAllUserByRole(Page page, String value) {
		page.setCourent();
		Map<String,Object> map = new HashMap<String,Object>();
		int role = -1;
		try {
			role = Integer.parseInt(value);
		} catch (Exception e) {
			role = -1;
		}
		map.put("role", role);
		map.put("courent", page.getCourent());
		map.put("rows", page.getRows());
		return sysUserMapper.selectAllUserByRole(map);
	}

	@Override
	public int selectAllUserCountByRole(String value) {
		int role = -1;
		try {
			role = Integer.parseInt(value);
		} catch (Exception e) {
			role = -1;
		}
		return sysUserMapper.selectAllUserCountByRole(role);
	}

	@Override
	public int updatePsd(SysUser user) {
		return sysUserMapper.updatePsd(user);
	}
 
}
