
<!--#include file="../inc/config.asp"-->
<%
applyid = request.QueryString("applyid")
if isempty(applyid)  then
	response.Write("无效的参数")
	response.End()
end if

set rsLog=server.createobject("adodb.recordset")
sql="Select * from jobapply where applyid="&applyid
rsLog.open sql,Conn,1,3
if rsLog.eof and rsLog.bof then
	response.write("暂无记录")
	response.End()
else
	applyname = rsLog("applyname")
	applysex = rsLog("applysex")
	if applysex = 0 then
		applysex = "男"
	else
		applysex = "女"
	end if
	applyage = rsLog("applyage")
	applyintro = rsLog("applyintro")
	applyhistory = rsLog("applyhistory")
	applyphone = rsLog("applyphone")
	
	rsLog("hasview") = 1
	rsLog.update
end if
%>
<div style="width:380px; background-color:#DFEEF5; margin:10px auto;">
<table width="100%" border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td width="20%" bgcolor="#FFFFFF" class="main_title"><strong>姓名</strong></td>
    <td width="30%" bgcolor="#FFFFFF" class="main_title"><%=applyname%></td>
    <td width="20%" bgcolor="#FFFFFF" class="main_title"><strong>性别</strong></td>
    <td width="30%" bgcolor="#FFFFFF" class="main_title"><%=applysex%></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><strong>年龄</strong></td>
    <td bgcolor="#FFFFFF"><%=applyage%></td>
    <td bgcolor="#FFFFFF"></td>
    <td bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
	<td colspan="1" bgcolor="#FFFFFF"><strong>自我介绍</strong></td>
    <td colspan="3" bgcolor="#FFFFFF"><%=applyintro%></td>
  </tr>
  <tr>
	<td colspan="1" bgcolor="#FFFFFF"><strong>工作经历</strong></td>
    <td colspan="3" bgcolor="#FFFFFF"><%=applyhistory%></td>
  </tr>
  <tr>
	<td colspan="1" bgcolor="#FFFFFF"><strong>联系方式</strong></td>
    <td colspan="3" bgcolor="#FFFFFF"><%=applyphone%></td>
  </tr>
</table>