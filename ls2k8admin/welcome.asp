
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/welcome.js" type="text/javascript"></script><!--本页专有JS-->
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
    <td height="45" valign="bottom" bgcolor="#C7DAE9"><table border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25">&nbsp;</td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#FF6600" align="center" class="white"><a href="welcome.asp"><b>预留</b></a></td>
        <td width="10">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="500" valign="top" bordercolor="#DAEBEF" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="1" bgcolor="#666666"></td>
      </tr>
      <tr>
        <td height="25">&nbsp;</td>
      </tr>
      
      <tr>
        <td><table width="90%" border="0" align="center" cellpadding="2" cellspacing="2">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
<%
set rsLog=server.createobject("adodb.recordset")
sql="Select top 2 * from adminlog where adminname='"&session("adminName")&"' order by logid desc"
rsLog.open sql,Conn,1,3
if rsLog.eof and rsLog.bof then
else
	rsLog.movelast()
%>

			欢迎登录:<strong><%=session("adminRealName")%></strong>&nbsp;&nbsp;&nbsp;&nbsp; 
			上次登录时间: <%=rsLog("logdate")%> &nbsp;&nbsp;&nbsp;&nbsp;
			上次登录IP: <%=rsLog("adminip")%>&nbsp;&nbsp;&nbsp;
			上次登录地点: <%=rsLog("adminRegion")%>&nbsp;&nbsp;&nbsp;
			<a href="#" id="viewLog" class="red">查看登录记录</a>
<%
end if
rsLog.close
set rsLog=Nothing
%>		
			</td>
          </tr>
          <tr>
            <td>
			<div id="logList" style="margin:10px 0px; width:600px; border:2px solid #DAEBEF; padding:10px; display:none;">
			<img src="images/loadingAnimation.gif" />
			<p>&nbsp;&nbsp;正在读取,请等待...</p>
			</div>
			</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
<%
sql="select count(gbid) from guestbook where hasview=0"
set rs=conn.execute(sql)
%>
			留言本中有[<%=rs(0)%>]条新的留言！<a href="guestBookList.asp"><span class="red">前往查看</span></a>
			</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
<%
sql="select count(id) from goodsorder where hasview=0"
set rs=conn.execute(sql)
%>
			您有[<%=rs(0)%>]条新的订单尚未处理！<a href="orderList.asp"><span class="red">前往查看</span></a>
			</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
<%
sql="select count(applyid) from jobapply where hasview=0"
set rs=conn.execute(sql)
%>
			您有[<%=rs(0)%>]条求职信息尚未查看！<a href="jobList.asp"><span class="red">前往查看</span></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
			<%if IsObjInstalled("Persits.Jpeg") then	'判断JPEG组件是否安装,开始生成缩略图%>
			您已安装AspJPEG图像组件，可以使用缩略图功能！
			<%else%>
			您未安装AspJPEG图像组件，无法使用缩略图功能！
			<%end if%>
			</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
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