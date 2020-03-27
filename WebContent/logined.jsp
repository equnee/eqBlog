<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
    <base href="<%=basePath%>">    
    <title>eqBlog</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 	</head>
  
  	<body>
  		<%
		if (session.getAttribute("username") ==null||session.getAttribute("username")==""){	
		response.sendRedirect("login.html"); 
		 /* <jsp:forward page="login.jsp"></jsp:forward> */
		 }
		
		
 	%>
 	</body>
</html>
