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
String sex = request.getParameter("sex");
String juminnum1 = request.getParameter("juminnum1");
String student = request.getParameter("student");
String phone = request.getParameter("phone");


String check_ok = "yes";

if (id == "")
	check_ok = "no";

if (pass == "")
	check_ok = "no";

if (name == "")
	check_ok = "no";

if (juminnum1 == "")
	check_ok = "no";

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

Statement stmt = conn.createStatement();

String strSQL = "SELECT id FROM tbllogin_3 where id='" + id + "'";
ResultSet rs = stmt.executeQuery(strSQL);

if (!rs.next())
	check_ok="yes";
else
	check_ok="no";

if (check_ok == "yes"){
	strSQL = "INSERT INTO tbllogin_3(id,pass,name, sex, juminnum1, student , phone)";
	strSQL = strSQL +  "VALUES('" + id + "', '" + pass + "', '" + name + "', '" + sex + "',";
	strSQL = strSQL +  "'" + juminnum1 + "', '" + student + "', '" + phone + "')";
	stmt.executeUpdate(strSQL);
%>

<BODY>

<center><font size='3'><b> ȸ�� ���� ���� </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>ȸ�� ������ �����մϴ�.<BR>�α��� �ϼ���.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="main.jsp">[�α���]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>

<%
} else {
%>

<HTML>
<HEAD>
<TITLE> ȸ�� ���� ���� </TITLE> 
</HEAD>

<BODY>

<center><font size='3'><b> ȸ�� ���� ���� </b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>ȸ�� ���Կ� ���� �߽��ϴ�. <BR>�ٽ� ���Լ��� �ۼ��� �ּ���.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="signUp.jsp">[���Լ� �ۼ�]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>
<%
}

stmt.close();
conn.close();
%>
