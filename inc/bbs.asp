<!-- #include file="../bbs/Conn2.asp" -->
<%
ii=0
%>

<%
if BBSxpDataBaseVersion<>"7.3.1" then error("程序与数据库版本不符合，请更新数据库版本到 7.3.1 ！")

if SiteConfig("EnableBannedUsersToLogin")=0 and CookieUserAccountStatus=2 then error("您的帐号已被禁用！")

if SiteConfig("BannedIP")<>"" then
	filtrate=split(SiteConfig("BannedIP"),"|")
	for i = 0 to ubound(filtrate)
		if instr("|"&REMOTE_ADDR&"","|"&filtrate(i)&"") > 0 then error(""&REMOTE_ADDR&"被禁止进入论坛！")
	next
end if

if SiteConfig("SiteDisabled")=1 then
	if instr(Script_Name,"admin_") = 0 and instr(Script_Name,"login.asp")=0 and instr(Script_Name,"install.asp")=0 then error(""&SiteConfig("SiteDisabledReason")&"")
end if

if Request.ServerVariables("Request_method") = "POST" then
	if instr(""&ReturnUrl&"","http://"&Server_Name&"") = 0 and instr(Script_Name,"login.asp")=0 then error("<li>引用页错误！"&http_referer&"<li>系统无法识别您的引用页！<li>建议您关闭防火墙后再提交此信息！")
end if



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub HtmlTop
'IsResponseTop=1
%>

<%'=GenericHeader%>


<%
'''''''''''''
End Sub
''''''''''''''''''''''''''''''
Sub HtmlBottom
	ProcessTime=FormatNumber((timer()-startime))
	if ProcessTime<1 then ProcessTime="0"&ProcessTime
%>
</div>

</body>
</html>

<%
	Response.End
End Sub

''''''''''''''''''''''''''''''''
Sub AdminTop
	response.write "<body><div id=CommonListCell  style='PADDING-TOP:15px; PADDING-RIGHT:5px; PADDING-LEFT:5px; PADDING-BOTTOM:15px;text-align:center;'>"
End Sub
Sub AdminFooter
	ProcessTime=FormatNumber((timer()-startime))
	if ProcessTime<1 then ProcessTime="0"&ProcessTime
	response.write "<hr width=80% SIZE=0 id=CommonListArea />Powered by <a target=_blank href=http://www.bbsxp.com>"&ForumsProgram&"</a> &nbsp;&copy; 1998-"&year(now)&"<br>Server Time "&now()&"<br>Processed in "&ProcessTime&" second(s)</div></body></html>"
End Sub
''''''''''''''''''''''''''''''''
Function succeed(Message,Url)

if IsResponseTop<>1 then HtmlTop
if Left(Message,4)<>"<li>" then Message="<li>"&Message
%>

<table cellspacing="1" cellpadding="5" width=100% id=CommonListArea>
	<tr id=CommonListTitle>
		<td width="100%" align="center">提示信息</td>
	</tr>
	<tr id=CommonListCell>
		<td valign="top" align="Left" height="122">
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
				<td width="83%" valign="top">
					<b><span id="yu">0</span>秒钟后系统将自动返回...</b>
					<ul>
					<%=Message%>
					<li><a href=reload.asp>返回</a></li>
					<script language="javascript">
					document.write("<li><a href="+document.referrer+">"+document.referrer+"</a></li>");
					</script>
					</ul>
				</td>
				<td width="17%"><img height="97" src="images/succ.gif" width="95" /></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<script language="JavaScript">
Url="<%=Url%>";
if (!Url){Url=document.referrer}
function countDown(secs){
	document.getElementById("yu").innerHTML=secs;
	if(--secs>0) {
		setTimeout("countDown("+secs+")",1000);
	}
	else {
		window.location.href=Url;
	}
}
countDown(3);
</script>
<%
HtmlBottom
End Function

Sub error(Message)
if IsResponseTop<>1 then HtmlTop
if Left(Message,4)<>"<li>" then Message="<li>"&Message
%>
<table cellspacing="1" cellpadding="5" width=100% id=CommonListArea>
	<tr id=CommonListTitle>
		<td width="100%" colspan="2" align="center">提示信息</td>
	</tr>
	<tr id=CommonListCell>
		<td valign="top" align="Left" colspan="2" height="122">
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
				<td width="83%" valign="top"><b>操作不成功的可能原因或建议：</b><ul><%=Message%></ul></td>
				<td width="17%"><img height="97" src="images/err.gif" width="95" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr align="center" id=CommonListCell>
		<td valign="center" colspan="2"><input onclick="history.back()" type="submit" value=" << 返 回 上 一 页 " /></td>
	</tr>
