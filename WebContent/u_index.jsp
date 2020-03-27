<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<%@ include file="logined.jsp"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./vendors/iconfonts/mdi/css/materialdesignicons.min.css">

<style>
a {
	color: #fe7596
}
</style>
<script>
//确认删除操作
function firm() {  
	var msg = "确定删除吗？删了就没啦";  
    //利用对话框返回的值 （true 或者 false）  
	if (confirm(msg)==true){  
        return true;  
    }else{  
    	event.preventDefault()
    }  
}  
</script>
</head>
<body>

	
		<%
		Class.forName("com.mysql.jdbc.Driver"); //加载数据库驱动
		String url = "jdbc:MySQL://localhost:3306/eqblog?username=root&password=root&useSSL=false&serverTimezone=UTC"; //指向数据库table1
		String username = "root"; //数据库用户名
		String password = "root"; //数据库用户密码       	       	
		Connection conn = DriverManager.getConnection(url, username, password); //连接数据库 */
		String selectname = request.getParameter("selectname");
		%>
		

				
				<div id="dg" style="z-index: 9999; position: fixed ! important; left:290px; top: 110px;">
				  <table width="100%" style="position: absolute; width:260px; right: 0px; top: 0px;">
				<button titile="返回上一页" type="button" class="btn btn-gradient-danger btn-icon"  onclick="javascript:history.back(-1)">
                <i class="mdi mdi-keyboard-backspace"></i>
                </button>    
                </table>    
                
                <table width="100%" style="position: absolute; width:260px; right: 0px; top: 0px;">
				<button titile="新建文章" type="button" class="btn btn-gradient-danger btn-icon" onclick="javascript:window.location.href='a_new.jsp'">
                <i class="mdi mdi-plus"></i>
                </button>    
                </table>    
				</div>
				

			
	<div>
		<nav
			class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo"
					href="index.jsp"><img
					src="./image/logo.png" alt="logo"></a> <a
					class="navbar-brand brand-logo-mini"
					href="index.jsp"><img
					src="./后台1_files/logo-mini.svg" alt="logo"></a>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-stretch" align="right">
				<!--搜索框 -->				
				 <div class="search-field d-none d-md-block">
					<form class="d-flex align-items-center h-100"
						action="index.jsp">
						<div class="input-group">
							<div class="input-group-prepend bg-transparent">
								<em class="input-group-text border-0 mdi mdi-panorama-fisheye"></em>
							</div>
							<i type="text" class="form-control bg-transparent border-0"
								placeholder=" ">个人博客列表</i>

						</div>
					</form>
				</div> 
				
				<ul class="navbar-nav navbar-nav-right">
						<li class="nav-item nav-logout d-none d-lg-block">
						<a class="nav-link" href="index.jsp" title="首页">
							<i class="mdi mdi-home"></i></a></li>
	
						<li class="nav-item nav-logout">
						<a class="nav-link" href="a_list.jsp"title="浏览文章">
						<i class="mdi mdi-book-multiple"></i></a></li>
	
	
						<li class="nav-item nav-logout">
						<a class="nav-link" href="u_index.jsp" title="我的账户">					
				        <i class="mdi mdi mdi-account"></i> <%=session.getAttribute("username")%></a></li>
	 				
						<li class="nav-item nav-logout">
						<a class="nav-link" href="logout.jsp" onclick = "document.from.submit()" title="退出">
						<i class="mdi mdi-logout d-none d-lg-block" ></i></a></li>
					
				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid page-body-wrapper">
	
	
          
          
		<div class="main-panel" style="width: 2000px">
			
			
		<!-- <div class="page-header">
            <h3 class="page-title">
              Buttons
            </h3>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">UI Elements</a></li>
                <li class="breadcrumb-item active" aria-current="page">Buttons</li>
              </ol>
            </nav>
          </div> -->
			
			
	
				
			<% try{
				/* conndb.OpenConn();
				conndb.createStmt(); 
				ResultSet rs = conndb.stmtQuery(sql);*/
				String sql = "SELECT * FROM articles where u_name='"+ session.getAttribute("username")+"'";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				
				while (rs.next()){
				int aid=rs.getInt("a_id");   
			%>

			<div class="content-wrapper" style="padding: 1rem ">

				<div class="row" style="padding: 1rem 27rem;">
					<div class="col-12 grid-margin" style="margin-bottom: 1rem;" >
						<div class="card" style="position:relative;left:-50px;top:0px">
							<a class="nav-link"
								href="a_list1.jsp?selectid=<%=rs.getInt("a_id")%>"
								text-decoration:none;>

								<div class="card-body">
									<h2 class="card-title"><%=rs.getString("a_title")%></h2>

									<p class="card-description">
										<%=rs.getString("a_time")%>-
										<%=rs.getString("u_name")%>
									</p>
									<hr />
									<p class="card-description">
										&#12288;
										<%=rs.getString("a_content")%></p>
										


							<form method="post" action="a_delete_my.jsp">
							<!-- 功能区 -->
									<table align="right">
										<tr>
										<!-- <td><a class="nav-link" href="#">
												<button type="button"
													class="btn btn-inverse-danger btn-rounded btn-icon"">
													<i class="mdi mdi-heart-outline"></i>
												</button>
										</a></td>
											<td><a href="#">
													<button type="button"
														class="btn btn-inverse-danger btn-rounded btn-icon"">
														<i class="mdi mdi-comment-text"></i>
													</button>
											</a></td> -->
											<td> <a class="nav-link"  onclick="firm()" > 										
													<button type="submit" titile="删除文章"  name="deleteaid" value="<%=aid%>"
														class="btn btn-inverse-danger btn-rounded btn-icon" href="a_delete_my.jsp?deleteid=<%=aid%>"  onclick = "document.from.submit()">
														<i class="mdi mdi-delete"></i>
													</button>
													
											</a></td></form>
											<td><a  href="a_update.jsp"  titile="编辑文章">
													<button type="button"
														class="btn btn-inverse-danger btn-rounded btn-icon"">
														<i class="mdi mdi-pencil"></i>
													</button>
											</a></td>
										</tr>
										<tr>
										</tr>
									</table>

								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<% } }catch (Exception e) {
	            e.printStackTrace();
	        }
				%>
			
			<!-- content-wrapper ends -->
			
			


		</div>

		

		<!-- main-panel ends -->
	</div>
	
		<!-- 个人简介卡片开始 -->
		<%
		try{
		String sql2 = "SELECT * FROM users where u_name= '"+ session.getAttribute("username")+"'";
		Statement stmt2 = conn.createStatement();
		ResultSet rsu = stmt2.executeQuery(sql2);
		if (rsu.next()) {
		%>
		
				<!-- 白框框 -->	
				<div id="dg3" style="z-index: 9999; position: fixed ! important; right:80px; top:100px;" class="card">
				<div class="col-12 grid-margin">
				<div class="card-body" >
				<ul class="list-star">
				<table width="100%" style="position: absolute; width:100px; right: 0px; top: 0px;">
				<div class="card-title">
				
					<h1 class="card-title">个人信息</h1>
							<hr/>
							<!-- <img src="image/portrait.jpg" class="img-lg rounded-circle mr-3" align="center"> -->
							<img src="<%=rsu.getString("u_photo")%>" style="width:130px; height:130px; border-radius:50%; ">
							
						<table border="0">  	
						<tbody>							
							
							<%-- <tr>
								<td><li></li></td>
								<td><h5 class=" text-danger">文章数量：</h5></td>
								<td><%=rsu.getString("u_introduce")%></td>
							</tr> --%>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">ID：</h5></td>
													<td><%=rsu.getString("u_id")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">用户名：</h5></td>
													<td><%=rsu.getString("u_name")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">真实姓名：</h5></td>
													<td><%=rsu.getString("u_realname")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">生日：</h5></td>
													<td><%=rsu.getString("u_birthday")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">邮箱：</h5></td>
													<td><%=rsu.getString("u_email")%></td>
												</tr>
												
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">个人简介：</h5></td>
													<td><%=rsu.getString("u_introduce")%></td>
												</tr>																					
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">注册时间：</h5></td>
													<td><%=rsu.getString("u_regtime")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">登录时间：</h5></td>
													<td><%=rsu.getString("u_lastlogtime")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">登录IP：</h5></td>
													<td><%=rsu.getString("u_logip")%></td>
												</tr>							
														
							</tbody>							
						</table>	
		
						<%
							 } }catch (Exception e) {
						            e.printStackTrace();
						        }
							%>
				<!--功能区-->
					<table align="right">
					<tr>
						<td><a href="u_update.jsp" title="编辑">
												<button type="button"
													class="btn btn-inverse-danger btn-rounded btn-icon"">
													<i class="mdi mdi-pencil"></i>
												</button>
										</a></td>

						</tr>
						<tr>
						</tr>
					</table>
					<!-- 功能区结束 -->											
				</div>				
			<!-- 白框框 -->	
			</table>
			</ul>
			</div>				
		</div>
		</div>
	<!-- 个人简介卡片结束 -->

</body>
</html>