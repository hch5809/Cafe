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
        String driver = "org.gjt.mm.mysql.Driver";
       String url = "jdbc:mysql://localhost:3306/test1";
       String user = "root";
       String pwd = "dongyang";
      Connection con = null;
      Statement stmt = null ;
     
      String sql = "create table tbllogin_3( ";
       sql = sql+ "id varchar(20), ";
        sql = sql+ "name varchar(20), ";
        sql = sql+ "pass varchar(20) , ";
        sql = sql+ "sex varchar(10), ";
        sql = sql+ "juminnum1 char(6), ";
        sql = sql+ "student varchar(10), ";
        sql = sql+ "phone varchar(20),"; 
        sql = sql+ "primary key(id)) ";
      try{     
         Class.forName(driver);
         con = DriverManager.getConnection(url, user, pwd); 
         stmt= con.createStatement();
         stmt.executeUpdate(sql) ;
         out.print("데이터베이스 연결 성공!");
      }
      catch(Exception e){
         out.print("데이터베이스 연결 실패!"+e);
      }
      finally{
         try{
            if(con != null) con.close();
            if(stmt != null) stmt.close();
         }
         catch(Exception e){ 
              out.println( e.getMessage());
         }
      }
      %>

</body>
</html>