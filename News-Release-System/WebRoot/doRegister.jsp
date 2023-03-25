<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="1.css" type="text/css" rel="stylesheet">
<title>注册处理页面</title>
</head>
<body>
	<%
		//表单值
		String user_type = request.getParameter("user_type");
		String user_name = request.getParameter("user_name");
		String user_pwd = request.getParameter("user_pwd");
		//System.out.println("reg" + user_type + " " + user_name + " " + user_pwd);
		//数据库连接
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspbigwork?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "root";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		//插入数据
		String sql = "insert into user(user_type,user_name,user_pwd)values(" + user_type + ",'" + user_name + "','"
				+ user_pwd + "')";
		PreparedStatement stmt = conn.prepareStatement(sql);
		request.setCharacterEncoding("UTF-8");
		try {
			int n = stmt.executeUpdate();
			if (n == 1) {
				//System.out.println("注册成功");
	%>
	<h1>注册成功</h1>
	类型：<%=user_type%><br> 账号：<%=user_name%><br> 密码：<%=user_pwd%><br>
	<a href="login.jsp">返回登录页面</a>
	<%
		} else {
				//System.out.println("注册失败");
			}
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("注册失败,账号已存在");
	%>
	<h1>注册失败</h1>
	账号已存在
	<br>
	<a href="javascript:history.back(-1)">返回上一页</a>
	<%
		//关闭数据库连接
		} finally {
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	%>
</body>
</html>