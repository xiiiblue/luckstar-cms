
<!--#include file="../inc/config.asp"-->
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from config where id = 1"
rs.open sql,conn,1,3
rs("xiii_language") = Request.Form("xiii_language")
rs("xiii_staticpage") = Request.Form("xiii_staticpage")
rs("xiii_sitename") = Request.Form("xiii_sitename")
rs("xiii_siteurl") = Request.Form("xiii_siteurl")
rs("xiii_keywords") = Request.Form("xiii_keywords")
rs("xiii_description") = Request.Form("xiii_description")
rs("xiii_picwidth") = Request.Form("xiii_picwidth")
rs("xiii_picheight") = Request.Form("xiii_picheight")
rs("xiii_smsname") = Request.Form("xiii_smsname")
rs("xiii_smspass") = Request.Form("xiii_smspass")
rs("xiii_smsurl") = Request.Form("xiii_smsurl")
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
<script>alert("设置成功");window.history.go(-1);</script>
</body>
</html>
