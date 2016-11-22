
<%
'注消session
session("adminName")=""
session("adminRealName")=""
session("adminIp")=""
session("adminRegion")=""
session("lastUrl")=""
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/login.js" type="text/javascript"></script><!--本页专有JS-->
</head>
<body>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="40" colspan="3" align="right" background="images/logo_02.gif"><img src="images/logo_03.gif" width="90" height="40"></td>
  </tr>
  <tr>
    <td width="50%" height="531" background="images/logo_04.gif" align="right"><table width="400" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="150">&nbsp;</td>
      </tr>
      <tr>
        <td align="left"><img src="images/logo_10.gif" width="348" height="48"></td>
      </tr>
      <tr>
        <td><table width="100%"  border="0" cellspacing="3" cellpadding="3" id="loginIntro" style="display:none;">
          <tr>
            <td class="linki" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td class="linki" align="left"><li>认真、高效、追求卓越、坚决执行、没有任何借口！</li></td>
          </tr>
          <tr>
            <td class="linki" align="left"><li>客户是我们的动力、技术是我们的保障、客户是我们的生命、</li></td>
          </tr>
          <tr>
            <td class="linki" align="left">&nbsp;&nbsp;&nbsp;&nbsp;捍卫企业荣誉、誓做山东第一！</td>
          </tr>
          <tr>
            <td class="linki" align="left"><li>LUCK-STAR 2007</li></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="200">&nbsp;</td>
      </tr>
    </table></td>
    <td width="14" height="531"><img src="images/logo_07.gif" width="14" height="531"></td>
    <td width="50%" background="images/logo_09.gif" align="left"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="350" valign="bottom"><table width="400" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5%">&nbsp;</td>
            <td class="title"><table width="100%"  border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>阿科思达网站管理系统</td>
              </tr>
            </table>
              </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
			<%
			dim errCode
			errMsg = cstr(request.QueryString("errMsg"))
			if errMsg = "" then
				response.write errMsg
			%>
                <form id="form1" name="form1" method="post" action="loginCheck.asp">
                  <table width="260"  border="0" cellspacing="3" cellpadding="3" id="loginTb" style="display:none;">
                    <tr>
                      <td width="60">用户名:</td>
                      <td width="200"><input name="username" type="text" id="userpass" size="20" class="border1" style="width:160px;" /></td>
                    </tr>
                    <tr>
                      <td>密　码:</td>
                      <td><input name="userpass" type="password" id="userpass" size="22" class="border2" style="width:160px;" /></td>
                    </tr>
                    <tr>
                      <td>验证码:</td>
                      <td><input name="verifyCode" type="text" id="verifycode" size="20" class="border2"  style="width:120px;" />&nbsp;<img src="../inc/Getcode.asp"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><table width="55%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><input name="submit" type="image" src="images/logo_13.gif" width="73" height="22"></td>
                            <td><img src="images/logo_15.gif" width="72" height="22" style="cursor:hand;" onClick="document.form1.reset();document.form1.username.focus();"></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table>
                </form>
			<%
			else
			%>
			<table width="100%"  border="0" cellspacing="3" cellpadding="3">
			  <tr>
				<td width="13%">T_T</td>
				<td width="87%">错误:</td>
			  </tr>
			  <tr>
				<td>&nbsp;</td>
				<td><%=errMsg%></td>
			  </tr>
			  <tr>
				<td>&nbsp;</td>
				<td  class="link"><a href="#" onClick="window.history.go(-1)">[返回]</a></td>
			  </tr>
			  <tr>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
			</table>
			<%
			end if
			%>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="181"><div align="right">
          <table width="60%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="79%"><img src="images/logo_21.gif" width="230" height="56"></td>
              <td width="21%"><div align="left">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="40" height="40">
                    <param name="movie" value="images/main.swf">
                    <param name="quality" value="high">
                    <embed src="images/main.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="40" height="40"></embed>
                    <param name="wmode" value="transparent">
                </object>
              </div></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="21" colspan="3"background="images/logo_24.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80%" align="center" class="end">Copyright &copy; 2007 Luck-Star All Right Reserved</td>
        <td><table width="156" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="images/logo_26.gif" width="20" height="21"></td>
            <td width="136" background="images/logo_27.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

</body>
</html>
