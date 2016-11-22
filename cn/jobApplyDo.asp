<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/config.asp"-->
<%
'接收表单(未加判断!!!!)
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from jobapply"
rs.open sql,conn,1,3
rs.addnew
rs("jobid")=Request.Form("jobid")
rs("applyname")=Request.Form("applyname")
rs("applysex")=cint(Request.Form("applysex"))
rs("applyage")=Request.Form("applyage")
rs("applyintro")=Request.Form("applyintro")
rs("applyhistory")=Request.Form("applyhistory")
rs("applyphone")=Request.Form("applyphone")
rs("applydate") =  now()
rs.update
rs.close
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
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
