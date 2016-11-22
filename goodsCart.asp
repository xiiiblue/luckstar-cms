<!--#include file="inc/config.asp"-->
<%
if isempty(request.QueryString("goodsid")) then
	goodsid = 0
else
	goodsid = clng(request.QueryString("goodsid"))
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Luck-Star</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/goodsCart.js" type="text/javascript"></script><!--本页专有JS-->
</head>
<body style=" background:none;">
<div style="width:500px; background-color:#DFEEF5; margin:10px auto;">
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
	sql = "select * from goodscart where sessionid='"&session.SessionID&"' and goodsid="&goodsid&""
	set rs = conn.execute(sql)
	if rs.eof and rs.bof then
		if goodsid<>0 then
			sql = "insert into goodscart (sessionid,goodsid,goodsnumber) values ('"&session.SessionID&"',"&goodsid&",1)"
			conn.execute(sql)
		end if
	else
		'response.Write("您已选购此商品")
	end if
	
%>
<table width="100%" border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td width="8%" bgcolor="#FFFFFF" class="main_title"><div align="center">ID</div></td>
    <td width="30%" bgcolor="#FFFFFF" class="main_title">系统名称</td>
    <td width="22%" bgcolor="#FFFFFF" class="main_title">价格</td>
    <td width="23%" bgcolor="#FFFFFF" class="main_title">数量</td>
    <td width="17%" bgcolor="#FFFFFF" class="main_title"><div align="center">编辑</div></td>
  </tr>
<%
	sql = "select * from goodscart where sessionid='"&session.SessionID&"'"
	set rs=conn.execute(sql)
	if rs.eof and rs.bof then
		response.Write("暂无内容")
	else
		do while not rs.eof
		sql = "select * from product where proid="&rs("goodsid")
		set rs1 = conn.execute(sql)
%>
  <tr>
    <td bgcolor="#FFFFFF"><div align="center"><%=rs1("proid")%></div></td>
    <td bgcolor="#FFFFFF"><%=rs1("proname_cn")%></td>
    <td bgcolor="#FFFFFF">
	<input type="text" class="goodsprice coolInput" value="<%=rs1("proprice")%>" size="3" readonly="readonly" />
	</td>
	<form action="goodsCartAlt.asp" method="get">
	<input type="hidden" name="action" value="modify" />
	<input type="hidden" name="goodsid" value="<%=rs("goodsid")%>" />
    <td bgcolor="#FFFFFF">
	<input type="text" name="goodsnumber" class="goodsnumber coolInput" value="<%=rs("goodsnumber")%>" size="3" />
	<input name="submit" type="submit" value="修改" />
	</td>
	</form>
    <td bgcolor="#FFFFFF"><div align="center"><a href="goodsCartAlt.asp?action=del&goodsid=<%=rs("goodsid")%>">删除</a></div></td>
  </tr>
<%
			rs.movenext
		loop
	end if
%>
  <tr>
    <td colspan="5" bgcolor="#FFFFFF"><span class="yellow">价格总计：<input type="text" id="totalPrice" value="0" size="3" readonly="readonly" class="coolInput" />元</span>
        <div align="center"></div>
      <div align="center"></div></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="3" cellpadding="3">
<form action="goodsOrder.asp" method="post">
  <tr>
	<td colspan="1" bgcolor="#FFFFFF">联系方式</td>
    <td colspan="4" bgcolor="#FFFFFF"><textarea name="extaddress" id="extaddress" cols="48" rows="3" class="coolTextArea">这里写下您的联系方式</textarea></td>
  </tr>
  <tr>
	<td colspan="1" bgcolor="#FFFFFF">简要留言</td>
    <td colspan="4" bgcolor="#FFFFFF"><textarea name="extmemo" id="extmemo" cols="48" rows="3" class="coolTextArea">这里写下您的简要留言</textarea></td>
  </tr>
  <tr>
    <td colspan="5" bgcolor="#FFFFFF">
	<input type="submit" name="submit" value="提交订单" />
	</td>
  </tr>
</form>
</table>
<%
end if
%>
</div>
</body>
</html>
