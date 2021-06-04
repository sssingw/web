<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*, javax.sql.*,java.io.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
</head>

<body>
	<h1>테이블 생성</h1>
	<% 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc");
	
	try {
		Statement stmt = conn.createStatement();
		stmt.execute( "create table daytable(" +
							"name varchar(20),"+			
							"studentid int not null primary key," +			
							"kor int," +							
							"eng int," +							
							"mat int)" +
							"DEFAULT CHARSET=utf8;"
							);		
		stmt.close();
		conn.close();
	
	} catch (SQLSyntaxErrorException e){
      out.println("이미 테이블이 존재합니다!");
    } catch (Exception e){
      out.println(e);
		
   }
	
	
	%>
</body>
	
</html>