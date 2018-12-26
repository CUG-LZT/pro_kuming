<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>user</title>
<link href="../../static/InsdepUI/insdep.easyui.min.css"rel="stylesheet" type="text/css">
<link href="../../static/InsdepUI/icon.css" rel="stylesheet"type="text/css">
<link href="../../static/css/psd.css" rel="stylesheet"type="text/css">
<script type="text/javascript" src="../../static/InsdepUI/jquery.min.js"></script>
<script type="text/javascript" src="../../static/InsdepUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/InsdepUI/insdep.extend.min.js"></script>
<script type="text/javascript" src="../../static/js/psd.js"></script>
</head>
<body style="width: 100%; height: 100%">
	<div id="data" >
			<form id="changePsd" method="post"
				style="padding-left: 5px; padding-top: 10px">
				<table id="changePsdtable" style="font-size: 10px;">
					<tr>
						<td>用户名:</td>
						<td><input id="hideuserName"
							data-options="readonly:true" class="easyui-textbox" type="text"
							name="userName" style="width: 200px; height: 32px;" value="${user_session.userName}"></input></td>
					</tr>
					
					<tr>
						<td>旧密码:</td>
						<td><input id="odd_userPsd"
							data-options="required:true" class="easyui-textbox" type="password"
							name="userPsd" style="width: 200px; height: 32px;"></input></td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><input id="userPsd" type="password"
							data-options="required:true" class="easyui-validatebox" 
							name="newUserPsd" style="width: 200px; height: 32px;"></input></td>
					</tr>
					<tr>
						<td>重复密码:</td>
						<td><input id="renew_userPsd" type="password"
							required="required"  class="easyui-validatebox" validType="equals['#userPsd']" 
							name="reNewUserPsd" style="width: 200px; height: 32px;"></input></td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<a id="lbtn" href="#" class="easyui-linkbutton" plain="true" style="color:rgb(0,125,220);width:100%;margin-top:15px" onclick="changePsd()">重置密码</a>
						</td>
					</tr>
				</table>
			</form>
	</div>
</body>
</html>

