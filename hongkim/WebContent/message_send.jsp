<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>


<HTML>
<HEAD>
<TITLE> ���������� </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
   
if (Write.msgid.value.length < 1){
   alert("���� ID�� �Է��ϼ���.");
   write.msgid.focus();
   return false;
      }

if (Write.msgtitle.value.length < 1) {
   alert("������ �Է��ϼ���.");
   Write.write_title.focus(); 
   return false;
        }

if (Write.msgcontents.value.length < 1) {
   alert("������ �Է��ϼ���.");
   Write.content.focus(); 
   return false;
        }
else {
	   alert("���� ������ �Ϸ�Ǿ����ϴ�.\n (Ȯ���� �����ø� ���������� �̵��մϴ�)");
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

<center><font size='3'><b> ���� ������ </b></font>                   

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
         <font size='2'><center><b>�ۼ���</b></center></font>
      </TD>
      <TD>
          <font size='2'><input type='text' size='12' name='msgsendid' value = <%= s_id %>></font>
      </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>���� ID</b></center></font>
      </TD>
      <TD>
          <font size='2'><input type='text' size='12' maxlength='12' name='msgid'></font>
          <input type='button' OnClick='Check_id()' value='�޴� ID Ȯ���ϱ�'>
      </TD>
   </TR>

   <TR>
            <TD colspan='2'>
               <hr size='1' noshade>
            </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>����</b></center></font>
      </TD>
      <TD>
         <font size='2'><input type='text' size='70' maxlength='50' name='msgtitle'></font>
      </TD>
   </TR>

   <TR>
      <TD bgcolor='cccccc'>
         <font size='2'><center><b>����</b></center></font>
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
               <input Type = 'Reset' Value = '�ٽ� ����'>
            </TD>
            <TD width='200' align='center'>

               <input Type = 'submit' Value = '���' Name='Page'>
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
�α����� �ʿ��� �������Դϴ�. <br>
<a href="login_main.jsp">ù ȭ������ �̵��ϱ�</a>
</center>
<%} %>