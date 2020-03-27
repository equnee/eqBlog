<%@ page language="java" import="java.util.*,java.sql.*,java.util.Date" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登陆验证</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
 	<%//获取用户提交表单数据
    request.setCharacterEncoding("UTF-8");
    String name=request.getParameter("username");
    String pwd=request.getParameter("pawd");    
	 String logip = request.getRemoteAddr();   
	Date date = new Date();
    String logtime=date.toLocaleString(); 
    

    %>
    
    
     <%!//声明链接数据库所需参数
    
    String DBDriver = "com.mysql.jdbc.Driver";
    String URL = "jdbc:MySQL://localhost:3306/eqblog?&useSSL=false&serverTimezone=UTC"; 
    String USER = "root";
    String PASSWORD = "root";
    String sql = "SELECT * FROM users WHERE u_name = ?";
   	/*  String sql2="insert into users(u_lastlogtime,u_logip)values(?,?)"; */
    Connection conn = null;
    PreparedStatement pstt = null;
    PreparedStatement stmp = null;
	 /* PreparedStatement pstm = null;*/    
	ResultSet rs = null;
	 
    %>

   
    <%  //链接数据库根据用户名查询密码 是否匹配 并进行重定向跳转
    	try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            pstt = conn.prepareStatement(sql);
            pstt.setString(1,name);
            rs = pstt.executeQuery();
         	 if (rs.next()) {
            	
            	if((name.equals("e"))&&pwd.equals("123")){
                	out.println("<script type='text/javascript'>alert('欢迎您，管理员!');  location.href='manage.jsp'; </script>");
                	session.setAttribute("username",name);
                }
            	
           			 else if (rs.getString("u_password").equals(pwd)) {                 
				 /* pstm = conn.prepareStatement(sql2);
   		         pstm.setString(1,logtime);	
   		 		 pstm.setString(2,logip); */
   		         session.setAttribute("username",name); //设置session值
   		      
   		        String sql2="update users set u_lastlogtime=?,u_logip=? where u_name='" + name +"'";
   		        stmp=conn.prepareStatement(sql2);
	        	stmp.setString(1,logtime);
	         	stmp.setString(2,logip);
	         	
		         out.println("<script type='text/javascript'>alert('成啦，冲！'); location.href='index.jsp';</script>");  
		         
                } else {                    
                 out.println("<script type='text/javascript'> alert('密码输错啦，返回重试'); location.href='login.html'; </script>");
                }
            }
           
            else{
            	 out.println("<script type='text/javascript'>alert('该账号还没有注册喔');  location.href='login.html'; </script>");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    %> 
</body>
</html>
