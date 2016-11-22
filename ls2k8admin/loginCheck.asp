
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/func.asp"-->
<!--#include file="../inc/md5.asp"-->
<%
Dim userName,userPass
userName=checkfSQLStr(trim(request.form("username")))
userPass=checkfSQLStr(trim(request.form("userpass")))
IF userName="" THEN
	errMsg="对不起，请输入用户名！"
	foundErr=True
ElseIF Userpass="" THEN
	errMsg="对不起，请输入登陆密码！"
	foundErr=True
ElseIF cstr(session("GetCode"))<>request.form("VerifyCode") THEN
	errMsg="对不起，验证码输入不正确！"
	foundErr=True
End IF

IF foundErr=True THEN
	'call loginFail()
Else
	Set rs=server.createobject("adodb.recordset")
	Sql="Select * from admin where adminname='" & Username & "'"
	rs.open Sql,Conn,1,3
	IF rs.Recordcount=0 THEN
		errMsg="登陆失败（无此用户）"
		foundErr=True
	ElseIF rs("adminpass")<>md5(userPass) THEN
		errMsg="登陆失败（密码不正确）"
		foundErr=True
	End IF
	
	IF foundErr=True THEN
		'call loginFail()
	Else
		errMsg="登陆成功"
		foundErr=False
		session("adminName")=userName
		session("adminRealName")=rs("adminrealname")
		session("adminIp")=request.ServerVariables("REMOTE_ADDR")
		session("adminRegion")=getRegion(request.ServerVariables("REMOTE_ADDR"))
		session.Timeout=20
		'call loginSuccess()
	End IF
	rs.close
	set rs=Nothing
	'-------记录登录信息------------
	set rsLog=server.createobject("adodb.recordset")
	sql="Select * from adminlog"
	rsLog.open sql,Conn,1,3
	rsLog.addnew()
	rsLog("adminname")=session("adminName")
	rsLog("adminrealname")=session("adminRealName")
	rsLog("adminip")=session("adminIp")
	rsLog("adminregion")=session("adminRegion")
	rsLog("logdate")=now()
	rsLog("logtype")=errMsg
	rsLog.update
	rsLog.close
	set rsLog=Nothing
End IF

if foundErr = true then
	response.Redirect("login.asp?errMsg="&server.URLEncode(errMsg))
else
	if session("lastUrl") = "" then
		response.Redirect("welcome.asp")
	else
		response.Redirect(session("lastUrl"))
	end if
end if
%>