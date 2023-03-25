<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发布新闻</title>
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
		}
		} else {
			/* 未登录 */
			response.sendRedirect("error.jsp");
		}
	%>
	<h1>发布新闻</h1>
	<form action="doNewsRelease.jsp" onsubmit="return checkForm()">
		<table>
			<tr>
				<td>标题</td>
				<td>
					<input type="text" name="news_title" id="news_title">
				</td>
			</tr>
			<tr>
				<td>内容</td>
				<td>
					<textarea name="news_context" cols="50" rows="20" id="news_context"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="reset" name="reset" value="清空">
				</td>
				<td>
					<button type="submit">发布</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
