<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<body>
<%
extaddress = request("extaddress")
extmemo = request("extmemo")
sql="select * from goodsOrder where sessionid='"&session.SessionID&"'"
set rs = conn.execute(sql)
if rs.eof and rs.bof then
	sql = "insert into goodsOrder (sessionid,userid,sysdate,extaddress,extmemo) values ('"&session.SessionID&"',"&CookieUserID&",'"&now()&"','"&extaddress&"','"&extmemo&"')"
	conn.execute(sql)
%>
<table cellspacing="1" cellpadding="5" width=100% id=CommonListArea>
	<tr id=CommonListTitle>
		<td width="100%" colspan="2" align="center">提示信息</td>
	</tr>
	<tr id=CommonListCell>
		<td valign="top" align="Left" colspan="2" height="122">
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
				<td width="83%" valign="top"><b>订单提交成功：</b><ul>我们会及时给您回复！</ul></td>
				<td width="17%"><img height="97" src="images/succ.gif" width="95" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr align="center" id=CommonListCell>
		<td valign="center" colspan="2"><input onClick="window.parent.location.reload();" type="button" value="<<关闭窗口>>" /></td>
	</tr>
</table>
<%
else
%>
<table cellspacing="1" cellpadding="5" width=100% id=CommonListArea>
	<tr id=CommonListTitle>
		<td width="100%" colspan="2" align="center">提示信息</td>
	</tr>
	<tr id=CommonListCell>
		<td valign="top" align="Left" colspan="2" height="122">
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
				<td width="83%" valign="top"><b>订单提交失败：</b><ul>请不要重复提交订单，重新登录后方可再次提交！</ul></td>
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
end if
%>

</body>
</html>