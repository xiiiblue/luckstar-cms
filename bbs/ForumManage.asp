﻿<!-- #include file="Setup.asp" -->
<%
HtmlTop
if CookieUserName=empty then error("您还未<a href=Login.asp?ReturnUrl="&ReturnUrl&">登录</a>论坛")
ForumID=RequestInt("ForumID")

if ForumID>0 then
	sql="Select * from [BBSXP_Forums] where ForumID="&ForumID&""
	Set Rs=Execute(sql)
		ParentID=Rs("ParentID")
		GroupID=Rs("GroupID")
		ForumName=Rs("ForumName")
		Moderated=Rs("Moderated")
	Rs.close
%>
	<!-- #include file="Utility/ForumPermissions.asp" -->
<%
else
end if


if PermissionManage=0 and BestRole<>1 then error("您的<a href=ShowForumPermissions.asp?ForumID="&ForumID&">权限</a>不够")

select case Request("menu")
	case "Fix"
		allarticle=Execute("Select count(ThreadID) from [BBSXP_Threads] where IsDel=0 and ForumID="&ForumID&"")(0)
		if allarticle>0 then
			allrearticle=Execute("Select sum(TotalReplies) from [BBSXP_Threads] where IsDel=0 and ForumID="&ForumID&"")(0)
		else
			allrearticle=0
		end if
		Execute("update [BBSXP_Forums] Set TotalThreads="&allarticle&",TotalPosts="&allarticle+allrearticle&" where ForumID="&ForumID&"")
		UpForumMostRecent(ForumID)
		succeed "修复论坛统计数据成功",""
		
	case "ForumDataUp"
		ForumName=HTMLEncode(Request.Form("ForumName"))
		TotalCategorys=HTMLEncode(Request.Form("TotalCategorys"))
		Moderated=HTMLEncode(Request.Form("Moderated"))
		ForumDescription=HTMLEncode(Request.Form("ForumDescription"))
		ForumRules=HTMLEncode(Request.Form("ForumRules"))
		if ForumName="" then error("请输入论坛名称")
		if Len(ForumName)>30 then  error("论坛名称不能大于 30 个字符")
		if Len(ForumDescription)>255 then  error("论坛简介不能大于 255 个字符")
		master=split(""&Moderated&"","|")
		for i = 0 to ubound(master)
			If Execute("Select UserID From [BBSXP_Users] where UserName='"&master(i)&"'" ).eof and master(i)<>"" Then error(""&master(i)&"的用户资料不存在")
		next
		sql="Select * from [BBSXP_Forums] where ForumID="&ForumID&""
		Rs.Open sql,Conn,1,3
			Rs("ForumName")=ForumName
			if BestRole=1 then Rs("Moderated")=Moderated
			Rs("TotalCategorys")=TotalCategorys
			Rs("ForumDescription")=ForumDescription
			Rs("ForumRules")=ForumRules
		Rs.update
		Rs.close
		Log("更新论坛（ID:"&ForumID&"）的信息！")
		Message="<li>更新成功！</li><li><a href=ShowForum.asp?ForumID="&ForumID&">返回论坛</a></li>"
		succeed Message,"ShowForum.asp?ForumID="&ForumID&""

end select


		sql="Select * from [BBSXP_Forums] where ForumID="&ForumID&""
		Set Rs=Execute(sql)
			ForumDescription=replace(""&Rs("ForumDescription")&"","<br>",vbCrlf)
			ForumRules=replace(""&Rs("ForumRules")&"","<br>",vbCrlf)
%>

<div id="CommonBreadCrumbArea"><%ClubTree%> → <%=ForumTree(Rs("ParentID"))%> <a href="ShowForum.asp?ForumID=<%=ForumID%>"><%=Rs("ForumName")%></a> → 版块管理</div>
<table border=0 width=100%>
	<tr>
		<td valign="top" width="20%">
			<table width=100% cellspacing=1 cellpadding=5 border=0 id=CommonListArea>
				<tr id=CommonListTitle>
					<td align="center">论坛信息 </td>
				</tr>
				<tr id=CommonListCell>
					<td>今日帖：<%=Rs("TodayPosts")%></td>
				</tr>
				<tr id=CommonListCell>
					<td>主题数：<%=Rs("TotalThreads")%> </td>
				</tr>
				<tr id=CommonListCell>
					<td>帖子数：<%=Rs("TotalPosts")%> </td>
				</tr>
				<tr id=CommonListTitle>
					<td align="center">管理选项</td>
				</tr>
				<tr id=CommonListCell>
					<td><a href="Moderation.asp?ForumID=<%=ForumID%>&checkbox=1">主题管理</a></td>
				</tr>
				<tr id=CommonListCell>
					<td><a href="Moderation.asp?ForumID=<%=ForumID%>&checkbox=1&Menu=Censorship">主题审核</a></td>
				</tr>
				<tr id=CommonListCell>
					<td><a href="Moderation.asp?ForumID=<%=ForumID%>&checkbox=1&Menu=Recycle">回 收 站</a></td>
				</tr>
				<tr id=CommonListCell>
					<td><a href="ForumManage.asp?menu=Fix&ForumID=<%=ForumID%>">修复论坛统计数据</a></td>
				</tr>		
			</table>
		</td>
		<td align="center" valign="top">
		<form name="form2" method="POST" action="?">
		<input type=hidden name=menu value="ForumDataUp">
		<input type=hidden name=ForumID value="<%=ForumID%>">	
			<table width=100% cellspacing=1 cellpadding=5 border=0 id=CommonListArea>
				<tr id=CommonListTitle>
					<td align="center" colspan="2">论坛资料</td>
				</tr>
				<tr id=CommonListCell>
					<td align="right" valign="middle" width="20%">论坛名称：</td>
					<td align="Left" valign="middle"><input type="text" name="ForumName" size="30" value="<%=Rs("ForumName")%>"></td>
				</tr>
<%if BestRole=1 then%>
				<tr id=CommonListCell>
					<td align="right" valign="middle" width="20%">论坛版主：</td>
					<td align="Left" valign="middle"><input size="30" name="Moderated" value="<%=Rs("Moderated")%>">　多版主请用“|”分隔</td>
				</tr>
<%end if%>
				<tr id=CommonListCell>
					<td align="right" valign="middle" width="20%">帖子类别：</td>
					<td align="Left" valign="middle"><input size="30" name="TotalCategorys" value="<%=Rs("TotalCategorys")%>">　添加请用“|”分隔，如：原创|转帖|帖图</td>
				</tr>
				<tr id=CommonListCell>
					<td align="right" width="20%">论坛介绍：</td>
					<td align="Left" valign="middle"><textarea name="ForumDescription" rows="4" cols="50"><%=ForumDescription%></textarea>&nbsp;</td>
				</tr>
				<tr id=CommonListCell>
					<td align="right" width="20%">论坛规则：</td>
<td align="Left" valign="middle"><textarea name="ForumRules" rows="4" cols="50"><%=ForumRules%></textarea>&nbsp;</td>
				</tr>
				<tr id=CommonListCell>
					<td align="right" valign="bottom" width="98%" colspan="2"><input type="submit" value=" 更 新 &gt;&gt;下 一 步 "></td>
				</tr>
			</table>
</form>	
		</td>
	</tr>
</table>
<%
	Rs.close

HtmlBottom
%>