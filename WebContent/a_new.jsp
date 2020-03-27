<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.Statement"
	pageEncoding="UTF-8" %>
<%@ include file="logined.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发表新文章</title>
<script src="assets/jquery.min.js"></script>
<script src="assets/trumbowyg.js"></script>
<script src="assets/plugins/base64/trumbowyg.base64.js"></script>
<link rel="stylesheet" href="assets/design/css/trumbowyg.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet"
	href="./vendors/iconfonts/mdi/css/materialdesignicons.min.css">
</head>
<jsp:useBean id="conndb" scope="page" class="com.db.ConnDB"></jsp:useBean>
<body>

	
				<div id="dg" style="z-index: 9999; position: fixed ! important; left:140px; top: 140px;">
				<table width=""100% style="position: absolute; width:260px; right: 0px; top: 0px;">
								<button titile="返回上一页"type="button" class="btn btn-gradient-danger btn-icon" name="Submit" onclick="javascript:history.back(-1)">
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
				<!--搜索框--> <div class="search-field d-none d-md-block">
					<form class="d-flex align-items-center h-100"
						action="index.jsp">
						<div class="input-group">
							<div class="input-group-prepend bg-transparent">
								<em class="input-group-text border-0  mdi mdi-panorama-fisheye"></em>
							</div>
							<i class="form-control bg-transparent border-0"
								placeholder="search">发表文章</i>

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
				
				<div class="row" style="padding: 1rem 10rem">
					<div class="col-12 grid-margin" style="margin-bottom: 1rem">
						<div class="card">


							<div class="card-body">
							
							<FORM METHOD=POST ACTION="a_new_e.jsp" ENCTYPE="multipart/form-data">
	
		<div>
		<input type="text" class="form-control" id="exampleInputUsername1" placeholder="输入您的标题" NAME="tit" >
		<input type="hidden" name="name" class="form-control" value="<%=session.getAttribute("username")%>" />	
		</div>	
		<div onmousedown="show_element(event)" style="clear: both"
			id="customized-buttonpane" class="editor" name="cont" >
			</div>

		<div id="odiv" style="display: none; position: absolute; z-index: 100;">
			<img src="assets/pic/sx.png" title="缩小" border="0" alt="缩小" onclick="sub(-1);" /> 
			<img src="assets/pic/fd.png" title="放大" border="0" alt="放大" onclick="sub(1)" /> 
			<img src="assets/pic/cz.png" title="重置" border="0" alt="重置" onclick="sub(0)" /> 
			<img src="assets/pic/sc.png" title="删除" border="0" alt="删除" onclick="del();odiv.style.display='none';" />
		</div>
		

					
					<div class="form-group">
					  <div class="form-group row">
                          
                          <div class="col-sm-3">
                   
                    <INPUT TYPE="file" NAME="photo" size="15" class="form-control file-upload-info">               
                    </div>
                    </div>
                    
                      <!-- <div class="col-md-6"> -->
                        <div class="form-group row">
                          
                          <div class="col-sm-3">
                          <select name="visi" class="form-control">
			<option value="1" selected>权限 - 公开</option>
			<option value="0">仅自己可见</option>
		</select> 
                          </div>
                          
                       <!--  </div>-->
                      </div> 
                      
                    <!--   
                      <div class="col-md-6"> -->
                        <div class="form-group row">
                          
                          <div class="col-sm-3">
                            <select name="typ" class="form-control">
			<option value="1" selected>文章分类 - 未分类</option>
			<option value="2">个人日记</option>
			<option value="3">生活分享</option>
			<option value="4">学习总结</option>	
		</select>
                          </div>
                      </div>
                        
                      </div>
                 
		
					
                  </div>
                  <p align="right"> <INPUT TYPE="submit" value=" 保存 " class="btn btn-gradient-danger" ></p>
		
		 
	</FORM>
	
								<!-- <table align="right">
								
										<tr>
										<td><a class="nav-link" href="#">
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
										</a></td>
										<td><a href="#">
												<button type="button"
													class="btn btn-inverse-danger btn-rounded btn-icon"">
													<i class="mdi mdi-pencil"></i>
												</button>
										</a></td>
									</tr>
									<tr>
									</tr>
								</table> -->

								
							</div>



						</div>

					</div>

				</div>
<!-- 过度 -->
				

			</div>
		</div>



		<!-- main-panel ends -->
	</div>

</body>
</html>
</body>
</html>