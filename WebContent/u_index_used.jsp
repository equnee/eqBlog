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
<link rel="stylesheet"
	href="./vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<!--   <link rel="stylesheet" href="./vendors/iconfonts/mdi/css/materialdesignicons.css">
  <link rel="stylesheet" href="./vendors/css/vendor.bundle.base.css"> -->
<style>
a {
	color: #fe7596
}
</style>
</head>
<body>
	<%
		/* String user=session.getAttribute("username");  */

		Class.forName("com.mysql.jdbc.Driver"); //加载数据库驱动
		String url = "jdbc:MySQL://localhost:3306/eqblog?username=root&password=root&useSSL=false&serverTimezone=UTC"; //指向数据库table1
		String username = "root"; //数据库用户名
		String password = "root"; //数据库用户密码       	       	
		Connection conn = DriverManager.getConnection(url, username, password); //连接数据库 */
	%>
	<div id="dg"
		style="z-index: 9999; position: fixed ! important; left: 390px; top: 110px;">
		<table width="100% "
			style="position: absolute; width: 260px; right: 0px; top: 0px;">
			<button titile="返回上一页" type="button"
				class="btn btn-gradient-danger btn-icon" name="Submit"
				onclick="javascript:history.back(-1)">
				<i class="mdi mdi-keyboard-backspace"></i>
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
			<div class="navbar-menu-wrapper d-flex align-items-stretch">
				<!-- <div class="search-field d-none d-md-block">
					<form class="d-flex align-items-center h-100"
						action="index.jsp">
						<div class="input-group">
							<div class="input-group-prepend bg-transparent">
								<em class="input-group-text border-0 mdi mdi-magnify"></em>
							</div>
							<input type="text" class="form-control bg-transparent border-0"
								placeholder="search">

						</div>
					</form>
				</div> -->
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
						<a class="nav-link" href="logout.jsp" title="退出">
						<i class="mdi mdi-logout d-none d-lg-block"></i></a></li>
						
				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid page-body-wrapper">
		<div class="main-panel" style="width: 2000px">



			<!-- ----- -->
			<%
				String sql = "SELECT * FROM users where u_name='" + session.getAttribute("username")+"'";
				/* out.println(sql); */
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) { 
			%>

			 <div class="content-wrapper" style="padding: 1rem">

				<div class="row" style="padding: 1rem 27rem">
					<div class="col-12 grid-margin" style="margin-bottom: 1rem">
						<div class="card">
							<div class="card-body">
								<!-- -------个人介绍内容开始----- -->
							
							<h1 class="card-title">个人信息</h1>
									<hr/>
									
									<div class="row">
								
								<div class="col-md-8">
									
									<ul class="list-star">
										<div>

											<table border="0">
												<tbody>
												<tr><td>
												
												</td></tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">ID：</h5></td>
													<td><%=rs.getString("u_id")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">用户名：</h5></td>
													<td><%=rs.getString("u_name")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">真实姓名：</h5></td>
													<td><%=rs.getString("u_realname")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">邮箱：</h5></td>
													<td><%=rs.getString("u_email")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">个人简介：</h5></td>
													<td><%=rs.getString("u_introduce")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">注册时间：</h5></td>
													<td><%=rs.getString("u_regtime")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">登录时间：</h5></td>
													<td><%=rs.getString("u_lastlogtime")%></td>
												</tr>
												<tr>
													<td><li></li></td>
													<td><h5 class=" text-danger">登录IP：</h5></td>
													<td><%=rs.getString("u_logip")%></td>
												</tr>
												</tbody></table>
									<%
									}
								%>

									</div></ul>
									</div>
							<!-- 头像框 -->		
							<div class="col-md-4">
							<table border="0" align="center">
								<tbody>
								<tr><td><br></td></tr>
								<tr>
									<td aligh="left"><img src="<%=rs.getString("u_photo")%>" style="width:130px; height:130px; border-radius:50%; "></td>
								</tr>
								<tr><td><br></td></tr>
								</tbody>    
							</table>
							</div>
							<!-- 头像框↑ -->	
						
						</div>
								 
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
										</a></td>
										<td><a class="nav-link" href="#">
												<button type="button"
													class="btn btn-inverse-danger btn-rounded btn-icon"">
													<i class="mdi mdi-delete"></i>
												</button>
										</a></td> -->
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
</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>