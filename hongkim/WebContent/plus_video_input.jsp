<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
int num = Integer.parseInt(request.getParameter("num"));
String id = request.getParameter("plus_name");  
String contents = request.getParameter("plus_contents");


String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

Statement stmt = conn.createStatement();

String strSQL = "SELECT num FROM videoplus_3 ORDER BY num DESC";
ResultSet rs = stmt.executeQuery(strSQL);

       strSQL = "SELECT Max(num) FROM videoplus_3";
       rs = stmt.executeQuery(strSQL);
       rs.next();

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

strSQL ="INSERT INTO videoplus_3 (num, id, contents, writedate)";
strSQL = strSQL +  "VALUES('" + num + "', '" + id + "', '"+ contents + "', '" + indate + "')";
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("video_output.jsp?num=" + num); 
%>


</body>
</html>