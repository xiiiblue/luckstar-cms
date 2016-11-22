<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
<%
'简单防SPAM
sql = "select count(gbid) from guestbook where userip='"&request.ServerVariables("REMOTE_ADDR")&"' and sysdate like '"&left(now(),10)&"%'"
set rs=conn.execute(sql)
if rs(0) >3 then
%>
<table cellspacing="1" cellpadding="5" width=100% id=CommonListArea>
	<tr id=CommonListTitle>
		<td width="100%" colspan="2" align="center">提示信息</td>
	</tr>
	<tr id=CommonListCell>
		<td valign="top" align="Left" colspan="2" height="122">
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
				<td width="83%" valign="top"><b>错误：</b><ul>您今日留言次数己达上限！</ul></td>
				<td width="17%"><img height="97" src="images/err.gif" width="95" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr align="center" id=CommonListCell>
		<td valign="center" colspan="2"><input onClick="window.parent.location.reload();" type="button" value="<<关闭窗口>>" /></td>
	</tr>
</table>
<%
response.End()
end if


'接收表单(未加判断!!!!)
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from guestbook"
rs.open sql,conn,1,3
rs.addnew
rs("gbname")=Request.Form("gbname")
rs("gbphone")=Request.Form("gbphone")
rs("gbmail")=Request.Form("gbmail")
rs("gbcontact")=Request.Form("gbcontact")
rs("gbcontent")=Request.Form("gbcontent")
rs("gbclass")=Request.Form("gbclass")
rs("gbreply")=Request.Form("gbreply")
rs("userip") =  request.ServerVariables("REMOTE_ADDR")
rs("sysdate") =  now()
rs.update
rs.close
%>
<table cellspacing="1" cellpadding="5" width=100% id=CommonListArea>
	<tr id=CommonListTitle>
		<td width="100%" colspan="2" align="center">提示信息</td>
	</tr>
	<tr id=CommonListCell>
		<td valign="top" align="Left" colspan="2" height="122">
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
				<td width="83%" valign="top"><b>留言成功：</b><ul>我们会及时给您回复！</ul></td>
				<td width="17%"><img height="97" src="images/succ.gif" width="95" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr align="center" id=CommonListCell>
		<td valign="center" colspan="2"><input onClick="window.parent.location.reload();" type="button" value="<<关闭窗口>>" /></td>
	</tr>
</table>
</body>
</html>
