<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE>����</TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
   a:link      {font-family:"";color:black;text-decoration:none;}
   a:visited   {font-family:"";color:black;text-decoration:none;}
   a:hover      {font-family:"";color:black;text-decoration:underline;}
-->
</style>

</HEAD>
<BODY>


<% 
String s_id = (String)session.getAttribute("sessionId");


if(session.getAttribute("sessionId") != null) {

String strSQL = "";

   
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost/test1";

   Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
    Statement stmt = conn.createStatement();
    ResultSet rs = null;
%>

<center>
  
      
      <%=s_id %>�� ������                            
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      

   <TR bgcolor='cccccc'>           
      <TD><font size=2><center><b>����</b></center></font></TD>      
      <TD><font size=2><center><b>����</b></center></font></TD> 
      <TD><font size=2><center><b>�������ID</b></center></font></TD>
      <TD><font size=2><center><b>�ۼ���</b></center></font></TD>
	       
   </TR>   
    
   
   
<%
      
      strSQL = "SELECT * FROM message_3 where msgid='" + s_id + "'";
      rs = stmt.executeQuery(strSQL);
      for (int i = 1; i < 10; i++){
      while(rs.next()){

         String msgtitle = rs.getString("msgtitle");
         String msgcontents = rs.getString("msgcontents");
         String msgsendid = rs.getString("msgsendid");
         String msgdate = rs.getString("msgdate");
         

%>

   <TR bgcolor='ededed'>  
      <TD>  
         <font size=2 color="black"><%=msgtitle %></font>
      </TD>
      <TD align=center>    
         <font size=2 color="black"><%=msgcontents %></font>     
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=msgsendid %></font>     
      </TD>  
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=msgdate %></font>     
      </TD>         
   </TR>  
         
<% }%>
</TABLE>     


                                        
<%
      }%>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>                    

      <TD align='left'>      
      <a href='main.jsp'>[����ȭ��]</a>            
      </TD>
      <TD align='right'>      
      <a href='message_send.jsp'>[�����ϱ�]</a>            
      </TD>
   </TR>
</TABLE>

<%
}

else {%>
<center>
�α����� �ʿ��� �������Դϴ�. <br>
<a href="login_main.jsp">ù ȭ������ �̵��ϱ�</a>
</center>
<%} %>
                  
</BODY>                     
</HTML>