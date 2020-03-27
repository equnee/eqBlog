<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>文章详情</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="./vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<!--   <link rel="stylesheet" href="./vendors/iconfonts/mdi/css/materialdesignicons.css">
  <link rel="stylesheet" href="./vendors/css/vendor.bundle.base.css"> -->
<style>
a {
	color: #fe7596
}
a:hover{
color:#f3b050;
}
p img {
	width: 500px;
	height: 500px;
	box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
	-webkit-transition: all ease .3s;
	transition: all ease .5s;
}
p img:hover {
	-webkit-transform: scale(1.05);
	transform: scale(2.05);
	box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
	border-radius: 50%
}
font.name{
	
	color:#fe7596;
	face:
}
</style>



</script>
</head>
<body>
				<div id="dg" style="z-index: 9999; position: fixed ! important; left:140px; top: 140px;">
				<table width="100%" style="position: absolute; width:260px; right: 0px; top: 0px;">
								<button titile="返回上一页"type="button" class="btn btn-gradient-danger btn-icon" name="Submit" onclick="javascript:history.back(-1)">
                          <i class="mdi mdi-keyboard-backspace"></i>
                        </button>
				</table>
				</div>
	<%	int selectid = Integer.parseInt(request.getParameter("selectid"));
		Class.forName("com.mysql.cj.jdbc.Driver"); //加载数据库驱动
		String url = "jdbc:MySQL://localhost:3306/eqblog?username=root&password=root&useSSL=false&serverTimezone=UTC"; //指向数据库table1
		String username = "root"; //数据库用户名
		String password = "root"; //数据库用户密码       	       	
		Connection conn = DriverManager.getConnection(url, username, password); //连接数据库 */
	%>
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
				<!-- 搜索框	-->			
				<div class="search-field d-none d-md-block">
					<form class="d-flex align-items-center h-100"
						action="index.jsp">
						<div class="input-group">
							<div class="input-group-prepend bg-transparent">
								<em class="input-group-text border-0  mdi mdi-panorama-fisheye"></em>
							</div>
							<i class="form-control bg-transparent border-0"
								placeholder="search">文章详细内容</i>

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
						<a class="nav-link" href="logout.jsp" title="退出">
						<i class="mdi mdi-logout d-none d-lg-block"></i></a></li>
						
				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid page-body-wrapper">
		<div class="main-panel" style="width: 2000px">
			<div class="content-wrapper">
				<%
					String sql = "SELECT * FROM articles where a_id=" + selectid;
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					if (rs.next()) {
				%>
				<div class="row" style="padding: 1rem 10rem">
					<div class="col-12 grid-margin" style="margin-bottom: 1rem">
						<div class="card">


							<div class="card-body">
							<div>
							
							</div>
								<h1 class="Display 4" align="center"><%=rs.getString("a_title")%></h1>
							
								<p class="card-description" align="center">
							
							<a class="nav-link" title="查看他的个人主页" href="u_list.jsp?selectname=<%=rs.getString("u_name")%>" text-decoration:none;>
								<!-- <i class="mdi mdi-face"></i> --> <font class="name" size="3px">
								- <%=rs.getString("u_name")%> -</font> </a>
								
								<font size="2px"><%=rs.getString("a_time")%></font></p>
								<hr />
								
								<p align="center"><img src="<%=rs.getString("a_photo") %>"></p>
								<p class="card-description">
									<br /> &#12288;&#12288;
									<%=rs.getString("a_content")%></p>
								<br />
								<!--功能区-->
								<table align="right">
								<tr>
									<td><a class="nav-link" >
										<button type="button" class="btn btn-inverse-danger btn-rounded btn-icon"">
										<i class="mdi mdi-heart-outline"></i></button></a></td>
								
									<td><a href="#comment">
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

								<%
									}
								%>
							</div>



						</div>

					</div>

				</div>
<!-- 过度 -->
				

				<!-- 评论区开始 -->
				
				<div class="row" style="padding: 0rem 10rem">
					<div class="col-12 grid-margin" style="margin-bottom: 1rem">
						<div class="card">
							<div class="card-body">
							<a name="comment"></a>
							<span class="text-danger" align="center" style="font-size:2rem">Comments</span>
								<%Statement stmt1 = conn.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			String commentsql = "select * from comment where a_id=" + selectid;
			ResultSet com_rs = stmt1.executeQuery(commentsql);
			while(com_rs.next()){
			%>	
			<hr style="border-top:1px dashed #e5e5e5;"/>		
			<ul class="list-star">
					
                    <li>
						<span class="text-danger"><%=com_rs.getString("c_usr") %>&nbsp;:&nbsp;</span>
						<%=com_rs.getString("c_com") %>
						<span class="text-muted">(<%=com_rs.getString("c_time") %>)</span>
						<%-- <%=com_rs.getString("c_ip") %> --%>
						</li>
                   
                  </ul>
						
						
				<%} %>
			</table>
								
								<form action="c_save.jsp">
									<div class="form-group">
										<input type="hidden" name="name" class="form-control" value="<%=session.getAttribute("username")%>" />
										 <input type="hidden" name="aid" class="form-control" value="<%=rs.getInt("a_id")%>" />
									</div>
									<div class="form-group">
						
									<p class="card-title">我想说:</p>										
									<textarea class="form-control" id="exampleTextarea1" rows="4" name="com"></textarea>
									</div>

									<button type="submit" class="btn btn-gradient-danger">提交</button>
									<button type="reset"  class="btn btn-light">取消</button>

								</form>




							</div>
						</div>
					</div>
				</div>
				<!-- 评论区结束 -->

			</div>
		</div>



		<!-- main-panel ends -->
	</div>

</body>
</html>