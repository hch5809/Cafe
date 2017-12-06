<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id"); 

String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/test1";


    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
    Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT * FROM tbllogin_3 WHERE id = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setString(1, id);

rs = pstmt.executeQuery();
rs.next();

strSQL = "DELETE From tbllogin_3 WHERE id=?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setString(1, id);;
pstmt.executeUpdate();

response.sendRedirect("admin_manager.jsp");

rs.close();
pstmt.close();
conn.close();
%>

</body>
</html>