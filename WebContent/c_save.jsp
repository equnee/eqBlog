<%@ page language="java" import="java.util.Date,java.sql.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>评论图书</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");	
		int id = Integer.parseInt(request.getParameter("aid"));
		String user = request.getParameter("name");
		String comment = request.getParameter("com");
		String ip = request.getRemoteAddr();
		Date date = new Date();
		String commentDate = date.toLocaleString();
		
		int selectid = id;
		/*   
		  out.println(id);
		  out.println(user);
		  out.println(comment); */

		//连接数据库          
		Class.forName("com.mysql.jdbc.Driver"); //加载数据库驱动
		String url = "jdbc:MySQL://localhost:3306/eqblog?useSSL=false&serverTimezone=UTC"; //指向数据库table1
		String username = "root"; //数据库用户名
		String password = "root"; //数据库用户密码       	       	
		Connection conn = DriverManager.getConnection(url, username, password); //连接数据库
		
		String commentsql = "insert into comment(a_id,c_usr,c_com,c_time,c_ip) values(?,?,?,?,?)";
		out.println(commentsql);
		PreparedStatement pstmt = conn.prepareStatement(commentsql);
		pstmt.setInt(1, id);
		pstmt.setString(2, user);
		pstmt.setString(3, comment);
		pstmt.setString(4, commentDate);
		pstmt.setString(5, ip);
		int result = pstmt.executeUpdate();
		if (result != 0) {
		 out.println("<script type='text/javascript'>alert('评论成功前往查看~');</script>");		 
		 out.println("<script type='text/javascript'> window.history.back(-2);  </script>"); 
		
		} else {
			response.sendRedirect("a_list.jsp");
		}
	%>
</body>
</html>
