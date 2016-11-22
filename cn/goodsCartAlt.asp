<!--#include file="../inc/config.asp"-->
<%
action = request("action")
goodsid = request("goodsid")
goodsnumber = request("goodsnumber")
if action = "del" then
	sql = "delete from goodscart where goodsid in ("&goodsid&")"
	conn.execute(sql)
elseif action = "modify" then
	sql = "update goodscart set goodsnumber = "&goodsnumber&" where goodsid = "&goodsid
	conn.execute(sql)
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
	window.location.href="goodsCart.asp";
</script>
</body>
</html>