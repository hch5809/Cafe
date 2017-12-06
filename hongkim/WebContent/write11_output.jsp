<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

</HEAD>

<BODY>

<%

String s_id = (String)session.getAttribute("sessionId");

String num = request.getParameter("num"); 

String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/test1";


 Class.forName(driverName);
 Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
// Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM tblboard1_3 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String id = rs.getString("id");
String title = rs.getString("title");
String contents = rs.getString("contents").trim();
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
%>

<center><font size='3'><b> 게시판 </b></font>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='left'>
      		<font size='2'> 작성자 : <%=id %></font>
    		</TD>
    		
    		<TD align=right>
      		<font size='2'>작성일: <%=writedate %>, 조회수: <%=readcount %></font>
    		</TD>
    	</TR>
</TABLE>

<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
	<TR bgcolor='cccccc'>
		<TD align='center'>
    		<font size='3'><b><%=title %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
	<TR bgcolor='ededed'>
		<TD><font size='2' color=''><%=contents %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='right'>
		<font size='2'><br><font size='2'></font>
    		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
  	<TR>
  		<TD><hr size='1' noshade>
  		</TD>
  	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
		<TD align='left'>
			<a href="modify11_pass.jsp?num=<%=num %>">[수정하기]</a>
			<a href="delete11_pass.jsp?num=<%=num %>">[삭제하기]</a>
		</TD>

		<TD align='right'>
			<a href='write11.jsp'>[글쓰기]</a>
			<a href='listboard11.jsp'>[목록보기]</a>
 		</TD>
	</TR>
</TABLE>

<%

strSQL = "UPDATE tblboard1_3 SET readcount=readcount+1 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeUpdate();

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
	
}
%>

</TABLE>


<FORM Name='Plus' Action='plus1_input.jsp' Method='post'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
<input type='hidden' name='num' value='<%=num %>'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='plus_name' value = <%=s_id %>></p>
		</TD>
	</TR>
	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>한줄댓글</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<input type='text' size='62' name='plus_contents' >
         		</font>
      		</TD>
      		<TD>
      			<input Type = 'Submit' Value = '댓글등록'>
      		</TD>
	</TR>
</TABLE>

<%
Statement stmt = conn.createStatement();
String strSQL = "SELECT * FROM tblboardplus1_3 WHERE num = '" + num + "'";
rs = stmt.executeQuery(strSQL); 

while(rs.next()){ 
%>
<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR bgcolor='cccccc'>     
		 <TD>
		 <font size=2 color='black'>
		 	<b><%=rs.getString("id")%> :</b>
		 	<%=rs.getString("contents")%> 
		 	(<%=rs.getString("writedate")%>)
		 </font>
		 </TD>          
	</TR> 
</TABLE>   	
<%     
}

rs.close();
stmt.close();
pstmt.close();
conn.close();
%>

</FORM>
</TABLE>
</BODY>
</HTML>
