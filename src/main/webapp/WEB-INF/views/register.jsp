<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>user</title>
<link href="static/InsdepUI/insdep.easyui.min.css" rel="stylesheet" type="text/css">
<link href="static/InsdepUI/icon.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="static/InsdepUI/jquery.min.js"></script>
<script type="text/javascript" src="static/InsdepUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/InsdepUI/insdep.extend.min.js"></script>
<script type="text/javascript" src="static/js/register.js"></script>
<link href="static/css/register.css" rel="stylesheet" type="text/css">
</head>
<body style="width: 100%; height: 100%">
	<div id="data">
		<form id="userInfoForm" method="post"
			style="padding-left: 5px; padding-top: 10px">
			<table style="font-size: 10px;">
				<tr>
					<td colspan="2" style="font-size:20px;font-weight:800;text-align:center;">
						<span style="color:rgb(0,125,220);margin-bottom:10px">用户注册</span>
					</td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td><input id="userName" data-options="required:true" class="easyui-textbox"
						type="text"  name="userName" 
						style="width: 200px; height: 32px;"></input></td>
				</tr>
				<tr>
					<td>用户密码:</td>
					<td><input id="userPsd" data-options="required:true" class="easyui-textbox"
						type="password"  name="userPsd" 
						style="width: 200px; height: 32px;"></input></td>
				</tr>
				<tr>
					<td>重复密码:</td>
					<td><input id="reuserPsd" data-options="required:true" class="easyui-textbox"
						type="password"  name="reuserPsd" 
						style="width: 200px; height: 32px;"></input></td>
				</tr>
				<tr>
					<td>用户角色:</td>
					<td>
						<select id="userRole" class="easyui-combobox" name="userRole" style="width:200px;height:32px;"   editable="false">
							<option value="1">普通用户</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>用户单位:</td>
					<td><input id="userCompany" data-options="required:true"  class="easyui-textbox" 
						type="text" name="userCompany" style="width: 200px; height: 32px;"></input></td>
				</tr>
				<tr>
					<td>用户地址:</td>
					<td>
						<select id="userAddress" class="easyui-combobox" name="userAddress" editable="false"
								style="width:200px;height:32px;" 
								url="sys/user/getCity.json" valueField="id" textField="name"></select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align:center">
						<a id="lbtn" href="#" class="easyui-linkbutton" plain="true" 
							style="color:rgb(0,125,220);width:100%;margin-top:15px" onclick="register()">用户注册</a>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<a href="login.page" style="float:right;margin-top:15px;font-weight:800">返回登录</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>