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
<html>
<head>
	<script>
		function onlyKorean(inputId) { 
		var str=document.getElementById(inputId).value; 
		if(str.length > 5) {
			alert("5글자 미만으로 입력해주세요");
			document.getElementById(inputId).value=''; 
		}
		for (i = 0; i < str.length; i++) { 
		if (!((str.charCodeAt(i) > 0x3130 && str.charCodeAt(i) < 0x318F) || (str.charCodeAt(i) >= 0xAC00 && str.charCodeAt(i) <= 0xD7A3))) { 
				alert("다시 입력해 주세요"); 
				document.getElementById(inputId).value=''; 			
			} 
			} 
		}
	</script>
</head>
<body>
<h1>성적입력 추가</h1>
	
	<form method='post' action='insertDB.jsp'>
		<table cellspacing=1 width=400 border=0>
		<tr>
			<td width=300></td>
			<td width=100><input type="submit" value="추가"></td>
		</tr>
		</table>
		
		<table cellspacing=1 width=400 border=0>
		<tr>
			<td width=100>
				<p align=center>
					이름
				</p>
			</td>
			<td width=300>
				<p align=center>
					<input type="text" name="name" value="" required
					       id="inputkorean" onkeyup="javascript:return onlyKorean('inputkorean');">
			    </p>
			</td>
		</tr>
		<tr>
			<td width=100><p align=center>학번</p></td>
			<td width=300><p align=center>자동부여</p></td>
		</tr>
		<tr>
			<td width=100><p align=center>국어</p></td>
			<td width=300><p align=center><input type="number" name="korean" value="" min="0" max="100"></p></td>
		</tr>
		<tr>
			<td width=100><p align=center>영어</p></td>
			<td width=300><p align=center><input type="number" name="english" value="" min="0" max="100"></p></td>
		</tr>
		<tr>
			<td width=100><p align=center>수학</p></td>
			<td width=300><p align=center><input type="number" name="mathmatic" value="" min="0" max="100"></p></td>
		</tr>
		</table>
		
		</form>
		</body>
		</html>
		
			
			
			
			
			
			