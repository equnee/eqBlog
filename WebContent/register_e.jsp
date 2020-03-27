<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*,java.util.Date" %>
<%@ page import="java.sql.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册判断</title>
</head>
<body>
 	<%//获取用户提交表单数据
	request.setCharacterEncoding("utf-8");
	
	String email=request.getParameter("mail");
	String user=request.getParameter("username");
	String pass=request.getParameter("pwd1");
	String photo=request.getParameter("pho");
	
	String ip = request.getRemoteAddr();
	Date date = new Date();
	String regtime=date.toLocaleString();
	/* out.println(photo); */
 	%>
	
	 <%!//声明链接数据库所需参数
	String DBDriver = "com.mysql.jdbc.Driver";
	String URL = "jdbc:MySQL://localhost:3306/eqblog?&useSSL=false&serverTimezone=UTC"; 
	String USER = "root";
	String PASSWORD = "root";
	Connection conn = null;
	PreparedStatement stmp = null;
	PreparedStatement stmp2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;

	String sqlname="select * from users where u_name=?";
	String sqlmail="select * from users where u_email=?";
	String sqladd="insert into users(u_name,u_password,u_regtime,u_email,u_lastlogtime,u_logip,u_photo)values(?,?,?,?,?,?,?)";

	%>
	
	
	<%  //链接数据库查询是否可正常注册并完成注册
    	try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);//连接数据库
            
            stmp = conn.prepareStatement(sqlname);
            stmp.setString(1,user);
            rs = stmp.executeQuery();

            stmp2 = conn.prepareStatement(sqlmail);
            stmp2.setString(1,email);
            rs2 = stmp2.executeQuery();

        if (rs.next()){
        	out.println("<script language='javascript'>alert('用户名已被注册 换一个把~');location.href='register.jsp';</script>");
        }
        else if (rs2.next()){
        	out.println("<script language='javascript'>alert('邮箱已被注册 换一个把~');location.href='register.jsp';</script>");
        }
        else {
        	stmp = conn.prepareStatement(sqladd);
    		stmp.setString(1,user);
    		stmp.setString(2,pass);
    		stmp.setString(3,regtime);
    		stmp.setString(4,email);
    		stmp.setString(5,regtime);
    		stmp.setString(6,ip);
    		stmp.setString(7,photo);
    		
    		int n=stmp.executeUpdate();//受影的接结果数            
            if (n != 0){ 
				out.println("<script language='javascript'>alert('注册成功啦！前往登录');location.href='login.html';</script>");                		
            }
            else{  
                  out.println("<script language='javascript'>alert('注册失败啦，返回重试');location.href='register.jsp';</script>");    
            }  
        }
 
    
	 } catch (Exception e) {
         e.printStackTrace();
     }
	%> 
 
 
</body>
</html>