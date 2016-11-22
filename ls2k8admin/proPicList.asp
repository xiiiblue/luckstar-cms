
<!--#include file="../inc/config.asp"-->
<%
dim proid,rsPic,sql
if isempty(request("proid")) then 
	proid = 0
else
	proid = request("proid")
end if
%>
<ul>
<%
set rsPic = server.CreateObject("ADODB.Recordset")   
Sql="select * from productpic where productid="&proid&" order by picorder"
rsPic.open sql,conn,1,1
if rsPic.bof and rsPic.eof then
	response.Write("暂无图片")
else
	do while not rsPic.eof
%>
<li><div class="imgNo">[<%=rsPic("picorder")%>]</div>
<a href="imagePrev.asp?picPath=<%=rsPic("picpath")%>&width=320" class="jTip" id="picPrev<%=rsPic("id")%>" name="">
<%=rsPic("picpath")%>
</a>
<a class="ajaxOrder" href="proPicOrder.asp?action=up&proid=<%=proid%>&picId=<%=rsPic("id")%>&picOrder=<%=rsPic("picOrder")%>" title="上移">↑</a> 
<a class="ajaxOrder" href="proPicOrder.asp?action=down&proid=<%=proid%>&picId=<%=rsPic("id")%>&picOrder=<%=rsPic("picOrder")%>" title="下移">↓</a>
<a class="ajaxDel" href="proPicDel.asp?action=del&proid=<%=proid%>&picId=<%=rsPic("id")%>&picOrder=<%=rsPic("picOrder")%>" title="删除">X</a>
</li>
<%	
		rsPic.movenext
	loop
end if
rsPic.close
%>
</ul>