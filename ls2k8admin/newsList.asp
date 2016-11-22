<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<link href="css/thickbox.css" rel="stylesheet" type="text/css" /><!--thickbox-->
	<script type="text/javascript" src="fckeditor.js"></script><!--FckEditor编辑器-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/thickbox.js" type="text/javascript"></script><!--thickbox-->
	<script src="js/JQuerySpinBtn.js" type="text/javascript"></script><!--spinButton-->
	<link href="css/JQuerySpinBtn.css" rel="stylesheet" type="text/css" />
	<script src="js/newsList.js" type="text/javascript"></script><!--本页专有JS-->
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
    <td height="45" align="left" valign="bottom" bgcolor="#C7DAE9">
	<a href="newsAdd.asp?proClass=<%=request("proClass")%>" class="coolBtn2">添加文章</a>
	</td>
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
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left">
			<table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
			    <td align="left">&nbsp;<strong>当前类别:</strong></td>
				<form action="#" method="get" name="formSwitch" id="formSwitch">
                <td align="left">
                    <input type="hidden" name="action" value="search" />
<%
dim rsClass,classLevel,outstr
set rsClass=conn.execute("select * from newsclass order by classcode")
outstr = "<select name=""proClass"" onchange=""this.form.submit()"">"&vbcrlf
outstr = outstr&"<option value=""0"">显示全部</option>"&vbcrlf
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		outstr = outstr&"<option value="""&rsClass("id")&""" "
		if request("proClass") = cstr(rsClass("id")) then
			outstr = outstr&"selected=""selected"""
		end if
		outstr = outstr&">"
		if xiii_language <> "en" then
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_cn")
		else
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_en")
		end if
		outstr = outstr&"</option>"&vbcrlf
		rsClass.movenext()
	loop
end if
outstr = outstr&"</select>"&vbcrlf
response.write(outstr)
set rsClass=nothing
%>
				</td>
				</form>
              </tr>
            </table>
			</td>
            <td align="right">
			<table border="0" cellspacing="2" cellpadding="2">
              <form action="#" method="get" name="formSearch" id="formSearch">
                <input type="hidden" name="action" value="search" />
                <tr>
                  <td>搜索文章</td>
                  <td align="right"><input name="keyword" type="text" value="请输入关键字" size="20" /></td>
                  <td>
<%
set rsClass=conn.execute("select * from newsclass order by classcode")
outstr = "<select name=""proClass"">"&vbcrlf
outstr = outstr&"<option value=""0"">不限分类</option>"&vbcrlf
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		outstr = outstr&"<option value="""&rsClass("id")&""" "
		if request("proClass") = cstr(rsClass("id")) then
			outstr = outstr&"selected=""selected"""
		end if
		outstr = outstr&">"
		if xiii_language <> "en" then
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_cn")
		else
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_en")
		end if
		outstr = outstr&"</option>"&vbcrlf
		rsClass.movenext()
	loop
end if
outstr = outstr&"</select>"&vbcrlf
response.write(outstr)
set rsClass=nothing
%>
				  </td>
                  <td><select name="proStatus">
                      <option value="noLimit">不限制状态</option>
                      <option value="show">&nbsp;显示(√)</option>
                      <option value="notShow">&nbsp;不显示(×)</option>
                      <option value="up">&nbsp;固顶(√)</option>
                      <option value="notUp">&nbsp;不固顶(×)</option>
                      <option value="commend">&nbsp;推荐(√)</option>
                      <option value="notCommend">&nbsp;不推荐(×)</option>
                      <option value="hot">&nbsp;热点(√)</option>
                      <option value="notHot">&nbsp;非热点(×)</option>
                    </select>
                  </td>
                  <td><input name="image" type="image" src="images/search.gif" width="69" height="20" /></td>
                  <td>&nbsp;</td>
                </tr>
              </form>
            </table>
			</td>
          </tr>
        </table>
		<!--查询结束--></td>
      </tr>
      <tr>
        <td height="1" bgcolor="#666666"></td>
      </tr>
      <tr>
        <td height="300" valign="top">
		<!--列表开始-->
		<form method="post" name="formProList" id="formProList" action="newsAlter.asp">
		<input name="action" value="del" type="hidden" id="formProListAction" />
		<table width="100%" border="0" cellpadding="2" cellspacing="2" class="title">
			<tr align="center" bgcolor="#F6F6F6">
				<td width="5%">
				<input name="chkAll" type="checkbox" id="vote" onClick="CheckAll(this.form)" value="checkbox" />
				</td>
				<td width="5%">NO</td>
				<td width="25%" bgcolor="#F6F6F6">标题</td>
				<td width="5%">图片</td>
				<td width="10%">时间</td>
				<td width="25%">状态</td>
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
		if not isempty(request("page")) then   
			curPage=cint(request("page"))   
		else   
			curPage=1
		end if
		if ipageSize > rs.recordcount then
			ipageSize = rs.recordcount
		end if
		rs.pagesize=iPageSize	'初始化每页文章数
		maxPage = rs.pageCount	'取得页数
		if curPage>maxPage then
			curPage=maxPage
		end if
		rs.AbsolutePage=curPage	'初始化当前页
		dim i:i=0
		do while not rs.eof
			i = i + 1