</table>
<%
HtmlBottom
End Sub

Sub ShowForum()
	TodayPostsHtml=""
	ModeratedList=""
	if Rs("Moderated")<>empty then
		filtrate=split(Rs("Moderated"),"|")
		for i = 0 to ubound(filtrate)
			if ""&filtrate(i)&""<>"" then ModeratedList=ModeratedList&"<a href='Profile.asp?UserName="&filtrate(i)&"'>"&filtrate(i)&"</a> "
		next
	end if


	ForumUrlStr="ShowForum.asp?ForumID="&Rs("ForumID")&""
	if Rs("ForumUrl")<>"" then ForumUrlStr=Rs("ForumUrl")
	
	
	If SiteConfig("IsShowSonForum") = 1 then
		SubForumStrings=""
		SubForumGetRow=FetchEmploymentStatusList("Select ForumID,ForumName,ForumUrl from [BBSXP_Forums] where ParentID="&Rs("ForumID")&" and SortOrder>0 and IsActive=1 order by SortOrder")
		if IsArray(SubForumGetRow) then
		SubForumStrings="<br><b>子版面："
		for iii=0 to Ubound(SubForumGetRow,2)
			if SubForumGetRow(2,iii)<>"" then
				SubForumStrings=SubForumStrings&"<a href="&SubForumGetRow(2,iii)&">"&SubForumGetRow(1,iii)&"</a>　"
			else
				SubForumStrings=SubForumStrings&"<a href=ShowForum.asp?ForumID="&SubForumGetRow(0,iii)&">"&SubForumGetRow(1,iii)&"</a>　"
			end if
		next
		SubForumStrings=SubForumStrings&"</b>"
		end if
	end if
	
%>
	<tr id=CommonListCell>
		<td align="center" width="40">
<%
	if Rs("ForumUrl")<>"" then
		response.write "<img src=images/forum_link.gif>"
	elseif int(DateDiff("d",Rs("MostRecentPostDate"),Now())) < 2 then
		response.write "<img src=images/forum_status_new.gif>"
	else
		response.write "<img src=images/forum_status.gif>"
	end if
	
if Rs("TodayPosts") > 0 then TodayPostsHtml="<font color='red'>("&Rs("TodayPosts")&")</font>"
%>
		</td>
		<td><a href="<%=ForumUrlStr%>"><%=Rs("ForumName")%></a> <%=TodayPostsHtml%><br><%=YbbEncode(Rs("ForumDescription"))%><%=SubForumStrings%></td>
		<td align="center"><%=Rs("TotalThreads")%></td>
		<td align="center"><%=Rs("TotalPosts")%></td>
		<td width="200">主题:<a href=ShowPost.asp?ThreadID=<%=Rs("MostRecentThreadID")%>><%=Left(Rs("MostRecentPostSubject"),14)%></a><br>作者:<a href="Profile.asp?UserName=<%=Rs("MostRecentPostAuthor")%>"><%=Rs("MostRecentPostAuthor")%></a><br>时间:<%=Rs("MostRecentPostDate")%></td><td align="center" width="100"><%=ModeratedList%></td>
	</tr>
<%
End Sub

