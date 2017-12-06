<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<% if(session.getAttribute("sessionId") == null){ %>
<center>
<br/><br/><br/>
<br/><br/><br/>
<form action = "loginCheck.jsp" method = "post">
	ID <input type = "text" name = "id" /> <br/><br/>
	PW <input type = "password" name = "pass" /> <br/><br/>
	<input type = "submit" value = "로그인" />
	<input type = "button" value = "회원가입" onClick = "window.location='signUp.jsp'" />
</form>
</center>
<% } else { %>
<center>
<h2><%= session.getAttribute("sessionId") %></h2>
<input type = "button" value ="Logout" onClick="window.location='logout.jsp'" />
<% } %>
</center>

</body>
</html>