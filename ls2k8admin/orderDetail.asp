
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Luck-Star</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/orderDetail.js" type="text/javascript"></script><!--本页专有JS-->
</head>
<body style=" background:none;">
<div style="width:380px; background-color:#DFEEF5; margin:10px auto;">
<table width="100%" border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td width="10%" bgcolor="#FFFFFF" class="main_title"><div align="center">ID</div></td>
    <td width="30%" bgcolor="#FFFFFF" class="main_title">系统名称</td>
    <td width="30%" bgcolor="#FFFFFF" class="main_title">价格</td>
    <td width="30%" bgcolor="#FFFFFF" class="main_title">数量</td>

  </tr>
<%
	sql = "update goodsorder set hasview=1 where sessionid='"&request.QueryString("sessionid")&"'"
	conn.execute(sql)
	sql = "select * from goodscart where sessionid='"&request.QueryString("sessionid")&"'"
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
	<input type="text" class="goodsprice orderText" value="<%=rs1("proprice")%>" size="3" readonly="readonly" />
	</td>
    <td bgcolor="#FFFFFF">
	<input type="text" name="goodsnumber" class="goodsnumber orderText" value="<%=rs("goodsnumber")%>" size="3" />
	</td>
  </tr>
<%
			rs.movenext
		loop
	end if
%>

  <tr>
	<td colspan="1" bgcolor="#FFFFFF"></td>
    <td colspan="3" bgcolor="#FFFFFF" align="right">
	<span class="yellow" style="float:right;">价格总计：<input type="text" id="totalPrice" value="0" size="3" readonly="readonly" class="orderText" />元&nbsp;&nbsp;&nbsp;&nbsp;</span>
	</td>
  </tr>
</table>
</div>
</body>
</html>
