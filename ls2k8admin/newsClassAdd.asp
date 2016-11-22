
<!--#include file="../inc/config.asp"-->
<%
dim parentId,classname_cn,classname_en,sql,rs,parentCode,selfCode,errMsg
errMsg = "无效的参数"
parentId = request("parentId")
classname_cn = request("classname_cn")
classname_en = request("classname_en")

sql = "select * from newsclass where id = "&parentId
set rs = conn.execute(sql)
if rs.eof and rs.bof then
	parentCode = ""
else
	parentCode = rs("classcode")
end if

sql = "select top 1 * from newsclass where classcode like '"&parentCode&"____' order by classcode desc"
set rs = conn.execute(sql)
if rs.eof and rs.bof then
	selfCode = parentCode&"0001"
else
	selfCode = cint(right(rs("classcode"),4))+1
	selfCode = right("0000"&cstr(selfCode),4)
	selfCode = parentCode&selfCode
end if
sql = "insert into newsclass (classname_cn,classname_en,classcode)"
sql = sql&" values ('"&classname_cn&"','"&classname_en&"','"&selfCode&"')"
conn.execute(sql)
errMsg = "添加成功"

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>
<script>window.history.go(-1);</script>
</body>
</html>
