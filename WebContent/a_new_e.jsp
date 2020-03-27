<%@ page language="java" contentType="text/html; charset=UTF-8" 
	import="java.util.*,java.sql.*,java.util.Date,com.jspsmart.upload.*,com.db.ConnDB,java.sql.PreparedStatement"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发表新文章</title>
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

	String title=su.getRequest().getParameter("tit");
	String contents=su.getRequest().getParameter("customized-buttonpane");
			/* getInputStream("customized-buttonpane"); */
	int visible=Integer.parseInt(su.getRequest().getParameter("visi"));
	int type=Integer.parseInt(su.getRequest().getParameter("typ"));
	String IP = request.getRemoteAddr();
	Date date = new Date();
    String editDate=date.toLocaleString();
    String name =su.getRequest().getParameter("name");
    String photo="upload/"+su.getFiles().getFile(0).getFileName();//获取上传图片的名称
    
/*     su.getRequest().getParameter("photo");
    String photon=new String(su.getRequest().getParameter("photo").getBytes(),"UTF-8"); */
    
    
    try { 		
	//连接数据库           
	 Class.forName("com.mysql.jdbc.Driver");  //加载数据库驱动
	String url = "jdbc:MySQL://localhost:3306/eqblog?&useSSL=false&serverTimezone=UTC"; 
	String username = "root";  //数据库用户名
	String password = "root";  //数据库用户密码       	       	
	Connection conn = DriverManager.getConnection(url,username,password);  //连接数据库 */
	/* ConnDB conndb=new ConnDB();
	conndb.OpenConn() */;     
	String sql="insert into articles(a_title,a_content,a_visible,t_id,a_time,a_photo,u_name)values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,title);
	pstmt.setString(2,contents);
	pstmt.setInt(3,visible);
   	pstmt.setInt(4,type);
	pstmt.setString(5,editDate);
	pstmt.setString(6,photo);
	pstmt.setString(7,name);
	
	int n=pstmt.executeUpdate();//受影的接结果数            
	if(n>0){
			out.println("<script type='text/javascript'>  alert('发表文章成功啰^^~点击确认前往查看'); location.href='a_list.jsp'; </script>");
			} 
	else{ 
			out.println("<script type='text/javascript'>  alert('发表文章失败qwq，点击确认重新编辑');  location.href='a_new.jsp';</script>");
            }
	
	if(pstmt!=null){
			pstmt.close();
			}
    }
	catch (SQLException e) {
		e.printStackTrace();
	} 

	%>


</body>
</html>