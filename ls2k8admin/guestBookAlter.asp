
<!--#include file="../inc/config.asp"-->
<%

if isempty(request("action")) then 
	action = ""
else
	action = request("action")
end if
if isempty(request("gbid")) then 
	gbid = ""
else
	gbid = cstr(request("gbid"))
end if



'------------删除----------------
if action = "del" and gbid <> "" then
	sql = "delete from guestbook where gbid in ("&gbid&")"
	'response.Write(sql)
	Set rs = Server.CreateObject("ADODB.Recordset")
		rs.open sql,conn,1,3
	set rs = nothing
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

