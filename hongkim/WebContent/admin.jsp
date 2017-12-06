<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자전용페이지</title>
</head>
<body>
<%

String s_id = (String)session.getAttribute("sessionId");

if(s_id.equals("admin")) {
%>

   <br><br><br>
   <center><h1>관리자페이지</h1></center>
      
   <br><br><br>
    <center><a href="main.jsp">[카페메인]</a></center><br><br>
    <center><a href="admin_manager.jsp">[회원 관리]</a></center><br><br>
    <center><a href="admin_manager_board1.jsp">[게시글 관리]</a></center><br><br>
    <center><a href="admin_manager_board.jsp">[앨범 관리]</a></center><br><br>
    <center><a href="admin_manager_video.jsp">[영상 관리]</a></center><br><br>
    <center><a href="message.jsp">[쪽지함]</a></center>

<%
}else {%>
<center>
관리자전용 페이지입니다. <br>
<a href="main.jsp">첫 화면으로 이동하기</a>
</center>
<%} %>
</body>
</html>