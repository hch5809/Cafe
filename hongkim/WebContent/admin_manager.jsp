<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE>ȸ������</TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
   a:link      {font-family:"";color:black;text-decoration:none;}
   a:visited   {font-family:"";color:black;text-decoration:none;}
   a:hover      {font-family:"";color:black;text-decoration:underline;}
-->
</style>
<title>����������������</title>
</HEAD>
<BODY>


<% 
String s_id = (String)session.getAttribute("sessionId");

String id = request.getParameter("id");
String pass = request.getParameter("pass"); 
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String juminnum1 = request.getParameter("juminnum1");
String student = request.getParameter("student");
String phone = request.getParameter("phone");


if(s_id.equals("admin")) {

   String strSQL = "";

    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost/test1";

   Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
    Statement stmt = conn.createStatement();
    ResultSet rs = null;
%>

<center>
  
      
         ������ ������                          
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      

   <TR bgcolor='cccccc'>           
      <TD><font size=2><center><b>���̵�</b></center></font></TD>      
      <TD><font size=2><center><b>�н�����</b></center></font></TD> 
      <TD><font size=2><center><b>�̸�</b></center></font></TD>
      <TD><font size=2><center><b>����</b></center></font></TD>
      <TD><font size=2><center><b>�ֹι�ȣ</b></center></font></TD>
      <TD><font size=2><center><b>�л�</b></center></font></TD>
     <TD><font size=2><center><b>��ȣ</b></center></font></TD>     
   </TR>   
    
<%
      
      strSQL = "SELECT * FROM tbllogin_3";
      rs = stmt.executeQuery(strSQL);
      for (int i = 1; i < 10; i++){
      while(rs.next()){

         String mbid = rs.getString("id");
         String mbpass = rs.getString("pass");
         String mbname = rs.getString("name");
         String mbsex = rs.getString("sex");
         String mbjuminnum1 = rs.getString("juminnum1");
         String mbstudent = rs.getString("student");
         String mbphone = rs.getString("phone");
         
%>
<FORM Name='Member' Action='admin_delete.jsp' Method='post'>
   <TR bgcolor='ededed'>  
      <TD>  
         <font size=2 color="black"><input type=radio name='id' value =<%=mbid %>><%=mbid %></font>
      </TD>
      <TD align=center>    
         <font size=2 color="black"><%=mbpass %></font>     
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=mbname %></font>     
      </TD> 
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=mbsex %></font>     
      </TD> 
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=mbjuminnum1 %></font>     
      </TD> 
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=mbstudent %></font>     
      </TD>   
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=mbphone %></font>     
      </TD>          
   </TR>  
   
   
         
<% }%>
   
                              
<%
      }%>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>
<br>                    

      <TD align='left'>      
      <a href = 'admin.jsp'><input type='button' value='����'></a>        
      </TD>
      <TD align='right'>      
      <input type='submit' value='����'>           
      </TD>
   </TR>
</TABLE>
</TABLE>  
</FORM>
<%
}

else {%>
<center>
���������� �������Դϴ�. <br>
<a href="main.jsp">ù ȭ������ �̵��ϱ�</a>
</center>
<%} %>
                  
</BODY>                     
</HTML>