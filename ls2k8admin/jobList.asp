
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<link href="css/thickbox.css" rel="stylesheet" type="text/css" /><!--thickbox-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/thickbox.js" type="text/javascript"></script><!--thickbox-->
	<script src="js/JQuerySpinBtn.js" type="text/javascript"></script><!--spinButton-->
	<link href="css/JQuerySpinBtn.css" rel="stylesheet" type="text/css" />
	<script src="js/jobList.js" type="text/javascript"></script><!--本页专有JS-->
</head>
<body>
<!--header开始-->
<!--#include file="header.asp"-->
<!--header结束-->
<table width="97%" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/L_33.jpg">
      <tr>
        <td width="9"><img src="images/L_32.jpg" width="9" height="27" /></td>
        <td width="100%">&nbsp;</td>
        <td align="right" width="9"><img src="images/L_35.jpg" width="9" height="27" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="45" align="right" valign="bottom" bgcolor="#C7DAE9"><table border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#838383" align="center" class="white"><a href="jobAdd.asp">职位添加</a></td>
        <td>&nbsp;</td>
        <td width="10" align="center" class="white">&nbsp;</td>
        <td width="80" height="25" bgcolor="#FF6600" align="center" class="white"><a href="jobList.asp"><b>职位管理</b></a></td>
        <td width="10">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="500" valign="top" bordercolor="#DAEBEF" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#666666" height="1"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right" bgcolor="#F6F6F6">
		<!--查询开始-->
		<!--查询结束--></td>
      </tr>
      <tr>
        <td height="1" bgcolor="#666666"></td>
      </tr>
      <tr>
        <td height="300" valign="top">
		<!--列表开始-->
		<form method="post" name="formProList" id="formProList" action="jobAlter.asp">
		<input name="action" value="del" type="hidden" id="formProListAction" />
		<table width="100%" border="0" cellpadding="2" cellspacing="2" class="title">
			<tr align="center" bgcolor="#F6F6F6">
				<td width="5%">
				<input name="chkAll" type="checkbox" id="vote" onClick="CheckAll(this.form)" value="checkbox" />
				</td>
				<td width="5%">NO</td>
				<td width="15%" bgcolor="#F6F6F6">职位名称</td>
				<td width="10%">己收简历</td>
				<td width="15%">添加时间</td>
				<td width="15%">截止时间</td>
				<td width="10%">状态</td>
				<td width="10%">排序[<a href="#" onclick="fromProListSubmit3()">变更</a>]</td>
				<td width="5%">编辑</td>
				<td width="5%">删除</td>
			</tr>
		</table>
<%
'输出列表函数,放在这里是因为在DM里容易预览...
function showProList(rs,iPageSize)
	dim curPage,maxPage
	if not (rs.eof and rs.bof) then
		if not isempty(request.QueryString("page")) then   
			curPage=cint(request.QueryString("page"))   
		else   
			curPage=1
		end if
		if ipageSize > rs.recordcount then
			ipageSize = rs.recordcount
		end if
		rs.pagesize=iPageSize	'初始化每页文章数
		rs.AbsolutePage=curPage	'初始化当前页
		maxPage = rs.pageCount	'取得页数
		dim i:i=0
		do while not rs.eof
			i = i + 1
%>
		<table width="100%" border="0" cellpadding="2" cellspacing="2" class="proList">
          <tr align="center">
            <td width="5%"><input name='jobid' type='checkbox' onClick="unselectall()" id="jobid" value='<%=cstr(rs("jobid"))%>' /></td>
            <td width="5%"><%=rs.AbsolutePosition%></td>
            <td width="15%" align="left">
				  <a href="jobEdit.asp?action=edit&jobid=<%=rs("jobid")%>" title="<%=rs("jobname_cn")%>">	  
				  <%if xiii_language <> "en" then%>
				  <strong><%=limitTitle(rs("jobname_cn"),12)%></strong>
				  <%else%>
				  <strong><%=limitTitle(rs("jobname_en"),24)%></strong>
				  <%end if%>
				  </a>
			</td>
			 <td width="10%" align="center">
			
			<%
			sql = "select count(applyid) from jobapply where jobid ="&rs("jobid")
			set rs2=conn.execute(sql)
			if rs2.eof and rs2.bof then
				response.Write("0")
			else
				response.Write(rs2(0))
				sql = "select count(applyid) from jobapply where hasview=0 and jobid ="&rs("jobid")
				set rs2=conn.execute(sql)
				if rs2.eof and rs2.bof then
				else
					response.write("/"&rs2(0)&"新")
				end if
				response.write("&nbsp;&nbsp;<a href=""jobApplyList.asp?jobid="&rs("jobid")&""" class=""viewList""><strong>查看</strong></a>")
			end if
			%>
			
            <td width="15%" align="center"><%=rs("sysdate")%></td>
			<td width="15%" align="center"><%=rs("jobdate")%></td>
            <td width="10%" class="check">
			<%if rs("jobstate") = 1 then%>
				<span class="red">热招中(√)</span>
			<%elseif rs("jobstate") = 0 then%>
				<span class="green">己暂停(×)</span>
			<%else%>
				<span class="green">己饱合(×)</span>
			<%end if%>
			</td>
            <td width="10%">
			<input type="hidden" name="joborderid" value="<%=rs("jobid")%>" />
			<input name="joborder" type="text"  style="font-size: 11px; text-align: center"  size="1" maxlength="3" value="<%=rs("joborder")%>" class="suSpinButton" />
			</td>
            <td width="5%">
			<a href="jobEdit.asp?action=edit&jobid=<%=rs("jobid")%>">
			<img src="images/edit.gif" width="22" height="22" /></a>
			</td>
            <td width="5%">
			<a href="jobAlter.asp?action=del&jobid=<%=rs("jobid")%>">
			<img src="images/delete.gif" width="16" height="16" /></a>
			</td>
          </tr>
        </table>
		
		<div style="margin:10px 0px; width:600px; border:2px solid #DAEBEF; padding:10px;display:none;" class="jobApplyList">
		<img src="images/loadingAnimation.gif" />
		<p>&nbsp;&nbsp;正在读取,请等待...</p>
		</div>

<%
			rs.movenext()
			if i >= rs.pagesize then exit do    
		loop
	end if
end function
%>
<%
'--------------------主程序部分-------------------------------
dim action
'列出全部内容
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from job"
sql = sql&" order by joborder desc, jobid desc"
rs.open sql,conn,1,3
if rs.eof and rs.bof then
	response.write("暂无记录")
else
	call showProList(rs,xiii_pagesize)
end if

%>
		<table border="0" cellpadding="2" cellspacing="2" class="title">
			<tr>
				<td>
				</td>
				<td><input type="button" name="bt1" value="删除选定" onclick="fromProListSubmit1()" /></td>
			</tr>
		</table>

		</form>
		<!--列表结束-->
          
          </td>
      </tr>
	  <tr><td></td></tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr bgcolor="#F7F7F7">
            <td bgcolor="#F7F7F7" align="right">
			<div class="splitPage"><%call splitPage(rs,xiii_pagesize)%></div>
			</td>
          </tr>
        </table>
          </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--footer开始-->
<!--#include file="footer.asp"-->
<!--footer结束-->
