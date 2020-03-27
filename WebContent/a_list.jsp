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
	color: #fe7596;

}
a:hover{
	text-decoration: none;
	}
</style>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver"); //加载数据库驱动
		String url = "jdbc:MySQL://localhost:3306/eqblog?username=root&password=root&useSSL=false&serverTimezone=UTC"; //指向数据库table1
		String username = "root"; //数据库用户名
		String password = "root"; //数据库用户密码       	       	
		Connection conn = DriverManager.getConnection(url, username, password); //连接数据库 */
	%>
		
				
				<div id="dg" style="z-index: 9999; position: fixed ! important; left:350px; top: 110px;">
				<table width="100%" style="position: absolute; width:260px; right: 0px; top: 0px;">
				<a href="index.jsp"><button titile="返回上一页" type="button" class="btn btn-gradient-danger btn-icon">
                <i class="mdi mdi-keyboard-backspace"></i>
                </button>  </a>  
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
								<em class="input-group-text border-0  mdi mdi-panorama-fisheye"></em>
							</div>
							<i  class="form-control bg-transparent border-0"
								placeholder="">所有文章列表</i>

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
		


			<%
				/* conndb.OpenConn();
				conndb.createStmt(); 
				ResultSet rs = conndb.stmtQuery(sql);*/
				String sql = "SELECT * FROM articles order by a_id desc;";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				/* while(rs.next()){  */

				int intPageSize;//一页显示的记录数
				int intRowCount;//记录总数
				int intPageCount;//总页
				int intPage;//待显示页码
				String strPage;
				int i;
				intPageSize = 5;//设置一页显示的记录数
				strPage = request.getParameter("page");//取得待显示页码
				if (strPage == null) {//表明在ＱueryString中没有page这个参数，则显示第一页数据
					intPage = 1;
				} else {//将字符串换成整型
					intPage = Integer.parseInt(strPage);
					if (intPage < 1)
						intPage = 1;
				}

				rs.last();//记录指针指向查询结果集中最后一条记录
				intRowCount = rs.getRow();//获取记录总数
				intPageCount = (intRowCount + intPageSize - 1) / intPageSize;//记录总页数
				if (intPage > intPageCount)
					intPage = intPageCount;//调整待显示的页码
				if (intPageCount > 0) {
					rs.absolute((intPage - 1) * intPageSize + 1);//将记录指针定位到待显示页的第一条记录上．
					//显示数据
					i = 0;
					while (i < intPageSize && !rs.isAfterLast()) {
						int aid = rs.getInt("a_id");
			%>

			<div class="content-wrapper" style="padding: 1rem ">

				<div class="row" style="padding: 1rem 27rem">
					<div class="col-12 grid-margin" style="margin-bottom: 1rem" >
						<div class="card" >
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

									<!--功能区-->
								<table align="right">
								<tr>
									<td><a class="nav-link" href="#">
										<button type="button" class="btn btn-inverse-danger btn-rounded btn-icon"">
										<i class="mdi mdi-heart-outline"></i></button></a></td>
								
									<td><a href="a_list1.jsp?selectid=<%=rs.getInt("a_id")%>#comment">
										<button type="button" class="btn btn-inverse-danger btn-rounded btn-icon"">
										<i class="mdi mdi-comment-text"></i></button></a></td>
									
									<!-- <td><a class="nav-link" href="#">
										<button type="button" class="btn btn-inverse-danger btn-rounded btn-icon"">
										<i class="mdi mdi-delete"></i></button></a></td>
									
									<td><a href="#">
										<button type="button" class="btn btn-inverse-danger btn-rounded btn-icon"">
										<i class="mdi mdi-pencil"></i></button></a></td> -->
									
									</tr>
									<tr>
									</tr>
								</table>
								<!-- 功能区结束 -->

								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
			<%
				rs.next();
						i++;
					}
			%>
			<table class="table" align="center">
				<tr height="50">

					<td colspan="2" align="right">第<%=intPage%>页&#12288; 共<%=intPageCount%>页&#12288;
						<%
							if (intPage < intPageCount) {
						%> <a
						href="a_list.jsp?page=<%=intPage + 1%>">下一页</a> <%
						 	}
						 		if (intPage > 1) {
						 %>
							<a href="a_list.jsp?page=<%=intPage - 1%>">上一页</a> <%
						 	}
						 	}
						 %>
											</td>
					<td  align="left"><a href="a_list.jsp?page=<%=intPage = 1%>">首页&nbsp; |&nbsp;</a>
			<a href="a_list.jsp?page=<%=intPageCount%>">尾页</a></td> 
					<%
						
					%>
				</tr>
			</table>
	<table>
	<tr><td>-----</td></tr>

	</table>


		</div>



		<!-- main-panel ends -->
	</div>

</body>
</html>