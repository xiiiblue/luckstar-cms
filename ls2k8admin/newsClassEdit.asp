
<!--#include file="../inc/config.asp"-->
<%
dim classId,sql,rs,classCode,classNameEn,classNameCn,parentClassId
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
		response.write("无此分类")
	else
		classNameEn = rs("classname_en")
		classNameCn = rs("classname_cn")
	end if
end if
parentClassId = getParentClass("newsclass",classId)
'response.write(parentClassId)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
<table width="292" border="1" align="center" cellpadding="1" cellspacing="1" style="margin-top:20px;">
<form action="newsClassEditDo.asp" method="POST" name="classForm1">
<input type="hidden" name="classId" value="<%=classId%>" />
  <tr>
    <td height="20" colspan="2" align="center"><strong>修改分类</strong></td>
  </tr>
  <tr>
    <td height="20">移动到:</td>
    <td width="99">
<%
dim rsClass,classLevel,outstr
set rsClass=conn.execute("select * from newsclass order by classcode")
outstr = "<select name=""parentClassId"">"&vbcrlf
outstr = outstr&"<option value=""0"">根栏目</option>"&vbcrlf
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		outstr = outstr&"<option value="""&rsClass("id")&""" "
		if parentClassId = cint(rsClass("id")) then
			outstr = outstr&"selected=""selected"""
		end if
		outstr = outstr&">"
		outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_cn")
		outstr = outstr&"</option>"&vbcrlf
		rsClass.movenext()
	loop
end if
outstr = outstr&"</select>"&vbcrlf
response.write(outstr)
set rsClass=nothing
%>
	</td>
  </tr>
  <tr>
    <td height="20">中文名称:</td>
    <td><input name="classname_cn" type="text" value="<%=classNameCn%>" size="30" /></td>
  </tr>
  <tr>
    <td height="20">英文名称:</td>
    <td><input name="classname_en" type="text" value="<%=classNameEn%>" size="30" /></td>
  </tr>
  <tr>
    <td>提交:</td>
    <td><input type="submit" name="Submit22" value="提交" /></td>
  </tr>
</form>
</table>
</body>
</html>
