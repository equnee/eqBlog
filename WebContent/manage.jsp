<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<%-- <%@ include file="logined.jsp"%> --%>

<!DOCTYPE html>
<!-- saved from url=(0042)index.jsp -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="./css/style.css">
<script language="javascript"> 
//选中全选按钮，下面的checkbox全部选中 
var selAll = document.getElementById("selAll"); 
function selectAll(){ 
	var obj = document.getElementsByName("checkAll"); 
	if(document.getElementById("selAll").checked == false){ 
		for(var i=0; i<obj.length; i++){ 
			obj[i].checked=false; 
		 } 
	  }else { 
	  for(var i=0; i<obj.length; i++){	  
			obj[i].checked=true; 
	 	 }	
	  }   
} 

//当选中所有的时候，全选按钮会勾上 
function setSelectAll() { 
	var obj=document.getElementsByName("checkAll"); 
	var count = obj.length; 
	var selectCount = 0; 
	
	for(var i = 0; i < count; i++){ 
	if(obj[i].checked == true){ 
		selectCount++;	
		} 
	} 
	if(count == selectCount){	
		document.all.selAll.checked = true; 
	}else{ 
		document.all.selAll.checked = false; 
	} 
} 

//反选按钮 
function setNoSelect() { 
	var checkboxs=document.getElementsByName("checkAll"); 
	for (var i=0;i<checkboxs.length;i++) { 
	  var e=checkboxs[i]; 
	  e.checked=!e.checked; 
	  setSelectAll(); 
	} 
} 


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
<div>
<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="index.jsp"><img src="./image/logo.png" alt="logo"></a>
        <a class="navbar-brand brand-logo-mini" href="http://localhost:8080/eqBlog/index.jsp"><img src="./后台1_files/logo-mini.svg" alt="logo"></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <!-- <div class="search-field d-none d-md-block">
          <form class="d-flex align-items-center h-100" action="http://localhost:8080/eqBlog/index.jsp#">
            <div class="input-group">
              <div class="input-group-prepend bg-transparent"><em class="input-group-text border-0 mdi mdi-magnify"></em></div>
              <input type="text" class="form-control bg-transparent border-0" placeholder="Search projects">
            </div>
          </form>
        </div> -->
        <ul class="navbar-nav navbar-nav-right">
          
         
          <li class="nav-item nav-logout d-none d-lg-block">
            <a class="nav-link" href="index.jsp">首页</a>
          </li>
          <li class="nav-item nav-logout d-none d-lg-block">
            <a class="nav-link" href="logout.jsp">退出</a>
          </li>
          
          
        </ul>
        
      </div>
    </nav>
      </div>
