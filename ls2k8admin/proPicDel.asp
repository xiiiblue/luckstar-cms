
<!--#include file="../inc/config.asp"-->
<%
dim proid,picOrder,picId,action,sql
proid=request("proid")
picOrder=request("picOrder")
picId=request("picId")
action=request("action")

if (action="del") then
	sql = "delete * from productpic where id="&picId
	conn.execute(sql)
	response.write("<script>alert('删除成功'); window.location.href='proPicList.asp?proid="&proid&"'</script>")
end if
%>
