<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String realFolder = "";
String savePath = "C:/javaproject/hongkim/WebContent/IMG-UP";
int sizeLimit = 1000 * 1024 * 1024; 
String encType = "euc-kr";

ServletContext context = getServletContext();

String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/test1";

    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
    Statement stmt = conn.createStatement();
    
    MultipartRequest multi = null;
    multi = new MultipartRequest( request,savePath,sizeLimit,encType,new DefaultFileRenamePolicy());
   
    int num  = Integer.parseInt(multi.getParameter("num"));
    String fileName = multi.getFilesystemName("userFile");
    String name   = multi.getParameter("id");  
    String pass   = multi.getParameter("pass"); 
    String title  = multi.getParameter("title");
    String contents  = multi.getParameter("contents");
    
PreparedStatement pstmt = null;

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

pstmt = conn.prepareStatement("UPDATE tblboard_3 SET id=?, pass=?, title=?, contents=?, writedate=?, filename=? WHERE num=?");
pstmt.setString(1, name);
pstmt.setString(2, pass);
pstmt.setString(3, title);
pstmt.setString(4, contents);
pstmt.setString(5, indate);
pstmt.setString(6, fileName);
pstmt.setInt(7, num);
pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect("listboard.jsp");
%>