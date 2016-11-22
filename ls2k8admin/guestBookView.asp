
<!--#include file="../inc/config.asp"-->
<%
gbid = request.QueryString("gbid")
action = request.QueryString("action")

sql="select * from guestbook where gbid="&gbid
set rs = conn.execute(sql)
if rs.eof and rs.bof then
	response.write("暂无内容")
else
	if action = "content" then
%>
<strong>详细内容:</strong><%=rs("gbcontent")%>
<%
	else
%>
<strong>电话:</strong><%=rs("gbphone")%><br />
<strong>邮箱:</strong><%=rs("gbmail")%><br />
<strong>联系方式:</strong><%=rs("gbcontact")%><br />
<%	
	end if
	sql="update guestbook set hasview=1 where gbid="&gbid
	conn.execute(sql)
end if
%>