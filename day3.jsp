<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*, javax.sql.*,java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Insert title here</title>
		<style>
			a {
				font : 30px;
			
			}
		</style>
		<frameset cols="50,50" frameborder="0" border="0">
			<frame src="main.html"></frame>
			<frame src="content.jsp" name="content"></frame>
		</frameset>
	</head>
	<body>
	</body>
</html>

