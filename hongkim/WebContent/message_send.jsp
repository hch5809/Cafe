<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>


<HTML>
<HEAD>
<TITLE> 쪽지보내기 </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
   
if (Write.msgid.value.length < 1){
   alert("보낼 ID를 입력하세요.");
   write.msgid.focus();
   return false;
      }

if (Write.msgtitle.value.length < 1) {
   alert("제목을 입력하세요.");
   Write.write_title.focus(); 
   return false;
        }

if (Write.msgcontents.value.length < 1) {
   alert("내용을 입력하세요.");
   Write.content.focus(); 
   return false;
        }
else {
	   alert("쪽지 전송이 완료되었습니다.\n (확인을 누르시면 쪽지함으로 이동합니다)");
	   location.href="main.jsp";
	   Write.content.focus(); 
	   return false;
	        }

Write.submit();
}

function Check_id() 
{
browsing_window = window.open("send_checkid.jsp?id="+Write.msgid.value, "_idcheck","height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
}


</SCRIPT>
</HEAD>

<BODY>


<% 
String s_id = (String)session.getAttribute("sessionId");

if(session.getAttribute("sessionId") != null) {%>

<center><font size='3'><b> 쪽지 보내기 </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>

<FORM Name='Write' Action='message_input.jsp' Method='post' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>작성자</b></center></font>
      </TD>
      <TD>
          <font size='2'><input type='text' size='12' name='msgsendid' value = <%= s_id %>></font>
      </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>보낼 ID</b></center></font>
      </TD>
      <TD>
          <font size='2'><input type='text' size='12' maxlength='12' name='msgid'></font>
          <input type='button' OnClick='Check_id()' value='받는 ID 확인하기'>
      </TD>
   </TR>

   <TR>
            <TD colspan='2'>
               <hr size='1' noshade>
            </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>제목</b></center></font>
      </TD>
      <TD>
         <font size='2'><input type='text' size='70' maxlength='50' name='msgtitle'></font>
      </TD>
   </TR>

   <TR>
      <TD bgcolor='cccccc'>
         <font size='2'><center><b>내용</b></center></font>
      </TD>
      <TD>
               <font size='2'>
               <textarea cols='70' rows='15' wrap='virtual' name='msgcontents' ></textarea>
               </font>
            </TD>
   </TR>

   <TR>
            <TD colspan='2'>
               <hr size='1' noshade>
            </TD>
   </TR>

   <TR>
      <TD align='center' colspan='2' width='100%'>
      <TABLE>
         <TR>
            <TD width='100' align='center'>
               <input Type = 'Reset' Value = '다시 쓰기'>
            </TD>
            <TD width='200' align='center'>

               <input Type = 'submit' Value = '등록' Name='Page'>
            </TD>
         </TR>
      </TABLE>
      </TD>
   </TR>
   
</TABLE>

</FORM>

</BODY>
</HTML>

<%
}

else {%>
<center>
로그인이 필요한 페이지입니다. <br>
<a href="login_main.jsp">첫 화면으로 이동하기</a>
</center>
<%} %>