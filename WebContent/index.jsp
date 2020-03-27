<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Peach-Blog</title>
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



</script>
</head>
<body onload="reurl()">
	<div id="dg"
		style="z-index: 9999; position: fixed ! important; left: 500px; top: 300px;">
		<table width="100%"
			style="position: absolute; width: 260px; right: 0px; top: 0px;">
			<p class="text-white">
				<font size="20rem">Peach-Blog</font>
				<p class="text-white">welcome to Peach-Blog~</p>
			</p>

		</table>
	</div>

	<%-- <%	int selectid = Integer.parseInt(request.getParameter("selectid"));
		Class.forName("com.mysql.jdbc.Driver"); //加载数据库驱动
		String url = "jdbc:MySQL://localhost:3306/eqblog?username=root&password=root&useSSL=false&serverTimezone=UTC"; //指向数据库table1
		String username = "root"; //数据库用户名
		String password = "root"; //数据库用户密码       	       	
		Connection conn = DriverManager.getConnection(url, username, password); //连接数据库 */
	%> --%>
	<div>
		<nav
			class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo"
					href="index.jsp"> <img
					src="./image/logo.png" alt="logo"></a>
					 <a
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
						class="nav-link" href="index.jsp" title="首页"> <i
							class="mdi mdi-home"></i></a></li>

					<li class="nav-item nav-logout"><a class="nav-link"
						href="a_list.jsp" title="浏览文章"> <i
							class="mdi mdi-book-multiple"></i></a></li>


					<li class="nav-item nav-logout"><a class="nav-link"
						href="u_index.jsp" title="我的账户"> <i
							class="mdi mdi mdi-account"></i> <%=session.getAttribute("username")%></a></li>

					<li class="nav-item nav-logout"><a class="nav-link"
						href="logout.jsp" title="退出"> <i
							class="mdi mdi-logout d-none d-lg-block"></i></a></li>

				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid page-body-wrapper">
		<div class="main-panel" style="width: 2000px">
			<div class="content-wrapper">

				<div class="row" style="padding: 1rem 10rem">
					<div class="col-12 grid-margin" style="margin-bottom: 1rem">
						<div class="card">


							<div class="card-body">
								<img src="image/background.jpg" width="1000px" height="800px">
							</div>



						</div>

					</div>

				</div>









			</div>
		</div>
	</div>
	</div>
	-->
	<!-- 评论区结束 -->

	</div>
	</div>



	<!-- main-panel ends -->
	</div>

</body>
</html>