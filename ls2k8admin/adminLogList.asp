
<!--#include file="../inc/config.asp"-->
<table width="600" class="logTb">
<thead>
  <tr>
    <td>管理员ID </td>
    <td>管理员姓名</td>
    <td>登录IP</td>
    <td>登录地点</td>
    <td>登录时间</td>
    <td>登录类型</td>
  </tr>
</thead>
<tbody>
<%
set rsLog=server.createobject("adodb.recordset")
sql="Select top 100 * from adminlog where adminname='"&session("adminName")&"' order by logid desc"
rsLog.open sql,Conn,1,3
if rsLog.eof and rsLog.bof then
else
	'----------分页相关开始---------------
	ipageSize=8
	if not isempty(request.QueryString("page")) then   
		curPage=cint(request.QueryString("page"))   
	else   
		curPage=1
	end if
	if ipageSize > rsLog.recordcount then
		ipageSize = rsLog.recordcount
	end if
	rsLog.pagesize=iPageSize	'初始化每页文章数
	rsLog.AbsolutePage=curPage	'初始化当前页
	maxPage = rsLog.pageCount	'取得页数
	dim i:i=0
	'--------分页相关结束-----------------
	do while not rsLog.eof
		i = i + 1
%>
  <tr>
    <td><%=rsLog("adminname")%></td>
    <td><%=rsLog("adminrealname")%></td>
    <td><%=rsLog("adminip")%></td>
    <td><%=rsLog("adminregion")%></td>
    <td><%=rsLog("logdate")%></td>
    <td><%=rsLog("logtype")%></td>
  </tr>
<%
		rsLog.movenext
		if i >= rsLog.pagesize then exit do
	loop
end if
%>
</tbody>
</table>
<div class="splitPage"><%call splitPage(rsLog,8)%></div>