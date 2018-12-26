<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>user</title>
<link href="../../static/InsdepUI/insdep.easyui.min.css"
	rel="stylesheet" type="text/css">
<link href="../../static/InsdepUI/icon.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="../../static/InsdepUI/jquery.min.js"></script>
<script type="text/javascript"
	src="../../static/InsdepUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="../../static/InsdepUI/insdep.extend.min.js"></script>
<script type="text/javascript" src="../../static/js/userInfo.js"></script>
<link href="../../static/css/userInfo.css" rel="stylesheet"
	type="text/css">
</head>
<body style="width: 100%; height: 100%">
	<div id="data">
		<form id="userInfoForm" method="post"
			style="padding-left: 5px; padding-top: 10px">
			<table style="font-size: 10px;">
				<tr>
					<td>用户ID:</td>
					<td><input id="dialog_userId" class="easyui-textbox"
						type="text" data-options="readonly:true" name="userId"
						style="width: 200px; height: 32px;" value="${user_session.userId}"></input></td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td><input id="dialog_userName" class="easyui-textbox"
						type="text" data-options="readonly:true" name="userName"
						style="width: 200px; height: 32px;"
						value="${user_session.userName}"></input></td>
				</tr>
				<tr>
					<td>用户编码:</td>
					<td><input id="dialog_userCode" class="easyui-textbox"
						type="text" data-options="readonly:true" name="userCode"
						style="width: 200px; height: 32px;"
						value="${user_session.userCode}"></input></td>
				</tr>
				<tr style="display:none">
					<td id="role" >
						${user_session.userRole}
					</td>
				</tr>
				<tr>
					<td>用户角色:</td>
					<td><input id="dialog_userRole" class="easyui-textbox"
						type="text" data-options="readonly:true" name="nouserRole"
						style="width: 200px; height: 32px;" ></input></td>
				</tr>
				<tr>
					<td>用户单位:</td>
					<td><input id="dialog_userCompany" class="easyui-textbox"
						type="text" name="userCompany" style="width: 200px; height: 32px;"
						value="${user_session.userCompany}"></input></td>
				</tr>
				<tr style="display:none">
					<td id="address" >
						${user_session.userAddress}
					</td>
				</tr>
				<tr>
					<td>用户地址:</td>
					<td>
						<select id="dialog_userAddress" class="easyui-combobox" name="userAddress" editable="false"
								style="width:200px;height:32px;" 
								url="../../sys/user/getCity.json" valueField="id" textField="name"></select>
					</td>
				</tr>
				<tr style="display:none">
					<td id="date" >
						${user_session.userCreateTime}
					</td>
				</tr>
				<tr>
					<td>创建时间:</td>
					<td><input id="dialog_userCreateTime" class="easyui-textbox"
						data-options="readonly:true" type="text" name="nouserCreateTime"
						style="width: 200px; height: 32px;"></input></td>
				</tr>
				<tr>
						<td>
						</td>
						<td>
							<a id="lbtn" href="#" class="easyui-linkbutton" plain="true" style="color:rgb(0,125,220);width:100%;margin-top:15px" onclick="editUser()">修改资料</a>
						</td>
					</tr>
			</table>
		</form>
	</div>
</body>
</html>