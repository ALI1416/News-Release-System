<%
  session.invalidate();//结束session 
  response.sendRedirect("index.jsp");
%>