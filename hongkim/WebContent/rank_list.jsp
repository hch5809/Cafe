<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE>�Խ���</TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Form.keyword.value.length < 1) {
	alert("�˻�� �Է��ϼ���.");
	Form.keyword.focus(); 
         return false;
	}
}
</SCRIPT>

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
String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";	
}

int listSize = 5;
int currentPage = Integer.parseInt(pageNum);
int startRow= (currentPage - 1) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i = 0;
String strSQL = "";

   
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost/test1";


        Class.forName(driverName);
        Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
        Statement stmt = conn.createStatement();

ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM tblboard1_3";
}else{
	strSQL = "SELECT count(*) FROM tblboard1_3 WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);




%>

<center><font size='3'><b> <a href="listboard11.jsp">��ȸ�� TOP </b></font>
                                    
<TABLE border='0' width='200' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='200'>      

	<TR bgcolor='cccccc'>      
		<TD><font size=2><center><b>��ȣ</a></b></center></font></TD>      
		<TD><font size=2><center><b>����</a></b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>        
		<TD><font size=2><center><b>��ȸ</b></center></font></TD>  
	</TR>   
	
<%
if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "select * from tbllogin_3, tblboard1_3 where tbllogin_3.id = tblboard1_3.id ORDER BY readcount DESC";
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM tblboard1_3 WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	}

	for (i = 1; i < listSize; i++){			
		while(rs.next()){

			int listnum = rs.getInt("num");
			String name = rs.getString("id");
			String title = rs.getString("title");
			int readcount = rs.getInt("readcount");

%>

	<TR bgcolor='ededed'>     
		<TD align=center><font size=2 color='black'><%=listnum %></font></TD>     
		<TD align=left>
			<a href="write11_output.jsp?num=<%=listnum %>">
			<font size=2 color="black"><%=title %></font></a>
		</TD>
		<TD align=center>    
			<font size=2 color="black"><%=name %></font></a>     
		</TD>         
		<TD align=center><font size=2><%=readcount %></font>     
	</TR>  
	   	
<% 
		}    
	}
	
}
		

%>

</TABLE>
                  
</BODY>                     
</HTML>