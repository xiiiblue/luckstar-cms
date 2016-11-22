<%Response.Buffer=false%>
<!--#include file="../inc/mdb.asp"-->
<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/function.asp"-->
<%
if session("nbigarea")="" then
	response.write"<SCRIPT language=JavaScript>alert(' 大类未填写 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("nsmallarea")="" then
	response.write"<SCRIPT language=JavaScript>alert(' 小类未填写 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("ly")="" then
	response.write"<SCRIPT language=JavaScript>alert(' 来源未填写 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("key")="" then
	response.write"<SCRIPT language=JavaScript>alert(' 关键词未填写 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("username")="" or session("usertable")="" or session("usertable")="" then
	response.write"<SCRIPT language=JavaScript>alert(' 未登录 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
%>
<html>
<head><title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCEEFF">
<%
Function RndNumber(MaxNum,MinNum)
Randomize 
RndNumber=int((MaxNum-MinNum+1)*rnd+MinNum)
RndNumber=RndNumber
End Function
%>
<%
Server.ScriptTimeOut=7200
on error resume next
username=session("username")
userpath=session("userpath")
usertable=session("usertable")
	filepath="../uploadfile/"&userpath
	filepath=server.MapPath(filepath)
titlemethod=session("titlemethod")		'标题提取方式
keyword0=stripspecial(session("keyword0"))
keyword1=stripspecial(session("keyword1"))	'正文内容匹配关键字
keyword2=stripspecial(session("keyword2"))
keyword3=stripspecial(session("keyword3"))	'标题匹配关键字
keyword4=stripspecial(session("keyword4"))
ly=stripcrlf(session("ly"))
key=stripcrlf(session("key"))
nsmallarea=cint(session("nsmallarea"))
nbigarea=cint(session("nbigarea"))
groupid=RndNumber(65535,10000)
%>

<%
'--------------FSO set-------------------------
list_from = filepath '储存当前源工作目录 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set Fold = fso.GetFolder(list_from) '获取Folder对象 
Set fc = Fold.Files '获取文件记录集 
Set mm = Fold.SubFolders '获取目录记录集 
For Each f1 in fc
	flag=0	'关于flag的权值：正文为1,3;标题为12（或4＋8）
	file_from = list_from & "/" & f1.name '生成文件地址(源) 
	fileExt = lcase(right(f1.name,4)) '获取文件类型 
	If fileExt=".asp" or fileExt=".inc" or fileExt=".htm" or fileExt="html" Then '具体类型可自行修改添加 
		set objfile = server.createobject("scripting.filesystemobject") '定义一个服务器组件（读取源文件 
		set out = objfile.opentextfile(file_from, 1, false, false) 
		content = out.readall '读取数据 
		out.close

'-------------------------------主过滤部分-------------------------------------------
		tmp_content=stripcrlf(content)			'去换行,特殊符号
		if titlemethod=1 then
			tmp_title= striptitle1(tmp_content)	'匹配<title>..</title>
		elseif titlemethod=2 then
			tmp_title=striptitle2(tmp_content)	'匹配keyword3,keyword4
		else
			tmp_title=striptitle3()				'匹配文件名
		end if			
		tmp_content=stripcontent(tmp_content)
		
		tmp_title=stripsql(tmp_title)
		tmp_content=stripsql(tmp_content)
		username=stripsql(username)
		key=stripsql(key)
		
		sql="insert into "&usertable&" (SMT_title,SMT_news,SMT_ly,SMT_addr,SMT_date,keywords,nsmallarea,nbigarea,SMT_key3,SMT_key2) values ('"&tmp_title&"','"&tmp_content&"','"&ly&"','"&username&"','"&now()&"','"&key&"',"&nsmallarea&","&nbigarea&",'"&flag&"','"&groupid&"')"
		conn.execute(sql)
		
		response.write(tmp_title)
		response.Write(":")
		response.Write(flag)
		response.write "<br>"
		fso.DeleteFile file_from,true
'------------------------------------------------------------------------------------					
	end if
next
response.Write("<br>过滤完毕！")
%>
<script language="javascript">
	alert("录入完毕，请点击确定返回！");
	window.location="../welcome.asp";

</script>

</body>
</html>