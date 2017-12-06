<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Album.id.value.length < 1) {
   alert("작성자를 입력하세요.");
   Album.name.focus(); 
   return false;
   }

if (Album.pass.value.length < 1) {
   alert("비밀번호를 입력하세요.");
   Album.pass.focus(); 
   return false;
   }

if (Album.title.value.length < 1) {
   alert("글제목을 입력하세요.");
   Album.title.focus(); 
   return false;
        }

if (Album.contents.value.length < 1) {
   alert("글내용을 입력하세요.");
   Album.contents.focus(); 
   return false;
        }

Album.submit();
}

function list()
{
location.href = "listboard.jsp";
}

</SCRIPT>
</HEAD>

<BODY>

<%
String num = request.getParameter("num"); 
String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/test1";


    Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
    Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM tblboard_3 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String name = rs.getString("id");
String title = rs.getString("title");
String contents = rs.getString("contents").trim();
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
String filename = rs.getString("filename");

String s_id = (String)session.getAttribute("sessionId");
String s_pw = (String)session.getAttribute("sessionPw");
%>
                   

<center><font size='3'><b> 사진 수정하기 </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>

<FORM Name='Album' Action='Album_modify_output.jsp'Method='POST' Enctype='multipart/form-data' OnSubmit='return Check()'>
<input type='hidden' name='num' value='<%=num %>'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>작성자</b></center></font> 
      </TD>
      <TD>
          <p><input type='text' size='12' name='id' value = <%= s_id %>> * 필수</p>
      </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>비밀번호</b></center></font>
      </TD>
      <TD>
          <p><input type='password' size='12' name='pass'> * 필수</p>
      </TD>
   </TR>

   
   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>사진</b></center></font>
      </TD>
      <TD>
         <font size='2'>
                           <input type="file" name="userFile">
                           </font>
      </TD>
   </TR>
   
   <TR>
            <TD colspan='2'>
               <hr size='1' noshade>
            </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>글 제목</b></center></font>
      </TD>
      <TD>
         <font size='2'><input type='text' size='70' maxlength='50' name='title'></font>
      </TD>
   </TR>

   <TR>
      <TD bgcolor='cccccc'>
         <font size='2'><center><b>글 내용</b></center></font>
      </TD>
      <TD>
               <font size='2'>
               <textarea cols='70' rows='15' wrap='virtual' name='contents' ></textarea>
               </font>
            </TD>
   </TR>

   <TR>
            <TD colspan='2'>
               <hr size='1' noshade>
            </TD>
   </TR>

   
   <TR>
      <TD colspan='2'><hr size='1' noshade></TD>
   </TR>

   <TR>
      <TD align='center' colspan='2' width='100%'>
      <TABLE>
         <TR>
            <TD width='200' align='center'>
               <input Type = 'Reset' Value = '다시 작성'>
            </TD>
            <TD width='200' align='center'>
               <input Type = 'Button' Value = '수 정 완료' Name='Page' onClick='Check();'>
            </TD>
            <TD width='200' align='center'>
               <input Type = 'Button' Value = '목록' Name='Page' onClick='list();'>
            </TD>
         </TR>
      </TABLE>
      </TD>
   </TR>
   
</TABLE>

<%
}catch(SQLException e){
      out.print("SQL에러 " + e.toString());
}catch(Exception ex){
      out.print("JSP에러 " + ex.toString());
}finally{  
   rs.close();
   pstmt.close();
   conn.close();
}
%>

</BODY>
</HTML>
