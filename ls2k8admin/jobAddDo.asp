
<!--#include file="../inc/config.asp"-->
<%
'接收表单(未加判断!!!!)
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from job"
rs.open sql,conn,1,3
rs.addnew
rs("jobname_cn")=Request.Form("jobname_cn")
rs("jobname_en")=Request.Form("jobname_en")
rs("jobnumber")=Request.Form("jobnumber")
rs("jobpay")=Request.Form("jobpay")

if Request.Form("jobdate") = "" then
	rs("jobdate")="2010-1-1"
else
	rs("jobdate")=Request.Form("jobdate")
end if
rs("jobaddress_cn")=Request.Form("jobaddress_cn")
rs("jobaddress_en")=Request.Form("jobaddress_en")
rs("jobduties_cn")=Request.Form("jobduties_cn")
rs("jobduties_en")=Request.Form("jobduties_en")
rs("jobcontent_cn")=Request.Form("jobcontent_cn")
rs("jobcontent_en")=Request.Form("jobcontent_en")
rs("jobstate")=Request.Form("jobstate")
rs("sysdate") =  now()
rs.update
rs.close
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<script>alert("添加成功");window.history.go(-1);</script>
</body>
</html>
