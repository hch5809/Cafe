<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영상관리</title>
<SCRIPT language="JavaScript">

</SCRIPT>
</head>
<body>

<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){
   pageNum = "1";   
}

int listSize = 9;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = startRow + listSize - 1;
int lastRow = 0;
int i = 0;
String strSQL = "";

String driverName = "org.gjt.mm.mysql.Driver";
String dbURL = "jdbc:mysql://localhost:3306/test1";

Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

Statement stmt = conn.createStatement();
ResultSet rs = null;

if (key==null || keyword==null){
   strSQL = "SELECT count(*) FROM video_3";
}else{
   strSQL = "SELECT count(*) FROM video_3 WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);

rs.close();
%>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0' align="center" >
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE> 
<center><font size='3'><b> <a href="video.jsp">영상 게시판</a>  </b></font>
                                    
    

<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>             
   
<%
if(lastRow > 0) {
   if(key==null || keyword==null){
      strSQL = "SELECT * FROM video_3 WHERE num BETWEEN " + startRow + " and " + endRow;
      rs = stmt.executeQuery(strSQL);
   } else {
      strSQL = "SELECT * FROM video_3 WHERE " + key + " like '%" + keyword + "%'";
      rs = stmt.executeQuery(strSQL);
   }

   for (i = 0; i < listSize; i++){   
      int j = 0;
%>
      <TR>
<%
      for(j = 0; j < 3; j++){      
         if(rs.next()){

         int listnum = rs.getInt("num");
         String title = rs.getString("title");
         String writedate = rs.getString("writedate");
         String filename = rs.getString("filename");
%>
      <TD>
      <FORM Name='Video' Method='POST' Action='admin_delete_video.jsp'>
      <TABLE border='2' bgcolor='ededed'>
      <TR>
         <TD align=center width='170'>  
         <input type=radio name='num' value =<%=listnum %>>  
         <font size=2 color="black">
                                <%=title %></a></font> 
         </TD>  
      </TR>
      <TR> 
         <TD align=center>
            <a href="video_output.jsp?num=<%=listnum %>">
            <img src=<%="C:/javaproject/hongkim/WebContent/IMG-UP/On_Click.png"%> width="160" height="160">
         </TD>  
      </TR>
      <TR>
         <TD align=center>
                                   <font size=2><%=writedate %>
                                   </font>
         </TD> 
      </TR>
      </TABLE> 

   </TD>   
<% 
      }else{
      break;   
   }
   }
   i = i + j;  
   }
%>
   </TR>


<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
<TR>
   <TD><hr size='1' noshade>
   </TD>
   </TR>
</TABLE> 
                                    
<%
rs.close();
stmt.close();
conn.close();
}
%>     

<TABLE border=0 width=600>
<TR>
   <TD align='center'>   
      <TABLE border='0' cellpadding='0' cellspacing='0'>
      
      <input type='hidden' name='search' value='1'>
      <TR>
            <input type='submit' value='삭제'>
         </td>
        </TR>
        </FORM>
        </TABLE> 
   </TD>

</TR>
</TABLE>


</body>
</html>