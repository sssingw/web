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
	</head>
	<body>
		<h1>레코드 삭제</h1>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc", "root", "kopoctc");
	Statement stmt = conn.createStatement();
	
	String cTmp = request.getParameter("studentid");
	
	String sql="delete from daytable where studentid = " + cTmp;
	stmt.executeUpdate(sql);
	
	ResultSet rset = stmt.executeQuery("select * from daytable;");
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
			</tr>
<%
	while (rset.next()) {
			out.println("<tr>");
			out.println("<td width=50><p align=center><a href='detailinfo.jsp?key="
						+rset.getString(1)+"'> "+rset.getString(1)+"</a></p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
			out.println("</tr>");
		}
		
	rset.close();
	stmt.close();
	conn.close();
%>
	</body>
</html>
		
			
			
			
			
			
			