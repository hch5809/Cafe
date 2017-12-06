<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass"); 
String name = request.getParameter("name");
String student = request.getParameter("student");
String phone = request.getParameter("phone");


String check_ok = "yes";


if (pass == "")
	check_ok = "no";

if (name == "")
	check_ok = "no";


String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");
Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;

String strSQL = "SELECT id FROM tbllogin_3 where id='" + id + "'";
ResultSet rs = stmt.executeQuery(strSQL);

	pstmt = conn.prepareStatement("UPDATE tbllogin_3 SET pass=?, name=?, student=?, phone=? WHERE id=?");
	pstmt.setString(1, pass);
	pstmt.setString(2, name);
	pstmt.setString(3, student);
	pstmt.setString(4, phone);
	pstmt.setString(5, id);
	pstmt.executeUpdate();

%>

<BODY>

<center><font size='3'><b> 회원 정보 수정 성공 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>회원정보가 수정 되었습니다.<BR>바뀐정보로 로그인 하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="main.jsp">[로그인]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>

<%
stmt.close();
conn.close();
%>
