
<!--#include file="../inc/config.asp"-->
<%
dim action,proid,sql,rs,proclassid,proorderid,proorder
if isempty(request("action")) then 
	action = ""
else
	action = request("action")
end if
if isempty(request("jobid")) then 
	jobid = ""
else
	jobid = cstr(request("jobid"))
end if


if isempty(request("joborderid")) then 
	joborderid = ""
else
	joborderid = cstr(request("joborderid"))
end if

if isempty(request("joborder")) then 
	joborder = ""
else
	joborder = cstr(request("joborder"))
end if

'------------删除----------------
if action = "del" and jobid <> "" then
	sql = "delete from job where jobid in ("&jobid&")"
	'response.Write(sql)
	Set rs = Server.CreateObject("ADODB.Recordset")
		rs.open sql,conn,1,3
	set rs = nothing
end if
'------------排序----------------
if action = "order" and joborderid <> "" and joborder <> "" then
	'response.write proorderid&"<br>"&proorder
	dim joborderids,joborders
	joborderids = Split(joborderid, ",", -1, 1)
	joborders = Split(joborder, ",", -1, 1)
	dim i
	for i = 0 to ubound(joborderids)
		sql = "update job set joborder = "&joborders(i)&" where jobid = "&joborderids(i)
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

