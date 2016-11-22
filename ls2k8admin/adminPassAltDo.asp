
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/md5.asp"-->
<%
dim errMsg,foundErr
foundErr = false
errMsg = "未知状态"

if isempty(request.Form("adminpass")) or isempty(request.Form("adminpass1")) or isempty(request.Form("adminpass2")) or isempty(request.Form("adminname"))  or isempty(request.Form("adminrealname")) or request.Form("adminpass")=""  or request.Form("adminpass1")="" or request.Form("adminpass2")="" or request.Form("adminname")="" or request.Form("adminrealname")="" then
	errMsg="没有填写完整,请重新输入!"
	foundErr=True
end if
if request.Form("adminpass1") <> request.Form("adminpass2") then
	errMsg="两次密码不一致,请重新输入!"
	foundErr=True
end if

if foundErr=False then
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql="select * from admin where adminname='"&session("adminname")&"'"
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		errMsg="无此用户,请重新登录!"
		foundErr=true
	else
		if rs("adminpass") <> md5(request.Form("adminpass"))then
			errMsg="原始密码输入错误,请重新输入!"
			foundErr=true
		else
			rs("adminname") = request.Form("adminname")
			rs("adminrealname") = request.Form("adminrealname")
			rs("adminpass") = md5(request.Form("adminpass1"))
			rs.update
			errMsg="更新成功,新用户名是"&request.Form("adminname")
			foundErr=false
		end if
	end if
	rs.close
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
		<table width="100%" border="1" cellspacing="0" bordercolor="#999999">
			<tr style="FONT-WEIGHT: bold; COLOR: #dddddd; BACKGROUND-COLOR: #999999">
				<td noWrap>Field Name&nbsp;&nbsp;</td>
				<td>Value</td>
			</tr>
			<%
			Dim sForm
			For Each sForm in Request.Form
			%>
			<tr>
				<td valign="top" nowrap><b><%=sForm%></b></td>
				<td width="100%" style="white-space:pre"><%=Server.HTMLEncode( Request.Form(sForm) )%></td>
			</tr>
			<% Next %>
		</table>
<script>alert("<%=errMsg%>");window.history.go(-1);</script>
</body>
</html>