%>
		<table width="100%" border="0" cellpadding="2" cellspacing="2" class="proList">
          <tr align="center">
            <td width="5%"><input name='proid' type='checkbox' onClick="unselectall()" id="proid" value='<%=cstr(rs("proid"))%>' /></td>
            <td width="5%"><%=rs.AbsolutePosition%></td>
            <td width="25%" align="left">
				  <a href="newsEdit.asp?action=edit&proid=<%=rs("proid")%>" title="<%=rs("proname_cn")%>">
				  <%if xiii_language <> "en" then%>
				  <strong><%=limitTitle(rs("proname_cn"),12)%></strong>
				  <%else%>
				  <strong><%=limitTitle(rs("proname_en"),24)%></strong>
				  <%end if%>
				  </a>
				  <%if xiii_language <> "en" then%>
				  [<%=getClassName("newsclass",rs("proclassid"),"cn")%>]
				  <%else%>
				  [<%=getClassName("newsclass",rs("proclassid"),"en")%>]
				  <%end if%>
			</td>
			<td width="5%" align="center">
				  <%if rs("hasPic")<>0 then%>
				  <img src="images/photo.gif" width="17" height="13" />
				  <%end if%>
			</td>
            <td width="10%" align="center"><%=left(rs("prodate"),10)%></td>
            <td width="25%" class="check">
			<a href="newsStatus.asp?proid=<%=rs("proid")%>&toggle=show">显示</a>
			<%if rs("proshow") = 1 then%>
				<span class="red">(√)</span>
			<%else%>
				<span class="green">(×)</span>
			<%end if%>
			<a href="newsStatus.asp?proid=<%=rs("proid")%>&toggle=up">固顶</a>
			<%if rs("proup") = 1 then%>
				<span class="red">(√)</span>
			<%else%>
				<span class="green">(×)</span>
			<%end if%>
			<a href="newsStatus.asp?proid=<%=rs("proid")%>&toggle=commend">推荐</a>
			<%if rs("procommend") = 1 then%>
				<span class="red">(√)</span>
			<%else%>
				<span class="green">(×)</span>
			<%end if%>
			<a href="newsStatus.asp?proid=<%=rs("proid")%>&toggle=hot">热点</a>
			<%if rs("prohot") = 1 then%>
				<span class="red">(√)</span>
			<%else%>
				<span class="green">(×)</span>
			<%end if%>
			</td>
            <td width="10%">
			<input type="hidden" name="proorderid" value="<%=rs("proid")%>" />
			<input name="proorder" type="text"  style="font-size: 11px; text-align: center"  size="3" value="<%=rs("proorder")%>" class="suSpinButton" />
<!--			<input type="button" value="变更" class="altOrderSubmit" />-->			</td>
            <td width="5%">
			<a href="newsEdit.asp?action=edit&proid=<%=rs("proid")%>">
			<img src="images/edit.gif" width="22" height="22" />			</a>			</td>
            <td width="5%">
			<a href="newsAlter.asp?action=del&proid=<%=rs("proid")%>" onclick="return confirm('确定删除吗?')">
			<img src="images/delete.gif" width="16" height="16" />			</a>			</td>
          </tr>
        </table>
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
action = request("action")

'搜索结果显示
dim keyword,proClass,proStatus,sql,rs,i
if(action="search") then
	if isempty(request("keyword")) then 
		keyword = ""
	else
		keyword = request("keyword")
	end if
	if isempty(request("proClass")) or request("proClass")="" then 
		proClass = 0
	else
		proClass = request("proClass")
	end if
	if isempty(request("proStatus")) then 
		proStatus = ""
	else
		proStatus = request("proStatus")
	end if
	sql = "select * from news where 1=1 "
	if keyword <> "" then
		sql = sql&"and (proname_cn like ""%"&keyword&"%"" or proname_en like ""%"&keyword&"%"") "
	end if
	if proClass<>0 then
		dim proClasses:proClasses = getSubClasses("newsclass",proClass)
		sql = sql&"and proclassid in ("&proClasses&") "
	end if
	if proStatus = "show" then
		sql = sql&"and proshow = 1 "
	end if
	if proStatus = "notShow" then
		sql = sql&"and proshow = 0 "
	end if
	if proStatus = "up" then
		sql = sql&"and proup = 1 "
	end if
	if proStatus = "notUp" then
		sql = sql&"and proup = 0 "
	end if
	if proStatus = "commend" then
		sql = sql&"and procommend = 1 "
	end if
	if proStatus = "notCommend" then
		sql = sql&"and procommend = 0 "
	end if
	if proStatus = "hot" then
		sql = sql&"and prohot = 1 "
	end if
	if proStatus = "notHot" then
		sql = sql&"and prohot = 0 "
	end if
	sql = sql&" order by proorder desc,proid desc"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write("暂无记录")
	else
		call showProList(rs,xiii_pagesize)
	end if
else
	'列出全部内容
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql="select * from news"
	sql = sql&" order by proorder desc, proid desc"
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write("暂无记录")
	else
		call showProList(rs,xiii_pagesize)
	end if
end if
%>
		<table border="0" cellpadding="2" cellspacing="2" class="title">
			<tr>
				<td>
				</td>
				<td><input type="button" name="bt1" value="删除选定" onclick="fromProListSubmit1()" /></td>
				<td>
<%

set rsClass=conn.execute("select * from newsclass order by classcode")
outstr = "<select name=""proClass"" onchange=""fromProListSubmit2()"">"&vbcrlf
outstr = outstr&"<option value=""0"">移动所选</option>"&vbcrlf	
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		outstr = outstr&"<option value="&rsClass("id")&">"
		if xiii_language <> "en" then
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_cn")
		else
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_en")
		end if
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
</body>
</html>