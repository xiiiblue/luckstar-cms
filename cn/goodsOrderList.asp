<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Luck-Star</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
</head>
<body style=" background:none;">
<div style="width:380px; background-color:#DFEEF5; margin:10px auto;">
<%
if CookieUserName=empty then
%>
<table cellspacing="1" cellpadding="5" width=100% id=CommonListArea>
	<tr id=CommonListTitle>
		<td width="100%" colspan="2" align="center">提示信息</td>
	</tr>
	<tr id=CommonListCell>
		<td valign="top" align="Left" colspan="2" height="122">
		<table cellspacing="0" cellpadding="5" width="100%" border="0">
			<tr>
				<td width="83%" valign="top"><b>错误：</b><ul>未登录用户不能提交订单，请先登录</ul></td>
				<td width="17%"><img height="97" src="images/succ.gif" width="95" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr align="center" id=CommonListCell>
		<td valign="center" colspan="2"><input onClick="window.parent.location.reload();" type="button" value="<<关闭窗口>>" /></td>
	</tr>
</table>
<%
else
%>
<table width="380" border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td width="20%" bgcolor="#FFFFFF" class="main_title"><div align="center">订单ID</div></td>
    <td width="40%" bgcolor="#FFFFFF" class="main_title">提交时间</td>
    <td width="20%" bgcolor="#FFFFFF" class="main_title">查看详情</td>
    <td width="20%" bgcolor="#FFFFFF" class="main_title">删除订单</td>
  </tr>
<%
	sql = "select * from goodsorder where userid="&CookieUserID
	set rs=conn.execute(sql)
	if rs.eof and rs.bof then
		response.Write("暂无内容")
	else
		do while not rs.eof
%>
  <tr>
    <td bgcolor="#FFFFFF"><div align="center"><%=rs("sessionid")%></div></td>
    <td bgcolor="#FFFFFF"><%=rs("sysdate")%></td>
    <td bgcolor="#FFFFFF"><a href="goodsOrderDetail.asp?sessionid=<%=rs("sessionid")%>">查看</a></td>
    <td bgcolor="#FFFFFF"><a href="goodsOrderAlt.asp?action=del&id=<%=rs("id")%>" onclick="return confirm('确定要删除吗?')">删除</a></td>
  </tr>
<%		
			rs.movenext
		loop
	end if
%>
</table>
<%
end if
%>
</div>
</body>
</html>
