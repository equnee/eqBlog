<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1</title>
</head>
<body>

		<%
		try {
            String driver="oracle.jdbc.driver.OracleDriver";
            String url="jdbc:oracle:thin:@localhost:1521:orcl";
            String user="scott";
            String password="tiger";
            Class.forName(driver);//加载数据库驱动
            Connection conn=DriverManager.getConnection(url,user,password);//获取数据库连接

            if (conn != null) {
                System.out.println("Database connect successfully");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
		
		
		%>
		

				
</body>
</html>