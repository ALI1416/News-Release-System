<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String news_title = "";
	String news_context = "";
	//表单值
	String news_id = request.getParameter("news_id");
	//数据库连接
	String driverName = "com.mysql.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/jspbigwork?useUnicode=true&characterEncoding=UTF-8";
	String username = "root";
	String password = "root";
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(dbURL, username, password);
	//插入数据
	String sql = "select news_title,news_context from news where news_id=" + news_id;
	PreparedStatement stmt = conn.prepareStatement(sql);
	request.setCharacterEncoding("UTF-8");
	ResultSet rs = stmt.executeQuery(sql);
	try {
		rs.next();
		news_title = rs.getString(1);
		news_context = rs.getString(2);
	} catch (Exception e) {
		//e.printStackTrace();
		//System.out.println("抛出异常");
%>
<h1>不存在该新闻</h1>
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
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改新闻</title>
<link href="1.css" type="text/css" rel="stylesheet">
</head>
<script src="js/md5.js" type="text/javascript"></script>
<script>
	function checkForm() {
		var news_title = document.getElementById("news_title");
		var news_context = document.getElementById("news_context");
		if (news_title.value == "" | news_context.value == "") {
			alert("标题或内容不能为空！");
			return false;
		} else {
			return true;
		}
	}
</script>
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
		} else {
				response.sendRedirect("error.jsp");
			}
		} else {
			/* 未登录 */
			response.sendRedirect("error.jsp");
		}
	%>
	<h1>修改新闻</h1>
	<form action="doNewsChange.jsp" onsubmit="return checkForm()">
		<input type="hidden" name="news_id" id="news_id" value="<%=news_id%>">
		<table>
			<tr>
				<td>标题</td>
				<td>
					<input type="text" name="news_title" id="news_title" value="<%=news_title%>">
				</td>
			</tr>
			<tr>
				<td>内容</td>
				<td>
					<textarea name="news_context" cols="50" rows="20" id="news_context"><%=news_context%></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="reset" name="reset" value="还原">
				</td>
				<td>
					<button type="submit">修改</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