Sub ShowThread()
	if Rs("ThreadTop")=2 then
		IconImage="topic-announce.gif alt='公告主题'"
	elseif Rs("ThreadTop")=1 then
		IconImage="topic-pinned.gif alt='置顶主题'"
	elseif Rs("IsGood")=1 then
		IconImage="topic-popular.gif alt='精华主题'"
	elseif Rs("IsLocked")=1 then
		IconImage="topic-locked.gif alt='主题锁定'"
	elseif Rs("IsVote")=1 then
		IconImage="topic-poll.gif alt='投票主题'"
	elseif DateDiff("d",Rs("PostTime"),Now()) <= SiteConfig("PopularPostThresholdDays")   and  (  Rs("TotalReplies")=>SiteConfig("PopularPostThresholdPosts") or  Rs("TotalViews")=>SiteConfig("PopularPostThresholdViews") ) then
		IconImage="topic-hot.gif alt='热门主题'"
	else
		IconImage="topic.gif alt='普通主题'"
	end if
	
	if Rs("TotalReplies")=0 then
		replies="-"
	else
		replies=Rs("TotalReplies")
	end if
	
	if Rs("Category")<>"" then
		CategoryHtml="[<a href=ShowForum.asp?ForumID="&Rs("ForumID")&"&Category="&Rs("Category")&">"&Rs("Category")&"</a>] "
	else
		CategoryHtml=""
	end if
	if Rs("ThreadEmoticonID")>0 then
		ThreadEmoticonID="<img src=images/Emoticons/"&Rs("ThreadEmoticonID")&".gif> "
	else
		ThreadEmoticonID=""
	end if
	
	if SiteConfig("DisplayThreadStatus")=1 then
		if Rs("ThreadStatus")=1 then
			ThreadStatus="<img src=images/status_Answered.gif align=middle title='主题状态：已解决'>"
		elseif Rs("ThreadStatus")=2 then
			ThreadStatus="<img src=images/status_NotAnswered.gif align=middle title='主题状态：未解决'>"
		else
			ThreadStatus="<img src=images/status_NotSet.gif align=middle>"
		end if
	end if
	
	if DateDiff("d",Rs("PostTime"),Now()) < 2 then
		NewHtml=" <img title='一天内新发表的主题' src=images/new.gif align=absmiddle>"
	else
		NewHtml=""
	end if
	if Request("checkbox")=1 then checkboxHtml="<input type=checkbox value="&Rs("ThreadID")&" name=ThreadID> "
	if Rs("TotalRatings")>0 then StarHtml="<a style=CURSOR:pointer onclick="&CHR(34)&"OpenWindow('PostRating.asp?ThreadID="&Rs("ThreadID")&"')"&CHR(34)&" ><img border=0 src=Images/Star/"&cint(Rs("RatingSum")/Rs("TotalRatings"))&".gif align=middle></a>"
	if Rs("TotalReplies")=>SiteConfig("PostsPerPage") then
		MaxPostPage=fix(Rs("TotalReplies")/SiteConfig("PostsPerPage"))+1 '共多少页
		ShowPostPage="( <img src=images/multiPage.gif> "
		For PostPage = 1 To MaxPostPage
			if PostPage<11 or MaxPostPage=PostPage then ShowPostPage=""&ShowPostPage&"<a href=ShowPost.asp?PageIndex="&PostPage&"&ThreadID="&Rs("ThreadID")&"><b>"&PostPage&"</b></a> "
		Next
		ShowPostPage=""&ShowPostPage&")"
	else
		ShowPostPage=""
	end if
%>
	<tr id=CommonListCell>
		<td width="55%">

				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td width="30"><a target="_blank" href="ShowPost.asp?ThreadID=<%=Rs("ThreadID")%>"><img src=images/<%=IconImage%> border=0 ></a></td>
						<td><%=checkboxHtml%><%=ThreadEmoticonID%><%=CategoryHtml%><a href="ShowPost.asp?ThreadID=<%=Rs("ThreadID")%>"><span style="<%=Rs("ThreadStyle")%>"><%=Rs("Topic")%></span></a><%=ShowPostPage%><%=NewHtml%></td>
						<td align="right"><%=StarHtml%>&nbsp;<%=ThreadStatus%></td>
					</tr>
				</table>

		</td>
		
		<td align="center" width="13%"><a href="Profile.asp?UserName=<%=Rs("PostAuthor")%>"><%=Rs("PostAuthor")%></a><br><%=FormatDateTime(Rs("PostTime"),2)%></td>
		<td align="center" width="7%"><%=replies%></td>
		<td align="center" width="7%"><%=Rs("TotalViews")%></td>
		<td align="center" width="18%"><%=Rs("lasttime")%><br>by <a href="Profile.asp?UserName=<%=Rs("lastname")%>"><%=Rs("lastname")%></a></td>

	</tr>
<%
End Sub

''''''''''''''''''''''''''''''''
Sub Alert(Message)
%>
	<script language="JavaScript">
	alert('<%=Message%>');
	window.history.back();
	</script>
	<script language="JavaScript">window.close();</script>
<%
	Response.End
End Sub

Sub ShowPage()
	PageUrl=ReplaceText(Request.QueryString,"PageIndex=([0-9]*)&","")
	if Request.Form<>empty then PageUrl=""&PageUrl&"&"&Request.Form&""
	%><script language="JavaScript">ShowPage(<%=TotalPage%>,<%=PageCount%>,"<%=PageUrl%>")</script><%
End Sub


%>