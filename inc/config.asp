<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!--#include file="func.asp"-->
<%
'option explicit
Response.Buffer = true
Response.CacheControl = "no-cache"  
Response.Expires = 0
response.charset="utf-8"
session.Timeout = 20


'读取CONFIG设置
set rsCfg=server.createobject("adodb.recordset")
sql="select * from config where id=1"
rsCfg.open sql,conn,1,3
if rsCfg.eof and rsCfg.bof then
	response.write("错误")
else
	xiii_language=rsCfg("xiii_language")
	session("xiii_language") = xiii_language
	xiii_staticpage=rsCfg("xiii_staticpage")
	xiii_sitename=rsCfg("xiii_sitename")
	xiii_siteurl=rsCfg("xiii_siteurl")
	xiii_keywords=rsCfg("xiii_keywords")
	xiii_description=rsCfg("xiii_description")
	xiii_picwidth=rsCfg("xiii_picwidth")
	xiii_picheight=rsCfg("xiii_picheight")	
	xiii_smsname=rsCfg("xiii_smsname")
	xiii_smspass=rsCfg("xiii_smspass")
	xiii_smsurl=rsCfg("xiii_smsurl")
end if
rsCfg.close
set rsCfg=Nothing



'定义常量
xiii_pagesize=10
const uFileType="png|gif|jpg|bmp|rar|zip|doc|swf|rm|ra|ram|mp3|wav|mid|midi|avi|mpg|mpeg|asf|asx|wma|mov"        '允许上传的文件类型，用“|”隔开
const CheckfRequest_Content="你他妈|他妈的|法轮|大法|性交|做爱|日他|日你|日她|操你|操他|操她|我靠你|我靠他|我靠她|反共|搞女人|贱货|贱人|杂种"        '过滤post内容中的字符，用“|”隔开
const CheckfSQL_Content="count(|asc(|mid(|char(|xp_cmdshell|'"        '过滤SQL字符，用“|”隔开
const CheckfQuery_Content="'|and|select|update|chr|delete|%20from|;|insert|mid|master.|set|chr(37)|="        '定义get非法参数,用“|”隔开  
const CheckfForm_Content="||,‖"        '定义post非法参数,用“,”隔开



'用户COOKIE验证(整合BBSXP,未深入研究!!!)
Function Execute(Command)
	'Response.Write Command&"<p>"
	Set Execute = Conn.Execute(Command)
	SqlQueryNum = SqlQueryNum + 1
End Function
Function RequestCookies(CookieName)
	RequestCookies=Request.Cookies(CookieName)
End Function
Function CleanCookies()
	For Each objCookie In Request.Cookies
		ResponseCookies objCookie,"",0
	Next
End Function
Function ResponseCookies(Key,Value,Expires)
	Response.Cookies(Key) = ""&Value&""
	Response.Cookies(Key).Path = SiteConfig("CookiePath")
	if int(Expires)>0 then Response.Cookies(Key).Expires = date+Expires
End Function
Function ResponseApplication(Key,Value)
	Application(SiteConfig("CacheName")&"_"&Key) = Value
End Function
if IsNumeric(RequestCookies("UserID")) then
	sql="Select * from [BBSXP_Users] where UserID="&RequestCookies("UserID")&""
	Set Rs=Execute(sql)
	if Rs.eof then
		CleanCookies()
	elseif RequestCookies("Userpass") <> Rs("Userpass") then
		CleanCookies()
	else
		CookieUserID=Rs("UserID")
		CookieUserName=Rs("UserName")
		CookieUserPass=Rs("UserPass")
		CookieUserEmail=Rs("UserEmail")
		CookieUserMoney=Rs("UserMoney")
		CookieNewMessage=Rs("NewMessage")
		CookieUserAccountStatus=Rs("UserAccountStatus")
		CookieUserRoleID=Rs("UserRoleID")
		CookieUserMate=Rs("UserMate")
		CookieUserRegisterTime=Rs("UserRegisterTime")
		CookieUserPostTime=Rs("UserPostTime")
		CookieModerationLevel=Rs("ModerationLevel")
		CookieReputation=Rs("Reputation")
		CookieTotalPosts=Rs("TotalPosts")
		if CookieUserRoleID=1 or CookieUserRoleID=2 then BestRole=1
	end if
	Rs.Close
	Set Rs=Nothing
end if

'检测SESSION,正式使用时去掉注释
'curUrl =request.ServerVariables("URL")
'if instr(curUrl,"/ls2k8admin/") <> 0 then
'	if session("adminName")="" then
'		session("lastUrl") = request.ServerVariables("URL")
'		Response.Redirect ("login.asp")
'	end if
'end if

'解决UTF-8下报错乱码问题,正式使用时去掉注释
'On Error Resume Next
'Err.Raise 6    '这行是可能出错的代码
'If Err Then
'    Response.Write Err.Description
'    Response.End
'End If
'On Error Goto 0
%>
