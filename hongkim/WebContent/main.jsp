<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>카페</title>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">

<% 
String s_id = (String)session.getAttribute("sessionId");
String admin = "admin";



if(session.getAttribute("sessionId") != null) {%>

<table width="1102" height="95"  border='1'>
    <tr>
        <td width="1092" height="45">
        	  <p align="center"><%=s_id %>님 환영합니다~</p>
            <p align="right"><a href="signUpdate.jsp">[회원정보수정]</a> <a href="logout.jsp">[로그아웃]</a><a href="signUp.jsp">[회원가입]</a></p>
            <p align="right"><a href="message_send.jsp">[쪽지발송]</a><a href="message.jsp">[쪽지함]</a></p>
        </td>
    </tr>
    <tr>
       <td  width="1092" height="45" align="center"><font size="15">Hello JSP World <font color="red">Hong</font><font color="yellow">&</font><font color="blue">Kim</font></font></td>
    </tr>
</table>

<table  width="1102" height="780" border='1'>
    <tr>
        <td width="841" height="347"><jsp:include page="listboard11.jsp"/></td>
        <td width="245" height="774" rowspan="2"><jsp:include page="rank_list.jsp"/></td>
    </tr>
    <tr>
        <td width="841" height="422"><jsp:include page="listboard.jsp"/></td>
    </tr>
    <tr>
        <td width="841" height="422"><jsp:include page="video.jsp"/></td>
    </tr>
</table>
<p>&nbsp;</p>

<%
}


else {%>

<table width="1102" height="95"  border='1'>
    <tr>
        <td width="1092" height="45">
            <p align="right"><a href="login_main.jsp">[로그인]</a><a href="signUp.jsp">[회원가입]</a></p>
        </td>
    </tr>
    <tr>
       <td  width="1092" height="45" align="center"><font size="15">Hello JSP World <font color="red">Hong</font><font color="yellow">&</font><font color="blue">Kim</font></font></td>
    </tr>
</table>

<table  width="1102" height="780" border='1'>
    <tr>
        <td width="841" height="347"><jsp:include page="listboard11.jsp"/></td>
        <td width="245" height="774" rowspan="2"><jsp:include page="rank_list.jsp"/></td>
    </tr>
    <tr>
        <td width="841" height="422"><jsp:include page="listboard.jsp"/></td>
    </tr>
     <tr>
        <td width="841" height="422"><jsp:include page="video.jsp"/></td>
    </tr>
</table>
<p>&nbsp;</p>

<%} %>
</body>
</html>