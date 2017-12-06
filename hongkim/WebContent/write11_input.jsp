<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head><title>게시판 글쓰기</title>
</head>
<%
 response.setHeader("Cache-Control","no-store"); 
 response.setHeader("Pragma","no-cache"); 
%>

<%
try{

String id   = request.getParameter("id");  
String pass   = request.getParameter("pass");
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-"; // 1월은 0, 2월은 1 로 불러와져 +1
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));


String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/test1";


Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
Statement stmt = conn.createStatement();

PreparedStatement pstmt1 = null, pstmt2 = null;

String strSQL = "SELECT Max(num) FROM tblboard1_3";
pstmt1 = conn.prepareStatement(strSQL);
ResultSet rs = pstmt1.executeQuery();
int num = 1;

if (!rs.wasNull()){
	rs.next();
	num = rs.getInt(1) + 1;	
}	
rs.close();
	

strSQL ="INSERT INTO tblboard1_3(num, id, pass, title, contents, writedate, readcount)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?)";
pstmt2 = conn.prepareStatement(strSQL);

pstmt2.setInt(1, num);
pstmt2.setString(2, id);
pstmt2.setString(3, pass);
pstmt2.setString(4, title);
pstmt2.setString(5, contents);
pstmt2.setString(6, indate);
pstmt2.setInt(7, 0);
pstmt2.executeUpdate();


response.sendRedirect("listboard11.jsp"); 
%>
<body>
<%
pstmt1.close();
pstmt2.close();
conn.close();
}catch(SQLException e){
%>

게시판에 문제가 있습니다. 관리자에게 문의하세요.

<%
}
%>
</body>
</html>
