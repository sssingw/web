<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*, javax.sql.*,java.net.*,java.io.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<SCRIPT LANGUAGE="JavaScript">
console.log("showREC.jsp");

   function onlyKorean(inputId) { 
      var str=document.getElementById(inputId).value; 
      if(str.length > 5) {
         alert("5글자 미만으로 다시 입력해주세요");
         document.getElementById(inputId).value=''; 
      }
      
      for (i = 0; i < str.length; i++) { 
         if (!((str.charCodeAt(i) > 0x3130 && str.charCodeAt(i) < 0x318F) || (str.charCodeAt(i) >= 0xAC00 && str.charCodeAt(i) <= 0xD7A3))) { 
            alert("다시 입력해 주세요"); 
            document.getElementById(inputId).value='';          
         } 
      } 
   }

   function submitForm(mode) {
      let nameVal = document.getElementById('inputkorean').value;
      let korVal = document.getElementById('kor_id').value;
      let engVal = document.getElementById('eng_id').value;
      let matVal = document.getElementById('mat_id').value;
      
      if ((nameVal == "")||(korVal == "")||(engVal == "")||(matVal == "")) {
         alert('값을 전부 입력하지 않았습니다. 값을 입력해주세요');
         return;
      }
	   if((korVal < 0 || korVal > 100)||(engVal < 0 || engVal > 100)||(matVal < 0 || matVal > 100)) {
        alert('점수를 올바르게 입력해주세요');
         return;
     }

     
   
      
      if (mode == "update") {
         myform.action = "updateDB.jsp";
         myform.submit();
      } else if (mode == "delete") {
         myform.action = "deleteDB.jsp";
         myform.submit();
      } 
   }
   </SCRIPT>

</head>
<body>
<%
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.21:3306/kopoctc", "root", "kopoctc");
   Statement stmt = conn.createStatement();
   
   String name="", studentid="", kor="", eng="", mat="";
   String cTmp = request.getParameter("searchid");
   
   if (cTmp.length() == 0) cTmp="0"; {
      try {         
         ResultSet rset = stmt.executeQuery("select *from daytable where studentid = " + cTmp + ";");
         name="해당학번없음";
         while (rset.next()) {
            name=rset.getString(1);
            studentid=Integer.toString(rset.getInt(2));
            kor=Integer.toString(rset.getInt(3));
            eng=Integer.toString(rset.getInt(4));
            mat=Integer.toString(rset.getInt(5));
         }
         
%>

<h1>성적 조회후 정정 / 삭제</h1>
   
    <form method="post" name="myform">
      <table cellspacing=1 width=400 border=0>
      <tr>
         <td width=100>
            <p align=center>
               조회할 학번
            </p>
         </td>         
         <td width=200>
            <p align=center>
               <input type='text' name='searchid' value="">
            </p>
         </td>
         <td width=100>
            <input type='submit' value="조회">
         </td>
      </tr>
      </table>      

      

      <table cellspacing=1 width=400 border=1>
      <tr>
         <td width=100>
            <p align=center>
               이름
            </p>
         </td>
         <td width=300>
            <p align=center>
               <input type='text' name='name' value='<%=name%>'
                     id="inputkorean" onkeyup="javascript:return onlyKorean('inputkorean');">
            </p>
         </td>
      </tr>
      <tr>
         <td width=100>
            <p align=center>
               학번
            </p>
         </td>
         <td width=300>
            <p align=center>
               <input type='text' name='studentid' value='<%=studentid%>' readonly>
            </p>
         </td>
      </tr>
      <tr>
         <td width=100>
            <p align=center>
               국어
            </p>
         </td>
         <td width=300>
            <p align=center>
               <input type='number' name = 'korean' id='kor_id' value='<%=kor%>' min="0" max="100">
            </p>
         </td>
      </tr>
      <tr>
         <td width=100>
            <p align=center>
               영어
            </p>
         </td>
         <td width=300>
            <p align=center>
               <input type='number' name = 'english' id='eng_id' value='<%=eng%>' min="0" max="100">
            </p>
         </td>
      </tr>
      <tr>
         <td width=100>
            <p align=center>
               수학
            </p>
         </td>
         <td width=300>
            <p align=center>
               <input type='number' name = 'mathmatic' id='mat_id' value='<%=mat%>' min="0" max="100">
            </p>
         </td>
      </tr>
   </table>
<%
      if(studentid.length()!=0) {
         out.println("<table cellspacing=1 width=400 border=0>");
         out.println("<tr>");
         out.println("<td width=200></td>");
         out.println("<td width=100><p align=center><input type='button' value=\"수정\" OnClick=\"submitForm('update')\"></p></td>");
         out.println("<td width=100><p align=center><input type='button' value=\"삭제\" OnClick=\"submitForm('delete')\"></p></td>");
         out.println("</tr>");
         out.println("</table>");
      }
%>
   </form>
      
<%
   rset.close();
   stmt.close();
   conn.close();
      
   } catch (Exception e) {
      out.println("테이블이 존재하지 않습니다");
   } 
   }
      
   
%>
</body>
</html>