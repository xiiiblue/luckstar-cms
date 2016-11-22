<!--#include file="../inc/bbs.asp"-->
<!--#include file="../inc/config.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Luck-Star</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
</head>
<body style="background:none;">
<%
'HtmlTop

if Request("menu")="OUT" then
		'if Request.ServerVariables("Request_method") <> "POST" then error("提交方式错误！")
		Execute("Delete from [BBSXP_UserOnline] where sessionid='"&session.sessionid&"'")
		CleanCookies()
		'response.Redirect("reload.asp")
		succeed "已经成功退出","reload.asp"
		
elseif Request.ServerVariables("Request_method") = "POST" then
	ReturnUrl=Request.Form("ReturnUrl")

	if SiteConfig("EnableAntiSpamTextGenerateForLogin")=1 then
		if Request.Form("VerifyCode")<>Session("VerifyCode") or Session("VerifyCode")="" then error("验证码错误！")
	end if

	UserName=HTMLEncode(Request.Form("UserName"))
	
	UserPass=Trim(Request.Form("UserPass"))





	if UserName=empty then error("用户名没有输入")
	sql="Select * from [BBSXP_Users] where UserName='"&UserName&"'"
	rs.Open sql,Conn,1,3
		if Rs.eof then error("此用户名还未注册")
		if Rs("UserAccountStatus")=0 then error("您的帐号正在等待审核")
		if Rs("UserAccountStatus")=2 then error("您的帐号已被禁用！")
		if Rs("UserAccountStatus")=3 then error("您的帐号尚未通过审核")
		
		if SiteConfig("AllowLogin")=0 and Rs("UserRoleID")<>1 then error("除管理员外任何人都不允许登录！")
		
		
		if Len(Rs("Userpass"))=16 then
			if LCASE(mid(md5(UserPass),9,16))<>Rs("UserPass") then error("您输入的密码错误")
		elseif Len(Rs("Userpass"))=32 then
			if md5(UserPass)<>Rs("UserPass") then error("您输入的密码错误")
		elseif Len(Rs("Userpass"))=40 then
			if SHA1(UserPass)<>Rs("UserPass") then error("您输入的密码错误")
		else
			if UserPass<>Rs("UserPass") then error("您输入的密码错误")
		end if

		Rs("Userpass")=DefaultPasswordFormat(UserPass)
		Rs("UserActivityTime")=""&now()&""
		Rs("UserActivityIP")="'"&REMOTE_ADDR&"'"
		Rs.update

		if Request("Invisible")="1" then
			Invisible="1"
		else
			Invisible="0"
		end if
		if Request("IsSave")="1" then
			Expires=9999
		else
			Expires=0
		end if
		ResponseCookies "UserID",Rs("UserID"),Expires
		ResponseCookies "UserPass",Rs("UserPass"),Expires
		ResponseCookies "Invisible",Invisible,Expires
	rs.close
	
	Session("VerifyCode")=""
	
	if ""&ReturnUrl&""<>"" and instr(ReturnUrl,"login.asp")=0 then
		response.redirect ReturnUrl
	else
		response.redirect ""&SiteConfig("SiteUrl")&"/Default.asp"
	end if
	
end if

%>
<div class="loginContainer">
<form action="userLogin.asp" method="POST" name=form>
	<input type="hidden" value="reload.asp" name="ReturnUrl">
	<table width=320 align="center" cellpadding=5 cellspacing=1 id=CommonListArea>
		<tr id=CommonListTitle>
			<td align="center" colspan="2"><strong>用户登录</strong></td>
		</tr>
		<tr id=CommonListCell>
			<td width="25%" align="right">用户名称：</td>
			<td width="75%">
				<input type="text" name="UserName" value="<%=CookieUserName%>" class="loginText">
		  </td>
		</tr>
		<tr id=CommonListCell>
			<td width="25%" align="right">用户密码：</td>
			<td>
				<input type="password" name="Userpass" class="loginText">
			</td>
		</tr>
		<%if SiteConfig("EnableAntiSpamTextGenerateForLogin")=1 then%>
		<tr id=CommonListCell>
			<td width="25%" align="right">验 证 码：</td>
			<td>
				<input type="text" name="VerifyCode" MaxLength="4" size="10" onBlur="CheckVerifyCode(this.value)" onKeyUp="if (this.value.length == 4)CheckVerifyCode(this.value)"> <img src="VerifyCode.asp" title="验证码,看不清楚?请点击刷新验证码" style="cursor:pointer" onClick="this.src='VerifyCode.asp?'+Math.random()"> <span id="CheckVerifyCode" style="color:red"></span>
			</td>
		</tr>
		<%end if%>
		<tr id=CommonListCell>
			<td align="right" width="25%">登录方式：</td>
			<td>
				<input type="checkbox" value="1" name="IsSave" id="IsSave"><label for="IsSave">自动登录</label>
				<input type="checkbox" value="1" name="Invisible" id="Invisible"><label for="Invisible">隐身登录</label>
			</td>
		</tr>
		<tr id=CommonListCell>
			<td align="center" colspan="2">
				<input type="submit" value=" 登录 ">
				<input type="reset" value=" 取消 " onClick="window.parent.location.reload();">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>