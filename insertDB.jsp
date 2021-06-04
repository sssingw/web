<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*,javax.sql.*,java.net.*,java.io.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
</head>
<body>
<%
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.21:3306/kopoctc", "root", "kopoctc");
   Statement stmt = conn.createStatement();
   
   
   try {  
   int NewStdId=0;
   
   ResultSet rset = stmt.executeQuery("select max(studentid) from daytable");
   while (rset.next()) {
      NewStdId = rset.getInt(1) + 1;
   }
    
   String cTmp = request.getParameter("name");
   if(cTmp == null || cTmp.equals("")) {
	   
   } 
   stmt.execute("insert into daytable (name, studentid, kor, eng, mat) values('"+ 
   cTmp + "',"+ 
   Integer.toString(NewStdId) + ","+ 
   request.getParameter("korean") + ","+ 
   request.getParameter("english") + ","+ 
   request.getParameter("mathmatic") + ");");
   %>
	<h1>성적입력 추가완료</h1>
	<form method='post' action='inputForm1.jsp'>
	   <table cellspacing=1 width=400 border=0>
	   <tr>
		  <td width=300></td>
		  <td width=100>
			<input type="submit" value="뒤로가기">
		  </td>
	   </tr>
	   </table>
	   
	   <table cellspacing=1 width=400 border=1>
	   <tr>
		  <td width=100><p align=center>이름</p></td>
		  <td width=300><p align=center>
		  <input type='text' name='name' value='<%=cTmp%>' readonly></p>
		 </td>
		</tr>
		<tr>
		  <td width=100><p align=center>학번</p></td>
		  <td width=300><p align=center>
		  <input type='text' name='studentid' value='<%=Integer.toString(NewStdId)%>' readonly></p>
		 </td>
		</tr>
		<tr>
		  <td width=100><p align=center>국어</p></td>
		  <td width=300><p align=center>
		  <input type='text' name='korean' value='<%=request.getParameter("korean")%>' readonly</p>
		 </td>
		</tr>
		<tr>
		  <td width=100><p align=center>영어</p></td>
		  <td width=300><p align=center>
		  <input type='text' name='english' value='<%=request.getParameter("english")%>' readonly></p>
		 </td>
		</tr>
		<tr>
		  <td width=100><p align=center>수학</p></td>
		  <td width=300><p align=center>
		  <input type='text' name='mathmatic' value='<%=request.getParameter("mathmatic")%>' readonly></p>
		 </td>
		</tr>
		</table>
	</form>
	
	<%
   rset.close();
	
   } catch (SQLSyntaxErrorException e) {
	   out.println("테이블이 존재하지 않거나 값이 제대로 입력되지 않았습니다.");
   } catch (Exception e) {
	   out.println("테이블이 존재하지 않거나 값이 제대로 입력되지 않았습니다.");
   }
   
   stmt.close();
   conn.close();
  
%>

</body>
</html>