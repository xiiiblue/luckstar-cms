
<!--#include file="../inc/config.asp"-->
<%
dim classId,parentClassId,sql,rs,classCode,classNameEn,classNameCn,selfCode,selfLevel,parentCode,parentLevel,leftCode,errMsg
'接收表单
if isEmpty(request("classId")) then
	classId = 0
else
	classId = cint(request("classId"))
end if
if isEmpty(request("parentClassId")) then
	parentClassId = 0
else
	parentClassId = cint(request("parentClassId"))
end if
if isEmpty(request("classCode")) then
	classCode = ""
else
	classCode = cstr(request("classCode"))
end if
if isEmpty(request("classname_cn")) then
	classNameCn = ""
else
	classNameCn = cstr(request("classname_cn"))
end if
if isEmpty(request("classname_en")) then
	classNameEn = ""
else
	classNameEn = cstr(request("classname_en"))
end if

if classId <> 0 then
	'更新中英文名称
	sql = "update productclass set classname_cn = '"&classNameCn&"' ,classname_en = '"&classNameEn&"' where id ="&classId
	conn.execute(sql)
	
	'提取本类的参数
	sql = "select * from productclass where id ="&classId
	set rs = conn.execute(sql)
	if rs.eof and rs.bof then
		'response.write("无此分类")
		errMsg = "无此分类"
		response.End()
	else
		selfCode = rs("classcode")
		selfLevel = len(selfCode)/4
	end if
	'提取要移到的你类的参数
	sql = "select * from productclass where id = "&parentClassId
	set rs = conn.execute(sql)
	if rs.eof and rs.bof then
		'假设为根栏目
		parentCode = ""
		parentLevel = 0
	else
		parentCode = rs("classcode")
		parentLevel = len(parentCode)/4
	end if
	'response.write selfCode&"<br>"&selfLevel&"<br>"&parentCode&"<br>"&parentLevel
	
	'判断,不能移到自己或自己的子类中
	if left(parentCode,selfLevel*4) = selfCode then
		'response.write("不能移动到自己或自己的子分类中")
		errMsg = "不能移动到自己或自己的子分类中"
	elseif left(selfCode,selfLevel*4-4) = parentCode then
		'response.write("不移动")
		errMsg = "更新成功(未移动)"
	else
		'取左边CODE
		sql = "select top 1 * from productclass where classcode like '"&parentCode&"____' order by classcode desc"
		'response.Write "<h2>"&sql&"</h2>"
		set rs = conn.execute(sql)
		'response.write "<h2>"&rs("classcode")&"</h2>"
		if rs.eof and rs.bof then
			leftCode = parentCode&"0001"
		else
			leftCode = cint(right(rs("classcode"),4))+1
			leftCode = right("0000"&cstr(leftCode),4)
			leftCode = parentCode&leftCode
		end if
		'response.write "<br>"&leftCode
		sql = "update productclass set classcode='"&leftCode&"'+mid(classcode,"&(selfLevel*4+1)&",len(classcode)) where classcode like'"&selfCode&"%'"
		'response.write sql
		conn.execute(sql)
		'response.write("成功")
		errMsg = "更改成功"
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
<script>alert("<%=errMsg%>");window.history.go(-1);</script>
</body>
</html>
