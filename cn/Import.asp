<%Response.Buffer=false%>
<!--#include file="../inc/mdb.asp"-->
<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/function.asp"-->
<%
if session("nbigarea")="" then
	response.write"<SCRIPT language=JavaScript>alert(' ����δ��д �� �뷵�� ��' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("nsmallarea")="" then
	response.write"<SCRIPT language=JavaScript>alert(' С��δ��д �� �뷵�� ��' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("ly")="" then
	response.write"<SCRIPT language=JavaScript>alert(' ��Դδ��д �� �뷵�� ��' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("key")="" then
	response.write"<SCRIPT language=JavaScript>alert(' �ؼ���δ��д �� �뷵�� ��' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("username")="" or session("usertable")="" or session("usertable")="" then
	response.write"<SCRIPT language=JavaScript>alert(' δ��¼ �� �뷵�� ��' );"
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
titlemethod=session("titlemethod")		'������ȡ��ʽ
keyword0=stripspecial(session("keyword0"))
keyword1=stripspecial(session("keyword1"))	'��������ƥ��ؼ���
keyword2=stripspecial(session("keyword2"))
keyword3=stripspecial(session("keyword3"))	'����ƥ��ؼ���
keyword4=stripspecial(session("keyword4"))
ly=stripcrlf(session("ly"))
key=stripcrlf(session("key"))
nsmallarea=cint(session("nsmallarea"))
nbigarea=cint(session("nbigarea"))
groupid=RndNumber(65535,10000)
%>

<%
'--------------FSO set-------------------------
list_from = filepath '���浱ǰԴ����Ŀ¼ 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set Fold = fso.GetFolder(list_from) '��ȡFolder���� 
Set fc = Fold.Files '��ȡ�ļ���¼�� 
Set mm = Fold.SubFolders '��ȡĿ¼��¼�� 
For Each f1 in fc
	flag=0	'����flag��Ȩֵ������Ϊ1,3;����Ϊ12����4��8��
	file_from = list_from & "/" & f1.name '�����ļ���ַ(Դ) 
	fileExt = lcase(right(f1.name,4)) '��ȡ�ļ����� 
	If fileExt=".asp" or fileExt=".inc" or fileExt=".htm" or fileExt="html" Then '�������Ϳ������޸���� 
		set objfile = server.createobject("scripting.filesystemobject") '����һ���������������ȡԴ�ļ� 
		set out = objfile.opentextfile(file_from, 1, false, false) 
		content = out.readall '��ȡ���� 
		out.close

'-------------------------------�����˲���-------------------------------------------
		tmp_content=stripcrlf(content)			'ȥ����,�������
		if titlemethod=1 then
			tmp_title= striptitle1(tmp_content)	'ƥ��<title>..</title>
		elseif titlemethod=2 then
			tmp_title=striptitle2(tmp_content)	'ƥ��keyword3,keyword4
		else
			tmp_title=striptitle3()				'ƥ���ļ���
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
response.Write("<br>������ϣ�")
%>
<script language="javascript">
	alert("¼����ϣ�����ȷ�����أ�");
	window.location="../welcome.asp";

</script>

</body>
</html>