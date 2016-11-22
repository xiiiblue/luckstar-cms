
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/detect.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/welcome.js" type="text/javascript"></script><!--本页专有JS-->
	<style>
	<!--
	h1 {font-size:14px;color:#3F8805;font-family:Arial;margin:15px 0px 5px 0px}
	h2 {font-size:12px;color:#000000;margin:15px 0px 8px 0px}
	h3 {font-size:12px;color:#3F8805;font-family:Arial;margin:7px 0px 3px 12px;font-weight: normal;}
	BODY,TD{FONT-FAMILY: 宋体;FONT-SIZE: 12px;word-break:break-all}
	/*tr{BACKGROUND-COLOR: #EEFEE0}*/
	A{COLOR: #3F8805;TEXT-DECORATION: none}
	A:hover{COLOR: #000000;TEXT-DECORATION: underline}
	A.a1{COLOR: #000000;TEXT-DECORATION: none}
	A.a1:hover{COLOR: #3F8805;TEXT-DECORATION: underline}
	/*table{BORDER: #3F8805 1px solid;background-color:#3F8805;margin-left:12px}*/
	p{margin:5px 12px;color:#000000}
	.input{BORDER: #111111 1px solid;FONT-SIZE: 9pt;BACKGROUND-color: #F8FFF0}
	.backs{BACKGROUND-COLOR: #3F8805;COLOR: #ffffff;text-align:center}
	.backq{BACKGROUND-COLOR: #EEFEE0}
	.backc{BACKGROUND-COLOR: #3F8805;BORDER: medium none;COLOR: #ffffff;HEIGHT: 18px;font-size: 9pt}
	.fonts{	COLOR: #3F8805}
	-->
	</STYLE>
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
    <td height="45" valign="bottom" bgcolor="#C7DAE9">
	<table border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td width="80" height="25" bgcolor="#838383" align="center" class="white"><a href="sysConfig.asp">常规设置</a></td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#838383" align="center" class="white"><a href="adminPassAlt.asp">修改密码</a></td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#FF6600" align="center" class="white"><a href="help.asp"><b>系统信息</b></a></td>
        <td width="10">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	</td>
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
        <td style="padding:0 0 0 100px;">
<%
call mmenu()
for qq=1 to len(T)
  call BodyGo(mid(T,qq,1))
next
call mmenu()
%>
<br>
<br>
		</td>
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