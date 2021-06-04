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
<style>
	div{
		font-size : 50px;
	}
</style>
</head>
<body>
<h1>조회</h1>

	<% 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc");
	
	%>
	<table cellspacint=1 width=600 border=1>
		<tr>
			<td width=50><p align=center>이름</p></td>
			<td width=50><p align=center>학번</p></td>
			<td width=50><p align=center>국어</p></td>
			<td width=50><p align=center>영어</p></td>
			<td width=50><p align=center>수학</p></td>
	<%
	try {
	Statement stmt = conn.createStatement();
	ResultSet rset = stmt.executeQuery("select * from daytable;");
	while(rset.next()) {
		out.println("<tr>");
		out.println("<td width=50><p align=center><a href='detailinfo.jsp?key="
				+rset.getString(1)+"'> "+rset.getString(1)+"</a></p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(2)+"</p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(3)+"</p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(4)+"</p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(5)+"</p></td>");
		out.println("</tr>");
	}
	rset.close();
	stmt.close();
	conn.close();
	
    } catch (SQLSyntaxErrorException e){
      out.println("테이블이 존재하지 않습니다!");
    } catch (Exception e){
      out.println(e);
   }
%>
</table>
</body>
</html>