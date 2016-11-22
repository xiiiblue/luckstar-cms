
<!--#include file="../inc/config.asp"-->
<%
dim rs,productId,picOrder,picId,action,sql,isOk,idUp,idDown,orderUp,orderDown
set rs=server.CreateObject("ADodb.Recordset")   
productId=request("proid")
picOrder=request("picOrder")
picId=request("picId")
action=request("action")
'判断是上移还是下移,为易读性增加了冗余的代码
if (action="up") then
	sql="select top 1 * from newspic where productid="&productId&" and picorder<"&picOrder&" order by picorder desc"
	response.Write("UP<br>")
else
	sql="select top 1 * from newspic where productid="&productId&" and picorder>"&picOrder&" order by picorder"
	response.Write("DOWN<br>")
end if
rs.open sql,conn,3,1
if not (rs.eof and rs.bof) then
	isOk = 1
	idUp = rs("id")
	idDown = picId
	orderUp = rs("picOrder")
	orderDown = picOrder
else
	isOk = 0
end if

'互换排序字段
if (isOk = 1) then
	response.Write("OKOKOK<BR>")
	sql="update newspic set picorder = "&orderUp&" where id = "&idDown
	conn.execute(sql)
	sql="update newspic set picorder = "&orderDown&" where id = "&idUp
	conn.execute(sql)
	response.Write(sql)
end if

rs.close
conn.close
	response.Write "<script>alert('移动成功'); window.location.href='proPicList.asp?proid="&productId&"'</script>"
%>

