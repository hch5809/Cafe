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
	strSQL = "SELECT count(*) FROM tbllogin_3,tblboard1_3";
}else{
	strSQL = "SELECT count(*) FROM tbllogin_3,tblboard1_3 WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);




%>

<center><font size='3'><b> <a href="listboard11.jsp">�Խ���</a>  </b></font>
                                    
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      

	<TR bgcolor='cccccc'>      
		<TD><font size=2><center><b>��ȣ</b></center></font></TD>      
		<TD><font size=2><center><b>����</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>
		<TD><font size=2><center><b>�л�</b></center></font></TD>
		<TD><font size=2><center><b>����</b></center></font></TD>      
		<TD><font size=2><center><b>��ȸ</b></center></font></TD>  
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

	<TR bgcolor='ededed'>     
		<TD align=center><font size=2 color='black'><%=listnum %></font></TD>     
		<TD align=left>
			<a href="write11_output.jsp?num=<%=listnum %>">
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

</TABLE>     

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
                  	                   
<%
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
			<FORM Name='Form' Method='POST' Action='listboard11.jsp' OnSubmit='return Check()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' style="background-color:cccccc;">
				<option value='title' selected><font size='2'>
                                                        ������</font></option>
				<option value='student'><font size='2'>
                                                           �л�</font></option>
				<option value='name'><font size='2'>
                                                        �ۼ���</font></option>
                <option value='sex'><font size='2'>
                                                       ����</font></option>
				</select>
				</TD>
				<TD align='left'>
					<input type='text' name='keyword' value='' size='20' maxlength='30'>
					<input type='submit' value='�˻�'>
				</td>
			  </TR>
			  </FORM>
			  </TABLE> 
		</TD>
		<TD align='right'>		
		<a href='main.jsp'>[����]</a>	
		<TD align='right'>		
		<a href='write11.jsp'>[���]</a>				
		</TD>
	</TR>
</TABLE>
                  
</BODY>                     
</HTML>