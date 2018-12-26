package com.cug.lab.model;

import java.util.Date;

public class SysUser {
	private Integer userId;
	private String userName;
	private String userPsd;
	private Integer userCode;
	private Integer userRole;
	private String userCompany;
	private Integer userAddress;
	private Date userCreateTime;
	
	public String getUserPsd() {
		return userPsd;
	}
	public void setUserPsd(String userPsd) {
		this.userPsd = userPsd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getUserCode() {
		return userCode;
	}
	public void setUserCode(Integer userCode) {
		this.userCode = userCode;
	}
	public Integer getUserRole() {
		return userRole;
	}
	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}
	public String getUserCompany() {
		return userCompany;
	}
	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}
	public Integer getuserAddress() {
		return userAddress;
	}
	public void setuserAddress(Integer userAddress) {
		this.userAddress = userAddress;
	}
	public Date getUserCreateTime() {
		return userCreateTime;
	}
	public void setUserCreateTime(Date userCreateTime) {
		this.userCreateTime = userCreateTime;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public SysUser( String userName, String userPsd, Integer userCode, Integer userRole,
			String userCompany, Integer userAddress, Date userCreateTime) {
		this.userName = userName;
		this.userPsd = userPsd;
		this.userCode = userCode;
		this.userRole = userRole;
		this.userCompany = userCompany;
		this.userAddress = userAddress;
		this.userCreateTime = userCreateTime;
	}
	@Override
	public String toString() {
		return "{userId=" + userId + ", userName=" + userName + ", userPsd=" + userPsd + ", userCode="
				+ userCode + ", userRole=" + userRole + ", userCompany=" + userCompany + ", userAddress=" + userAddress
				+ ", userCreateTime=" + userCreateTime + "}";
	}
	public SysUser() {
	}
}
