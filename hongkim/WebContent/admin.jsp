<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����������������</title>
</head>
<body>
<%

String s_id = (String)session.getAttribute("sessionId");

if(s_id.equals("admin")) {
%>

   <br><br><br>
   <center><h1>������������</h1></center>
      
   <br><br><br>
    <center><a href="main.jsp">[ī�����]</a></center><br><br>
    <center><a href="admin_manager.jsp">[ȸ�� ����]</a></center><br><br>
    <center><a href="admin_manager_board1.jsp">[�Խñ� ����]</a></center><br><br>
    <center><a href="admin_manager_board.jsp">[�ٹ� ����]</a></center><br><br>
    <center><a href="admin_manager_video.jsp">[���� ����]</a></center><br><br>
    <center><a href="message.jsp">[������]</a></center>

<%
}else {%>
<center>
���������� �������Դϴ�. <br>
<a href="main.jsp">ù ȭ������ �̵��ϱ�</a>
</center>
<%} %>
</body>
</html>