<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="1.css" type="text/css" rel="stylesheet">
<title>登录处理页面</title>
</head>
<body>
	<%
		//表单值
		String user_type = request.getParameter("user_type");
		String user_name = request.getParameter("user_name");
		String user_pwd = request.getParameter("user_pwd");
		//System.out.println("login" + user_type + " " + user_name + " " + user_pwd);
		//数据库连接
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspbigwork?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "root";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		//查询数据
		String sql = "select count(*) from user where user_type=" + user_type + " and user_name='" + user_name
				+ "' and user_pwd='" + user_pwd + "'";
		//String sql = "select * from user where user_type=1 and user_name='1' and user_pwd='1'";
		Statement stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		ResultSet rs = stmt.executeQuery(sql);
		try {
			rs.next();
			if (rs.getInt(1) == 1) {
				//设置登录状态
				session.setAttribute("user_type", user_type);
				session.setAttribute("user_name", user_name);
	%>
	<h1>登录成功</h1>
	<a href="index.jsp">进入主页</a>
	<%
		} else {
	%>
	<h1>账号不存在或密码错误</h1>
	<a href="javascript:history.back(-1)">返回上一页</a>
	<%
		}
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("抛出异常");
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