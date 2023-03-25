<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看新闻</title>
<link href="1.css" type="text/css" rel="stylesheet">
</head>
<body>
	<h1>新闻详情</h1>
	<%
		//表单值
		String news_id = request.getParameter("news_id");
		//数据库连接
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspbigwork?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "root";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		//查询数据
		String sql = "select news_title,news_time,news_context from news where news_id=" + news_id;
		Statement stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		ResultSet rs = stmt.executeQuery(sql);
		try {
			rs.next();
	%>
	发布时间：<%=rs.getString(2)%><br>标题：<%=rs.getString(1)%><br>内容：<%=rs.getString(3)%><br>
	<a href="javascript:history.back(-1)">返回上一页</a>
	<%
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("抛出异常");
	%>
	<h1>页面不存在</h1>
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