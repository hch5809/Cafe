<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>


<HTML>
<HEAD>
<TITLE> �Խ��� </TITLE>

<SCRIPT language="JavaScript">
function Check()
{

if (Write.title.value.length < 1) {
   alert("�������� �Է��ϼ���.");
   Write.write_title.focus(); 
   return false;
        }

if (Write.contents.value.length < 1) {
   alert("�۳����� �Է��ϼ���.");
   Write.content.focus(); 
   return false;
        }

Write.submit();
}

</SCRIPT>
</HEAD>

<BODY>


<% 
String s_id = (String)session.getAttribute("sessionId");
String s_pw = (String)session.getAttribute("sessionPw");

if(session.getAttribute("sessionId") != null) {%>

<center><font size='3'><b> �Խ��� �۾��� </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>

<FORM Name='Write' Action='write11_input.jsp' Method='post' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>�ۼ���</b></center></font> 
      </TD>
      <TD>
          <p><input type='text' size='12' name='id' value = <%= s_id %>> </p>
      </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>��й�ȣ</b></center></font>
      </TD>
      <TD>
          <p><input type='password' size='12' name='pass' value = <%= s_pw %>> </p>
      </TD>
   </TR>

   
   <TR>
            <TD colspan='2'>
               <hr size='1' noshade>
            </TD>
   </TR>

   <TR>
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>�� ����</b></center></font>
      </TD>
      <TD>
         <font size='2'><input type='text' size='70' maxlength='50' name='title'></font>
      </TD>
   </TR>

   <TR>
      <TD bgcolor='cccccc'>
         <font size='2'><center><b>�� ����</b></center></font>
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
      <TD align='center' colspan='2' width='100%'>
      <TABLE>
         <TR>
            <TD width='100' align='center'>
               <input Type = 'Reset' Value = '�ٽ� ����'>
            </TD>
            <TD width='200' align='center'>

               <input Type = 'Button' Value = '���' Name='Page' onClick='Check();'>
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
�α����� �ʿ��� �������Դϴ�.
<a href="login_main.jsp">ù ȭ������ �̵��ϱ�</a>
<%} %>