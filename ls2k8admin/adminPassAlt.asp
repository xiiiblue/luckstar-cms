<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/adminPassAlt.js" type="text/javascript"></script><!--本页专有JS-->
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
        <td width="80" bgcolor="#FF6600" align="center" class="white"><a href="adminPassAlt.asp"><strong>修改密码</strong></a></td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#838383" align="center" class="white"><a href="help.asp">系统信息</a></td>
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
        <td>

      <table width="500" border="0" align="center" cellpadding="3" cellspacing="1" style="border:2px solid #C7DAE9">
        <form method="POST" action="adminPassAltDo.asp">
          <tr align="center" bgcolor="c0c0c0">
            <td height="20" colspan="2" bgcolor="#C7DAE9"><strong>修改密码</strong></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">更改用户名：</td>
            <td bgcolor="#F5FAFE"><input name="adminname" type="text" class="input1" value="<%=session("adminname")%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">更改真实姓名：</td>
            <td bgcolor="#F5FAFE"><input name="adminrealname" type="text" class="input1" value="<%=session("adminrealname")%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">输入当前密码：</td>
            <td bgcolor="#F5FAFE"><input name="adminpass" type="password" value="" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">输入新密码：</td>
            <td bgcolor="#F5FAFE"><input name="adminpass1" type="password" value="" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">重复新密码：</td>
            <td bgcolor="#F5FAFE"><input name="adminpass2" type="password" value="" size="32"></td>
          </tr>
          <tr align="center" bgcolor="c0c0c0">
            <td colspan="2" bgcolor="#C7DAE9"><input name="saveSet" type="Submit" value="确 定">
                <input name="B2" type="reset" value="重 置"></td>
          </tr>
        </form>
      </table>
		
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