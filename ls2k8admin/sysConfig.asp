
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/sysConfig.js" type="text/javascript"></script><!--本页专有JS-->
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
        <td width="80" height="25" bgcolor="#FF6600" align="center" class="white"><a href="sysConfig.asp"><strong>常规设置</strong></a></td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#838383" align="center" class="white"><a href="adminPassAlt.asp">修改密码</a></td>
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
        <form method="POST" action="sysConfigDo.asp">
          <tr align="center" bgcolor="c0c0c0">
            <td height="20" colspan="2" bgcolor="#C7DAE9">
			<strong>系 统 设 置<%=request.Cookies("xiii_language")%></strong>
<script>

</script>
			</td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">语言版本：</td>
            <td bgcolor="#F5FAFE">
			<input name="xiii_language" id="xiii_language_cn" value="cn" type="radio" class="input1" <%if xiii_language="cn" then response.write("checked=""checked""") end if%> />
			<label for="xiii_language_cn">中文</label>
			<input name="xiii_language" id="xiii_language_en" value="en" type="radio" class="input1" <%if xiii_language="en" then response.write("checked=""checked""") end if%> />
			<label for="xiii_language_en">英文</label>
			<input name="xiii_language" id="xiii_language_multi" value="multi" type="radio" class="input1" <%if xiii_language="multi" then response.write("checked=""checked""") end if%> />
			<label for="xiii_language_multi">双语</label>
			</td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">页面形式：</td>
            <td bgcolor="#F5FAFE">
			<input name="xiii_staticpage" id="xiii_staticpage0" value="asp" type="radio" class="input1" <%if xiii_staticpage="asp" then response.write("checked=""checked""") end if%> />
			<label for="xiii_staticpage0">动态页</label>
			<input name="xiii_staticpage" id="xiii_staticpage1" value="html" type="radio" class="input1" <%if xiii_staticpage="html" then response.write("checked=""checked""") end if%> />
			<label for="xiii_staticpage1">静态页</label>
			</td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">网站名称：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_sitename" type="text" class="input1" value="<%=xiii_sitename%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">网站地址：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_siteurl" type="text" class="input1" value="<%=xiii_siteurl%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">关键字(meta)：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_keywords" type="text" class="input1" value="<%=xiii_keywords%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">描述(meta)：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_description" type="text" class="input1" value="<%=xiii_description%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">缩略图宽度：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_picwidth" type="text" class="input1" value="<%=xiii_picwidth%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">缩略图高度：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_picheight" type="text" class="input1" value="<%=xiii_picwidth%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">短信用户名：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_smsname" type="text" class="input1" value="<%=xiii_smsname%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">短信密码：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_smspass" type="text" class="input1" value="<%=xiii_smspass%>" size="32"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#E9F8FE">短信提交地址：</td>
            <td bgcolor="#F5FAFE"><input name="xiii_smsurl" type="text" class="input1" value="<%=xiii_smsurl%>" size="32"></td>
          </tr>
		  
          <tr align="center" bgcolor="c0c0c0">
            <td colspan="2" bgcolor="#C7DAE9"><input name="saveSet" type="Submit" class="input1" value="确 定"> </td>
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