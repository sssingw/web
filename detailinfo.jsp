<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
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
<div>
	상세조회
</div>
	<% 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc");
	
	Statement stmt = conn.createStatement();
	
	String ckey = request.getParameter("key");
	ResultSet rset = stmt.executeQuery("select * from daytable where name = '"+ckey+"';"); 
	%>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50>
				<p align=center>
					이름
				</p>
			</td>
			<td width=50>
				<p align=center>
					학번
				</p>
			</td>
			<td width=50>
				<p align=center>
					국어
				</p>
			</td>
			<td width=50>
				<p align=center>
					영어
				</p>
			</td>
			<td width=50>
				<p align=center>
					수학
				</p>
			</td>
	<%
	while(rset.next()) {
		out.println("<tr>");
		out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(2)+"</p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(3)+"</p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(4)+"</p></td>");
		out.println("<td width=50><p align=center>"+rset.getInt(5)+"</p></td>");
		out.println("</tr>");
	}
	rset.close();
	stmt.close();
	conn.close();
	%>
</table>
</body>
</html>