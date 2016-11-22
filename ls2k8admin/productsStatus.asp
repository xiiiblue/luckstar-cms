
<!--#include file="../inc/config.asp"-->
<%
dim action,toggle,proid,proshow,proup,procommend,prohot,rs,sql
action = request("action")
proid = request("proid")
toggle = request("toggle")
if proid<>"" then
	sql = "select * from product where proid = "&cstr(proid)
	set rs = conn.execute(sql)
	proshow = rs("proshow")
	proup = rs("proup")
	procommend = rs("procommend")
	prohot = rs("prohot")
	if proshow="" then
		prowshow=0 
	end if
	if proup="" then
		proup=0 
	end if
	if procommend="" then
		procommend=0 
	end if
	if prohot="" then
		prohot=0 
	end if
	
	proshow = proshow xor 1
	proup = proup xor 1
	procommend = procommend xor 1
	prohot = prohot xor 1
	
	if toggle = "show" then
		sql = "update product set proshow = "&proshow&" where proid="&proid
	elseif toggle = "up" then
		sql = "update product set proup = "&proup&" where proid="&proid
	elseif toggle = "commend" then
		sql = "update product set procommend = "&procommend&" where proid="&proid
	elseif toggle = "hot" then
		sql = "update product set prohot = "&prohot&" where proid="&proid
	end if
	'response.Write(sql)
	conn.execute(sql)
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
</head>
<body>
<script>window.history.go(-1)</script>
</body>
</html>