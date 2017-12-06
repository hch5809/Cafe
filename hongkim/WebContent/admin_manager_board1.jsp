<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
   a:link      {font-family:"";color:black;text-decoration:none;}
   a:visited   {font-family:"";color:black;text-decoration:none;}
   a:hover      {font-family:"";color:black;text-decoration:underline;}
-->
</style>
<title>게시물관리</title>
</HEAD>
<BODY>


<%

String s_id = (String)session.getAttribute("sessionId");

if(s_id.equals("admin")) {

String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";	
}

int listSize = 5;
int lastRow = 0;
int i;
String strSQL = "";

   
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost/test1";


        Class.forName(driverName);
        Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
        Statement stmt = conn.createStatement();

ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM tbllogin_3,tblboard1_3";
}else{
	strSQL = "SELECT count(*) FROM tbllogin_3,tblboard1_3 WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);

%>

<center><font size='3'><b> <a href="listboard11.jsp">게시판</a>  </b></font>
                                    
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      

	<TR bgcolor='cccccc'>      
		<TD><font size=2><center><b>번호</b></center></font></TD>      
		<TD><font size=2><center><b>제목</b></center></font></TD>      
		<TD><font size=2><center><b>작성자</b></center></font></TD>      
		<TD><font size=2><center><b>작성일</b></center></font></TD>
		<TD><font size=2><center><b>학생</b></center></font></TD>
		<TD><font size=2><center><b>성별</b></center></font></TD>      
		<TD><font size=2><center><b>조회</b></center></font></TD>  
	</TR>   
	
<%
if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "select * from tbllogin_3, tblboard1_3 where tbllogin_3.id = tblboard1_3.id ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM tbllogin_3, tblboard1_3 WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	}

	for (i = 1; i < listSize; i++){			
		while(rs.next()){

			int listnum = rs.getInt("num");
			String name = rs.getString("id");
			String title = rs.getString("title");
			String writedate = rs.getString("writedate");
			String student = rs.getString("tbllogin_3.student");
			String sex = rs.getString("tbllogin_3.sex");
			int readcount = rs.getInt("readcount");

%>
<FORM Name='Board1' Action='admin_delete_board1.jsp' Method='post'>
	<TR bgcolor='ededed'>     
		<TD align=center><font size=2 color='black'><input type=radio name='num' value =<%=listnum %>><%=listnum %></font></TD>     
		<TD align=left>
			<font size=2 color="black"><%=title %></font></a>
		</TD>
		<TD align=center>    
			<font size=2 color="black"><%=name %></font></a>     
		</TD>     
		<TD align=center><font size=2><%=writedate %></font>
		</TD> 
		<TD align=center><font size=2><%=student %></font>
		</TD>
		<TD align=center><font size=2><%=sex %></font>
		</TD>          
		<TD align=center><font size=2><%=readcount %></font>     
	</TR>  
	
	
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
	<br>                    

	      <TD align='left'>      
	      <a href = 'admin.jsp'><input type='button' value='메인'></a>        
	      </TD>
	      <TD align='right'>      
	      <input type='submit' value='삭제'>           
	      </TD>
	   </TR>
	</TABLE>
	</TABLE>  
	</FORM>
<%
}
}
	
else {%>
<center>
관리자전용 페이지입니다. <br>
<a href="main.jsp">첫 화면으로 이동하기</a>
</center>
<%} %>
                  
</BODY>                     
</HTML>