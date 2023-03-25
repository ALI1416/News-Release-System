<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<link href="1.css" type="text/css" rel="stylesheet">
</head>
<script src="js/md5.js" type="text/javascript"></script>
<script>
	function checkForm() {
		var user_name = document.getElementById("user_name");
		var user_pwd = document.getElementById("user_pwd");
		var user_pwd2 = document.getElementById("user_pwd2");
		if (user_name.value == "" | user_pwd.value == "") {
			alert("账号或密码不能为空！");
			return false;
		}
		if (user_pwd.value != user_pwd2.value) {
			alert("密码和确认密码不一致！");
			return false;
		}
		var md5_pwd = document.getElementById("md5_pwd");
		md5_pwd.value = hex_md5(user_pwd.value); //md5加密
		return true;
	}
</script>
<body>
	<h1>注册</h1>
	<form action="doRegister.jsp" onsubmit="return checkForm()">
		<table>
			<tr>
				<td>类型</td>
				<td>
					<input type="radio" name="user_type" value="2" checked>普通用户<input type="radio" name="user_type" value="1">新闻发布者<input type="radio" name="user_type" value="0">管理员
				</td>
			</tr>
			<tr>
				<td>账号</td>
				<td>
					<input type="text" name="user_name" id="user_name" value="">
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td>
					<input type="password" id="user_pwd" value=""><input type="hidden" name="user_pwd" id="md5_pwd" value="">
				</td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td>
					<input type="password" id="user_pwd2" value="">
				</td>
			</tr>
			<tr>
				<td>
					<input type="reset" name="reset" value="清空">
				</td>
				<td>
					<button type="submit">注册</button>
				</td>
			</tr>
		</table>
	</form>
	<a href="login.jsp">返回登录</a>
</body>
</html>
