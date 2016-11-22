
<!--#include file="../inc/config.asp"-->
<%
jobid = request.QueryString("jobid")
if isempty(jobid)  then
	response.Write("无效的参数")
	response.End()
end if

set rsLog=server.createobject("adodb.recordset")
sql="Select top 100 * from jobapply where jobid="&jobid&" order by applyid desc"
rsLog.open sql,Conn,1,3
if rsLog.eof and rsLog.bof then
	response.write("暂无记录")
	response.End()
else
%>
<table width="600" class="logTb">
<thead>
  <tr>
    <td>姓名</td>
    <td>姓别</td>
    <td>年龄</td>
    <td>自我介绍</td>
    <td>工作经历</td>
    <td>联系方式</td>
    <td>查看详情</td>
  </tr>
</thead>
<tbody>
<%
	'----------分页相关开始---------------
	ipageSize=4
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
    <td><strong><%=rsLog("applyname")%></strong></td>
    <td><%=rsLog("applysex")%></td>
    <td><%=rsLog("applyage")%></td>
    <td><%=limitTitle(rsLog("applyintro"),10)%></td>
    <td><%=limitTitle(rsLog("applyhistory"),10)%></td>
    <td><%=limitTitle(rsLog("applyphone"),10)%></td>
	<td>
	<a href="jobApplyView.asp?applyid=<%=rsLog("applyid")%>&height=300&width=400" class="thickbox" title="详情查看">
	<%
	if rsLog("hasview") = 0 then
		response.write("<strong>未查看</strong>")
	else
		response.write("己查看")
	end if
	%>
	</a>
	</td>
  </tr>
<%
		rsLog.movenext
		if i >= rsLog.pagesize then exit do
	loop
end if
%>
</tbody>
</table>
<div class="splitPage"><%call splitPage(rsLog,iPageSize)%></div>