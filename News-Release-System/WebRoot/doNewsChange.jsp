<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="1.css" type="text/css" rel="stylesheet">
<title>修改处理页面</title>
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
	<a href="logout.jsp">退出登录</a>
	<%
		} else if (user_type.equals("1")) {
	%>
	欢迎您！新闻发布者：<%=user_name%>
	&ensp;
	<a href="logout.jsp">退出登录</a>
	<%
		}
		} else {
			/* 未登录 */
			response.sendRedirect("error.jsp");
		}
	%>
	<%
		//表单值
		String news_id = request.getParameter("news_id");
		String news_title = request.getParameter("news_title");
		String news_context = request.getParameter("news_context");
		//System.out.println("login" + news_title + " " + news_context);
		//数据库连接
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspbigwork?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "root";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		//插入数据
		String sql = "update news set news_title='" + news_title + "',news_context='" + news_context
				+ "' where news_id=" + news_id;
		//update news set news_title='222',news_context='222' where news_id=1
		PreparedStatement stmt = conn.prepareStatement(sql);
		request.setCharacterEncoding("UTF-8");
		try {
			int n = stmt.executeUpdate();
			if (n == 1) {
				//System.out.println("成功");
	%>
	<h1>修改</h1>
	标题：<%=news_title%><br> 内容：<%=news_context%><br>
	<a href="newsView.jsp">查看新闻</a>
	<%
		} else {
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