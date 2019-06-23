<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看新闻</title>
<link href="1.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%
		String user_type = (String) session.getAttribute("user_type");
		String user_name = (String) session.getAttribute("user_name");
		if (user_type != null) {
			/* 已登录 */
			if (user_type.equals("0")) {
	%>
	欢迎您！管理员：<%=user_name%>
	&ensp;
	<a href="newsViewPlus.jsp">编辑模式</a> &ensp;
	<a href="logout.jsp">退出登录</a>
	<%
		} else if (user_type.equals("1")) {
	%>
	欢迎您！新闻发布者：<%=user_name%>
	&ensp;
	<a href="logout.jsp">退出登录</a>
	<%
		} else if (user_type.equals("2")) {
	%>
	欢迎您！普通用户：<%=user_name%>
	&ensp;
	<a href="logout.jsp">退出登录</a>
	<%
		}
		} else {
	%>
	欢迎您！ &ensp;
	<a href="login.jsp">登录</a>&ensp;
	<a href="register.jsp">注册账号</a> 
	<%
		}
	%>
	<h1>查看新闻</h1>
	<%
		int pages;
		//表单值
		if (request.getParameter("pages") != null) {
			pages = Integer.parseInt(request.getParameter("pages"));//第几页
		} else {
			pages = 0;
		}
		//数据库连接
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspbigwork?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "root";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		request.setCharacterEncoding("UTF-8");
		//查询数据
		String sql2 = "select COUNT(*) from news";
		Statement stmt2 = conn.createStatement();
		ResultSet rs2 = stmt2.executeQuery(sql2);
		rs2.next();
		int countPage = rs2.getInt(1);
		String sql = "select news_id,news_time,news_title from news order by news_id desc limit " + pages * 10
				+ ",10";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		//System.out.println(sql);
		try {
			while (rs.next()) {
	%>
	标题：&ensp;
	<a href="newsDetail.jsp?news_id=<%=rs.getInt(1)%>"><%=rs.getString(3)%></a>
	<br>id:<%=rs.getInt(1)%>
	&ensp;发布时间：
	<%=rs.getString(2)%>
	<hr>
	<%
		}
			for (int i = 0; i < countPage; i++, countPage -= 10) {
	%>
	<a href="newsView.jsp?pages=<%=i%>">第<%=i + 1%>页
	</a>&ensp;
	<%
		}
	%>
	<form action="newsView.jsp">
		跳转到<input type="text" size="1" name="pages">页&ensp;<input type="submit" value="确定">
	</form>
	<%
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("抛出异常");
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