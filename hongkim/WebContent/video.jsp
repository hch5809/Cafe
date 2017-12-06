<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영상 앨범</title>
<SCRIPT language="JavaScript">
function Check()
{
if (Form.keyword.value.length < 1) {
   alert("검색어를 입력하세요.");
   Form.keyword.focus(); 
         return false;
   }
}
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
<center><font size='3'><b> <a href="video.jsp">영상 게시판</a>  </b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0' align="center" >
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE> 

                                    

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
   
         <TABLE border='2' bgcolor='ededed'>
         <TR>
            <TD align=center width='170'>    
            <font size=2 color="black">
                                    <%=title %></a></font> 
            </TD>  
         </TR>
         <TR> 
            <TD align=center>
               <a href="video_output.jsp?num=<%=listnum %>">
               <img src=<%="C:/javaproject/hongkim/WebContent/IMG-UP/On_Click.png"%> width="160" height="160">
                 </video> 
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
%>
      </TR>
<%  
   }   
%>

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

if(lastRow > 0) {
   int setPage = 1;
   int lastPage = 0;
   if(lastRow % listSize == 0)
      lastPage = lastRow / listSize;
   else
      lastPage = lastRow / listSize + 1;

   if(currentPage > 1) {
%>
      <a href="video.jsp?pageNum=<%=currentPage-1%>">[이전]</a>   
<%   
   }
   for(i=setPage; i<=lastPage; i++) {
      if (i == Integer.parseInt(pageNum)){
%>
      [<%=i%>]
<%      
      }else{
%>
      <a href="video.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
      }
   }
   if(lastPage > currentPage) {
%>
      <a href="video.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
   }
}
%>  

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>                    

<TABLE border=0 width=600>
   <TR>
      <TD align='center'>   
         <TABLE border='0' cellpadding='0' cellspacing='0'>
         <FORM Name='Form' Method='POST' Action='video.jsp' OnSubmit='return Check()'>
         <input type='hidden' name='search' value='1'>
         <TR>
            <TD align='right'>
            <select name='key' style="background-color:cccccc;">
            <option value='title' selected><font size='2'>
                                                        글제목</font></option>
            <option value='contents'><font size='2'>
                                                        글내용</font></option>
            <option value='name'><font size='2'>
                                                        작성자</font></option>
            </select>
            </TD>
            <TD align='left'>
               <input type='text' name='keyword' 
                                                   value='' size='20' maxlength='30'>
               <input type='submit' value='검색'>
            </td>
           </TR>
           </FORM>
           </TABLE> 
      </TD>
      <TD align='right'>      
      <a href='main.jsp'>[메인]</a> 
      <TD align='right'>      
      <a href='video_write.jsp'>[등록]</a>            
      </TD>
   </TR>
</TABLE>


</body>
</html>