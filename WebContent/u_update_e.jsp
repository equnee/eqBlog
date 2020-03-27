<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*,java.util.Date,com.jspsmart.upload.*"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改个人信息</title>
</head>
<body>

	<%
	// 新建一个SmartUpload对象
	SmartUpload su = new SmartUpload();
	// 上传初始化
	su.initialize(pageContext);
	// 限制每个上传文件的最大长度。
	su.setMaxFileSize(10000000);
	// 限制总上传数据的长度。
	su.setTotalMaxFileSize(20000000);
	// 设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
	
	su.setAllowedFilesList("png,jpg,bmp,gif");
	// 设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
	su.setDeniedFilesList("exe,bat,jsp,htm,html,doc,txt,");
	// 上传文件
	su.upload();
	// 将上传文件全部保存到指定目录
	su.save("upload");
	
	
  
	
 	request.setCharacterEncoding("utf-8");

	String intr=su.getRequest().getParameter("intro");
	String uname=su.getRequest().getParameter("rname");
	String date = su.getRequest().getParameter("dates");
    String photo="upload/"+su.getFiles().getFile(0).getFileName();//获取上传图片的名称

    
    try { 		
	//连接数据库           
	Class.forName("com.mysql.jdbc.Driver");  //加载数据库驱动
	String url = "jdbc:MySQL://localhost:3306/eqblog?&useSSL=false&serverTimezone=UTC"; 
	String username = "root";  //数据库用户名
	String password = "root";  //数据库用户密码       	       	
	Connection conn = DriverManager.getConnection(url,username,password);  //连接数据库
    
	/* 
	测试用:
	out.print(intr);
	out.print(uname);
	out.print(photo);  */
	String sql2="update users set u_introduce=?,u_realname=?,u_photo=?,u_birthday=? where u_name='" + session.getAttribute("username")+"'";
	PreparedStatement stmp=conn.prepareStatement(sql2);
	stmp.setString(1,intr);
	stmp.setString(2,uname);
	stmp.setString(3,photo);
	stmp.setString(4,date);
	
	int n=stmp.executeUpdate();//受影的接结果数            
	if(n>0){
			out.println("<script type='text/javascript'>  alert('修改成功~点击查看'); location.href='u_index.jsp'; </script>");
			} 
	else{ 
			out.println("<script type='text/javascript'>  alert('修改失败，点击确认重新编辑');  location.href='u_update.jsp';</script>");
            } 
	
	if(stmp!=null){
			stmp.close();
			} 
    }
	catch (SQLException e) {
		e.printStackTrace();
	}  
		
	
	%>


</body>
</html>