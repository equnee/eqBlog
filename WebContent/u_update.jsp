<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<%@ include file="logined.jsp"%>

<!DOCTYPE html>
<html  ng-app="app">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="datetime/css/wui.min.css">
 <link rel="stylesheet" type="text/css" href="datetime/css/style.css"> 
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="./vendors/iconfonts/mdi/css/materialdesignicons.min.css">



<script type="text/javascript" src="datetime/js/jquery.min.js"></script>
<script type="text/javascript" src="datetime/js/angular.min.js"></script>
<script type="text/javascript" src="datetime/js/wui-date.js" charset="utf-8"></script>



	<script>
	var app = angular.module('app',["wui.date"]);
</script>
	
	
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
					<li class="nav-item nav-logout d-none d-lg-block"><a
						class="nav-link" href="index.jsp" title="首页"> <i class="mdi mdi-home"></i></a></li>

					<li class="nav-item nav-logout"><a class="nav-link"
						href="a_list.jsp" title="浏览文章"> <i
							class="mdi mdi-book-multiple"></i></a></li>


					<li class="nav-item nav-logout"><a class="nav-link" href="u_index.jsp"
						title="我的账户"> <i class="mdi mdi mdi-account"></i> <%=session.getAttribute("username")%></a></li>

					<li class="nav-item nav-logout"><a class="nav-link" href="logout.jsp"
						title="退出"> <i class="mdi mdi-logout d-none d-lg-block"></i></a></li>

				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid page-body-wrapper">
		<div class="main-panel" style="width: 2000px">



			<!-- ----- -->
			<%
				String sql = "SELECT * FROM users where u_name='" + session.getAttribute("username") + "'";
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
								<div>
									<!-- -------修改个人信息开始----- -->
								<FORM METHOD=POST ACTION="u_update_e.jsp" ENCTYPE="multipart/form-data">
									<h1 class="card-title">修改个人信息</h1>
									<hr />

									<div class="row">

										<div class="col-md-12">

											<p align="center">
												头像：<img src="<%=rs.getString("u_photo")%>" style="width:130px; height:130px; border-radius:50%; ">
											</p>
											<div class="form-group">
												<label>修改头像</label> <input type="file" name="photo"
													size="15" class="form-control file-upload-info">
											</div>
											
											<div class="form-group">
												<label>真实姓名</label> <input type="text" class="form-control" name="rname"
													value="<%=rs.getString("u_realname")%>">
											</div>
											<!-- <div class="form-group">
											<br/>
												<label>修改密码</label> 
												<input type="password" class="form-control" name="rname" placeholder="原密码">
											<input type="password" class="form-control" name="rname" placeholder="新密码">
											<input type="password" class="form-control" name="rname" placeholder="确认密码">
											</div> -->
											<div class="form-group">
												<label>出生日期</label> 
												<div class="wui-area">
		
											<wui-date 
												name=dates
												format="yyyy-mm-dd" 
												placeholder="请选择或输入日期" 
												id="date1" 
												btns="{'ok':'确定','now':'此刻'}" 
												ng-model="date1">
											</wui-date></div></div>
											
										<div class="form-group">
												<label>个人简介</label>
												<input type="text" class="form-control" name="intro"
													value="<%=rs.getString("u_introduce")%>"></div>


<!-- 
											<div class="form-group">
												<label>行业</label> <input type="text" class="form-control"
													placeholder="Username" aria-label="Username">
											</div>
 -->








											

										</div>
									</div>
								</div>
								
								
								<script type='text/javascript'> var intro=document.getElementById("intr").value;</script>
								
								<!-- -------修改个人信息结束----- -->

								<table align="right">
									<tr>
										<!-- 	<td><a class="nav-link" href="#">
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
										<td><a href="u_update_e.jsp"
											onclick="document.from.submit()" title="保存">
												<button type="submit"
													class="btn btn-inverse-danger btn-rounded btn-icon"">
													<i class="mdi mdi-content-save"></i>
													</form>
													
												</button>
										</a></td>
									</tr>
									<tr>
									</tr>
								</table>
								<%
												}
											%>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	var app = angular.module('app',["wui.date"]);
</script>
	
</body>
</html>