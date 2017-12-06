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

<%

   String s_id = request.getParameter("id");
   String s_pw = request.getParameter("pass");

   String driverName = "org.gjt.mm.mysql.Driver";
   String dbURL = "jdbc:mysql://localhost:3306/test1";

   Class.forName(driverName);
   Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

   Statement stmt = conn.createStatement();
   ResultSet rs = null;
   
   if(s_id.equals("admin")){
      String strSQL = "SELECT id, pass FROM tbllogin_3 where id ='" + s_id + "'" + "and pass ='" + s_pw + "'";
      rs = stmt.executeQuery(strSQL);
      if(rs.next()){
            session.setAttribute("sessionId", s_id);
            session.setAttribute("sessionPw", s_pw);
            response.sendRedirect("admin.jsp");
         }
   }
   

   else {
      String strSQL = "SELECT id, pass FROM tbllogin_3 where id ='" + s_id + "'" + "and pass ='" + s_pw + "'";

   rs = stmt.executeQuery(strSQL);
   
      if(rs.next()){
            session.setAttribute("sessionId", s_id);
            session.setAttribute("sessionPw", s_pw);
            response.sendRedirect("main.jsp");
        }

        else {
            out.println("ID & PW를 확인하세요.");%>
            <p align="left"><a href="login_main.jsp">[다시 로그인]</p>
            <p></a><a href="signUp.jsp">[회원가입]</a></p>
            <%
      } 
   }


%>
</body>
</html>