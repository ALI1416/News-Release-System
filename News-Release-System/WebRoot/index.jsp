<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String user_type = (String) session.getAttribute("user_type");
	String user_name = (String) session.getAttribute("user_name");
	if (user_type != null) {
		/* 已登录 */
		if (user_type.equals("0") || (user_type.equals("1"))) {
			response.sendRedirect("newsViewPlus.jsp");
		} else {
			response.sendRedirect("newsView.jsp");
		}
	} else {
		response.sendRedirect("newsView.jsp");
	}
%>

