<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*,java.sql.*" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
	 int deleteid=Integer.parseInt(request.getParameter("deleteaid"));
	 String DBDriver = "com.mysql.jdbc.Driver";
	 String URL = "jdbc:MySQL://localhost:3306/eqblog?&useSSL=false&serverTimezone=UTC"; 
	 String USER = "root";
	 String PASSWORD = "root";
	Connection conn=DriverManager.getConnection(URL,USER,PASSWORD);//创建数据库连接

	 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);//发送SQL语句给数据库管理系统
	 String sql="delete from articles where a_id="+deleteid;//定义插入SQL语句
	 int result=stmt.executeUpdate(sql);//执行SQL语句
	 if(result!=0){ 
	 response.sendRedirect("u_index.jsp");//执行插入成功跳转
	 }else{
	 response.sendRedirect("u_index.jsp");//执行插入失败跳转
	 } 
    %>
</body>
</html>