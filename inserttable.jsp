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
	<h1>테이블 입력</h1>
<% 
	// request.setCharacter("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc");
	
	try {						
		Statement stmt = conn.createStatement();
		stmt.execute( "insert into daytable (name, studentid, kor, eng, mat) values ('효민', 209901, 95,100,95);"); 
		stmt.execute( "insert into daytable (name, studentid, kor, eng, mat) values ('보람', 209902, 95,95,95);");
		stmt.execute( "insert into daytable (name, studentid, kor, eng, mat) values ('은정', 209903, 100,100,100);");
		stmt.execute( "insert into daytable (name, studentid, kor, eng, mat) values ('지연', 209904, 100,95,90);");
		stmt.execute( "insert into daytable (name, studentid, kor, eng, mat) values ('소연', 209905, 80,100,70);");
		stmt.execute( "insert into daytable (name, studentid, kor, eng, mat) values ('큐리', 209906, 100,100,70);");
		stmt.execute( "insert into daytable (name, studentid, kor, eng, mat) values ('화영', 209907, 70,70,70);");
		
		stmt.close();
		conn.close();
		
	} catch (SQLSyntaxErrorException e){
      out.println("테이블이 존재하지 않습니다!");
    }catch (SQLIntegrityConstraintViolationException e){
      out.println("이미 값이 존재합니다.");
		
   }
	
%>
</body>
</html>