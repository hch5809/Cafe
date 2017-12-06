<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String num = request.getParameter("num"); 
String pass = request.getParameter("pass"); 


String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/test1";


    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
    Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pass FROM tblboard1_3 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pass").trim();
if (pass.equals(goodpass)){
   strSQL = "DELETE From tblboard1_3 WHERE num=?";
   pstmt = conn.prepareStatement(strSQL);
   pstmt.setInt(1, Integer.parseInt(num));
   pstmt.executeUpdate();
   
   response.sendRedirect("listboard11.jsp");
}else{
   response.sendRedirect("delete11_pass.jsp?num=" + num);
}

rs.close();
pstmt.close();
conn.close();
%>