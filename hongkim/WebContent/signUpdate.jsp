<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
<SCRIPT LANGUAGE="JavaScript">
function Check() 
{

if (Member_Input.pass.value.length < 1){
   alert("��й�ȣ�� �Է��ϼ���.");
   Member_Input.pass.focus();
   return false;
   }

if (Member_Input.name.value.length < 1){
   alert("�̸��� �Է��ϼ���.");
   Member_Input.name.focus();
   return false;
   }

Member_Input.submit();
}

function Check_id() 
{
browsing_window = window.open("checkid.jsp?id="+Member_Input.id.value, "_idcheck","height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
}

</SCRIPT>     

</head>
<body>
<%String s_id = (String)session.getAttribute("sessionId"); %>
<center><font size='3'><b> ȸ������ ���� </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>

<FORM Name='Member_Input' Method='post' Action='signUpdate_input.jsp'>

<TABLE  border='2' cellSpacing=0 cellPadding=5 align=center>


<TR>
   <TD bgcolor='ffffff' align='center'>
      <font size='2'>ID</font>
   </TD>
   <TD bgcolor='ffffff'>
      <p><input type='text' size='12' name='id' value = <%= s_id %>></p>
   </TD>
</TR>

<TR>
   <TD bgcolor='ffffff' align='center'>
      <font size='2'>�� ��</font>
   </TD>
   <TD bgcolor='ffffff'>
      <input type='text' maxLength='10' size='10' name='name'>
   </TD>
</TR>

<TR>
   <TD bgcolor='ffffff' align='center'>
      <font size='2'>�� �� �� ȣ</font>
   </TD>
   <TD bgcolor='ffffff'>
      <input type='password' maxLength='10' size='10' name='pass'>
   </TD>
</TR>


<TR>
   <TD bgcolor='ffffff' align='center'>
      <font size='2'>�л�</font>
   </TD>
   <TD bgcolor='ffffff'>
     <input type=radio name='student' value='�ʵ��л�'> �ʵ��л�
     <input type=radio name='student' value='���л�'> ���л�
     <input type=radio name='student' value='����л�'> ����л�
     <input type=radio name='student' value='���л�'> ���л�
   </TD>
</TR>

<TR>
   <TD bgcolor='ffffff' align='center'>
      <font size='2'>�� ȭ �� ȣ</font>
   </TD>
   <TD bgcolor='ffffff'>
      <input type='text' maxlength='20' size='20' name='phone'>
   </TD>
</TR>

</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>

<TABLE>
<TR>
   <TD colspan='2' align='center'>
      <input type='button' OnClick='Check()' value='ȸ������ ����'>
   </TD>
</TR>
</TABLE>

</FORM>


</body>
</html>