<div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item nav-profile">
            <a href="u_index.jsp" class="nav-link">
              <div class="nav-profile-image">
                <img src="./image/portrait.jpg" alt="profile">
                <span class="login-status online"></span> <!--change to offline or busy as needed-->              
              </div>
              <div class="nav-profile-text d-flex flex-column">
                <span class="font-weight-bold mb-2">Admin</span>
                <span class="text-secondary text-small">Blog Manager</span>
              </div>
              <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="manage.jsp">
              <span class="menu-title" style="color:#fe7c96" >文章管理</span>
              
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="manage_user.jsp">
              <span class="menu-title">用户管理</span>
              
            </a>
          </li>
          <!-- 管理条其他东西 -->
         <!--  <li class="nav-item ">
            <a class="nav-link" href="#">
              <span class="menu-title">...</span>
              
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title">...</span>
              
            </a>
          </li> -->
          
          <li class="nav-item sidebar-actions">
            <span class="nav-link">
              <div class="border-bottom">
                <h6 class="font-weight-normal mb-3">Add</h6>                
              </div>
             <a href="a_new.jsp"> <button class="btn btn-gradient-danger btn-rounded btn-fw">+ 添加新文章</button></a>
              
            </span>
          </li>
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">


          <div class="row">
            <div class="col-12 grid-margin">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">文章管理</h4>
                  <div class="table-responsive">
                   
					
					
					
					
					<form method="post" action="a_deletes.jsp">
		<table class="table table-hover" >
				
		<%		
			Class.forName("com.mysql.jdbc.Driver");  //加载数据库驱动
        	String url = "jdbc:MySQL://localhost:3306/eqblog?username=root&password=root&useSSL=false&serverTimezone=UTC"; //指向数据库table1
        	String username = "root";  //数据库用户名
        	String password = "root";  //数据库用户密码       	       	
        	Connection conn = DriverManager.getConnection(url, username, password);  //连接数据库 */
	    					
			/* conndb.OpenConn();
			conndb.createStmt(); 
			ResultSet rs = conndb.stmtQuery(sql);*/
			String sql="SELECT * FROM articles;";
			Statement stmt =  conn.createStatement(); 
	        ResultSet rs =stmt.executeQuery(sql);   	 
        %>
         
         <tr>
            <td>选中</td>
			<td>id</td>
			<td>标题</td>
			<td>内容摘要</td>
			<td>发表时间</td>
			<td>分类</td>
			<td>可见</td>
			<td colspan="2">操作</td>			
		</tr>
         
		<% 	
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
			while(i<intPageSize&&!rs.isAfterLast()){   
	          	int aid=rs.getInt("a_id");        
		%>
          
		<tr>						
			<td><input type="checkbox" name="checkAll" id="checkAll" onclick="setSelectAll();"  value="<%=rs.getInt("a_id") %>" /></td>         
			<td><%=rs.getInt("a_id") %></td>
            <td><a href="a_list1.jsp?selectid=<%=rs.getInt("a_id") %>"><%=rs.getString("a_title") %></a></td>
            <td><% String content=rs.getString("a_content");
					if(content.length()>=10)
						content=content.substring(0,10)+"......";
					out.print(content);
				%></td>            
			<td><%=rs.getString("a_time") %></td>
            <td><%=rs.getString("t_id") %></td>                       
			<td><%=rs.getString("a_visible") %></td>
				
			<td align="center"><a href="a_edit.jsp?selectid=<%=aid%>">修改</a></td>
			<td align="center"><a onclick="firm()" href="a_delete.jsp?deleteid=<%=aid%>" >删除</a></td>
			
		</tr>
	
		<%
          	rs.next();
			i++;
			/* if (i % 5 == 0) {
			out.print(" ");
			} */
			} 
		%>
		</table>
       
       
       <table class="table">
		<tr>
		<td colspan="8" align="left">
	            <input type="checkbox" id="selAll" onclick="selectAll();" />
	            <span style="color: #76838f;"> &nbsp;全选 &nbsp;</span>
				<input type="checkbox" id="inverse" onclick="setNoSelect();" />
				<span style="color: #76838f;"> &nbsp;反选 </span>
		</td>
		<td align="right"><input class="btn btn-inverse-danger btn-sm" type="submit" value="删除" onclick="firm()"></td>
			
		</tr>
       
		 <tr height="50">
		 
			<td colspan="5" align="right">
				第<%=intPage%>页&#12288; 共<%=intPageCount%>页&#12288;				
				<% if (intPage < intPageCount) {  %>
				<a href="manage.jsp?page=<%=intPage + 1%>">下一页</a>
				<% } if (intPage > 1) { %>
				<a href="manage.jsp?page=<%=intPage - 1%>">上一页</a>
				<% } }
				%>
			</td  align="left">
			<td><a href="manage.jsp?page=<%=intPage = 1%>">首页</a>
			<a href="manage.jsp?page=<%=intPageCount%>">尾页</a></td>
			
		 </tr>		
		</table>  
	</form>    
	  
					  
                  </div>
                </div>
              </div>
            </div>
          </div>
      
        <!-- content-wrapper ends -->
        
        
        
      </div>
      <!-- main-panel ends -->
    </div>

</body>
</html>