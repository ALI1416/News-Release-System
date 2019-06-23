<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="1.css" type="text/css" rel="stylesheet">
<title>修改密码处理页面</title>
</head>
<body>
	<%
		//表单值
		String user_type = request.getParameter("user_type");
		String user_name = request.getParameter("user_name");
		String user_pwd = request.getParameter("user_pwd");
		String user_pwd2 = request.getParameter("user_pwd2");
		//System.out.println("change" + user_type + " " + user_name + " " + user_pwd + " " + user_pwd2);
		//数据库连接
		String driverName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspbigwork?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "root";
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		//查询数据
		String sql = "select user_id from user where user_type=" + user_type + " and user_name='" + user_name
				+ "' and user_pwd='" + user_pwd + "'";
		Statement stmt = conn.createStatement();
		request.setCharacterEncoding("UTF-8");
		ResultSet rs = stmt.executeQuery(sql);
		try {
			rs.next();
			//System.out.println("id:" + rs.getInt(1));
			//账号密码正确
			if (rs.getInt(1) != 0) {
				//System.out.println("登录成功");
				//修改密码
				String sql2 = "update user set user_pwd='" + user_pwd2 + "' where user_id=" + rs.getInt(1);
				//	UPDATE `user` SET `user_type`='0' WHERE (`user_id`='6')
				PreparedStatement stmt2 = conn.prepareStatement(sql2);
				try {
					int n = stmt2.executeUpdate();
					if (n == 1) {
						//System.out.println("修改成功");
	%>
	<h1>修改成功</h1>
	类型：<%=user_type%><br> 账号：<%=user_name%><br> 密码：<%=user_pwd2%><br>
	<a href="login.jsp">返回登录页面</a>
	<%
		} else {
					}
				} catch (Exception e) {
					//e.printStackTrace();
					//System.out.println("抛出异常");
				}
			} else {
			}
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("账号或密码错误");
	%>
	<h1>账号或密码错误</h1>
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