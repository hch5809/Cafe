<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<SCRIPT language="JavaScript">
function Check()
{
if (Video.name.value.length < 1) {
   alert("�ۼ��ڸ� �Է��ϼ���.");
   Video.name.focus(); 
        return false;
   }

if (Video.pass.value.length < 1) {
   alert("��й�ȣ�� �Է��ϼ���.");
   Video.pass.focus(); 
   return false;
   }


if (Video.title.value.length < 1) {
   alert("�������� �Է��ϼ���.");
   Video.write_title.focus(); 
   return false;
        }

if (Video.contents.value.length < 1) {
   alert("�۳����� �Է��ϼ���.");
   Video.content.focus(); 
   return false;
        }

Video.submit();
}

</SCRIPT>

</head>
<body>

<% 
String s_id = (String)session.getAttribute("sessionId");
String s_pw = (String)session.getAttribute("sessionPw");

if(session.getAttribute("sessionId") != null) {%>

<center><font size='3'><b> ���� ����ϱ� </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>

<FORM Name='Video' Action='video_input.jsp' Method='POST' Enctype='multipart/form-data' OnSubmit='return Check()'>

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
      <TD width='100' bgcolor='cccccc'>
         <font size='2'><center><b>����</b></center></font>
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
               <input Type = 'Reset' Value = '�ٽ� �ۼ�'>
            </TD>
            <TD width='200' align='center'>
               <input Type = 'Submit' Value = '������'>
            </TD>
         </TR>
      </TABLE>
      </TD>
   
</TABLE>

</FORM>


<%
}

else {%>
�α����� �ʿ��� �������Դϴ�.
<a href="login_main.jsp">ù ȭ������ �̵��ϱ�</a>
<%} %>

</body>
</html>