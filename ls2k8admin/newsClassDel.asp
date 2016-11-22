
<!--#include file="../inc/config.asp"-->
<%
dim classId,sql,rs,classCode,errMsg
errMsg = "无效的参数"
if isEmpty(request("classId")) then
	classId = 0
else
	classId = cint(request("classId"))
end if

if classId <> 0 then
	sql = "select * from newsclass where id = "&classId
	'response.write sql
	set rs = conn.execute(sql)
	if rs.eof and rs.bof then
		'response.write("无此分类")
		errMsg = "无此分类"
	else
		classCode = rs("classcode")
		sql = "select count(id) as cCount from newsclass where classcode like '"&classCode&"%'"
		set rs = conn.execute(sql)
		if rs("cCount") = 1 then
			'判断内容是否己清空
			sql = "select count(proid) as pCount from news where proclassid = "&classId
			set rs = conn.execute(sql)
			if rs("pCount") = 0 then
				sql = "delete from newsclass where id = "&classId
				conn.execute(sql)
				'response.write("删除成功")
				errMsg = "删除成功"
			else
				'response.write("此栏目下仍有产品，请清空后再删除")
				errMsg = "此栏目下有产品，无法删除"
			end if
		else
			'response.write("此栏目下有子分类，请清除或移动后再删除")
			errMsg = "此栏目下有子分类,无法删除"
		end if
	end if
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<body>
<script>window.history.go(-1);</script>
</html>
