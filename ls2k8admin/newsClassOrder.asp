
<!--#include file="../inc/config.asp"-->
<%
dim rs,sql,classIdA,classIdB,classCodeA,classCodeB,classLevel,action,errMsg
errMsg = "无效的参数"
set rs=server.CreateObject("ADodb.Recordset")  
classIdA=request("classId") 
sql="select * from newsclass where id = "&classIdA
rs.open sql,conn,1,1
	classCodeA = rs("classcode")
	classLevel = len(classCodeA)/4
rs.close

action = request("action")
if action ="up" or action = "down" then
	dim wStr:wStr = " and left(classcode,"&(classLevel*4-4)&")='"&Left(classCodeA,classLevel*4-4)&"'"
	if action = "up" then
		sql = "select top 1 * from newsclass where len(classcode) = "&(classLevel*4)&" and val(classcode) < "&classCodeA&wStr&" order by classcode desc"
	elseif action = "down" then
		sql = "select top 1 * from newsclass where len(classcode) = "&(classLevel*4)&" and val(classcode) > "&classCodeA&wStr&" order by classcode"
	end if
	
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
		'response.write("无法移动")
		errMsg = "己是尽头,无法移动"
	else
		classCodeB = rs("classcode")
		classIdB = rs("id")
		
		'response.write classCodeA&"<br>"&classIdA&"<br>"
		'response.write classCodeB&"<br>"&classIdB&"<br>"
		'开始互换
		sql = "update newsclass set classcode='"&string(classLevel*4,"X")&"'+mid(classcode,"&(classLevel*4+1)&",len(classcode)) where left(classcode,"&(classLevel*4)&")='"&classCodeB&"'"
		conn.execute(sql)
		'response.Write sql&"<br>"
		sql = "update newsclass set classcode='"&classCodeB&"'+mid(classcode,"&(classLevel*4+1)&",len(classcode)) where left(classcode,"&(classLevel*4)&")='"&classCodeA&"'"
		conn.execute(sql)
		'response.Write sql&"<br>"
		sql = "update newsclass set classcode='"&classCodeA&"'+mid(classcode,"&(classLevel*4+1)&",len(classcode)) where left(classcode,"&(classLevel*4)&")='"&string(classLevel*4,"X")&"'"
		conn.execute(sql)
		'response.Write sql&"<br>"
		errMsg = "移动成功"
	end if
	rs.close
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
