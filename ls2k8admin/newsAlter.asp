
<!--#include file="../inc/config.asp"-->
<%
dim action,proid,sql,rs,proclassid,proorderid,proorder
if isempty(request("action")) then 
	action = ""
else
	action = request("action")
end if
if isempty(request("proid")) then 
	proid = ""
else
	proid = cstr(request("proid"))
end if

if isempty(request("proClass")) then 
	proclassid = 0
else
	proclassid = clng(request("proClass"))
end if

if isempty(request("proorderid")) then 
	proorderid = ""
else
	proorderid = cstr(request("proorderid"))
end if

if isempty(request("proorder")) then 
	proorder = ""
else
	proorder = cstr(request("proorder"))
end if

'------------删除----------------
if action = "del" and proid <> "" then
	sql = "delete from news where proid in ("&proid&")"
	'response.Write(sql)
	Set rs = Server.CreateObject("ADODB.Recordset")
		rs.open sql,conn,1,3
	set rs = nothing
end if
'------------移动----------------
if action = "move" and proid <> "" and proclassid<>0 then
	sql = "update news set proclassid = "&proclassid&" where proid in ("&proid&")"
	'response.Write(sql)
	Set rs= Server.CreateObject("ADODB.Recordset")
		rs.open sql,conn,1,3
	set rs=nothing
end if
'------------排序----------------
if action = "order" and proorderid <> "" and proorder <> "" then
	'response.write proorderid&"<br>"&proorder
	dim proorderids,proorders
	proorderids = Split(proorderid, ",", -1, 1)
	proorders = Split(proorder, ",", -1, 1)
	dim i
	for i = 0 to ubound(proorderids)
		sql = "update news set proorder = "&proorders(i)&" where proid = "&proorderids(i)
		conn.execute(sql)
	next
end if

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>product_add_do</title>
</head>
<body>
<script>
alert("操作成功");
window.history.go(-1);
</script>
</body>
</html>
