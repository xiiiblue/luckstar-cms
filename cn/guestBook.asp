<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线留言</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/thickbox.css" rel="stylesheet" type="text/css" /><!--thickbox-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/thickbox.js" type="text/javascript"></script><!--thickbox-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/guestBook.js" type="text/javascript"></script><!--本页专有JS-->
</head>
<body style="background:none;">
<table border="0" cellspacing="3" cellpadding="3" class="guestBookTb" align="center">
<form name="form1" action="guestBookDo.asp" method="post">
  <tr>
    <td width="129"><div align="right">称呼</div></td>
    <td width="317"><input type="text" name="gbname" value="姓名" class="guestBookText" /></td>
  </tr>
  <tr>
    <td><div align="right">电话</div></td>
    <td><input type="text" name="gbphone" value="13800000000" class="guestBookText" /></td>
  </tr>
  <tr>
    <td><div align="right">邮箱</div></td>
    <td><input type="text" name="gbmail" value="somebody@163.com" class="guestBookText" /></td>
  </tr>
  <tr>
    <td><div align="right">联系方式:</div></td>
    <td><textarea name="gbcontact" cols="30" rows="5" class="guestBookTA">联系方式...</textarea></td>
  </tr>
  <tr>
    <td><div align="right">留言内容</div></td>
    <td><textarea name="gbcontent" cols="30" rows="5" class="guestBookTA">留言内容...</textarea></td>
  </tr>
  <tr>
    <td><div align="right">留言性质</div></td>
    <td>
		<input type="radio" name="gbclass" id="gbclass0" value="0" checked="checked" /><label for="gbclass0">谘询</label>	
		<input type="radio" name="gbclass" id="gbclass1" value="1" /><label for="gbclass1">合作</label>	
		<input type="radio" name="gbclass" id="gbclass2" value="2" /><label for="gbclass2">建议</label>		
	</td>
  </tr>
  <tr>
    <td><div align="right">反馈方式</div></td>
    <td>
		<input type="radio" name="gbreply" id="gbreply0" value="0" checked="checked" /><label for="gbreply0">不限</label>	
		<input type="radio" name="gbreply" id="gbreply1" value="1" /><label for="gbreply1">电话</label>	
		<input type="radio" name="gbreply" id="gbreply2" value="2" /><label for="gbreply2">邮件</label>	
	</td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
    <td>
	<input type="submit" name="Submit2" value="提 交" />
	</td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
  </tr>
</form>
</table>
</body>
</html>
