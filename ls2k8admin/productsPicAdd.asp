
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
	<link href="css/simple.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->	<script src="js/multiFileUp.js" type="text/javascript"></script><!--多文件上传-->
</head>
<body>
<%
action = request("action")
if action = "single" then
%>
<h1>单图片上传表单</h1>
<table>
<form id="showupload" action="productsPicAddDo.asp" method="POST" enctype="multipart/form-data" name="picForm1">
  <tr bgcolor="#ECF7FF">
	<td bgcolor="#FFFFFF" height="50">
	<input type="hidden" name="action" value="add" />
	</td>
	<td bgcolor="#FFFFFF" id="objFiles"><input type="file" maxlength="5"/></td>
	<td bgcolor="#FFFFFF"><input type="submit" id="picForm1Submit" value="上传" /></td>
  </tr>
</form>
</table>
<%
else
%>
<h1>多图片上传表单</h1>
<table>
<form id="showupload" action="productsPicAddDo.asp" method="POST" enctype="multipart/form-data" name="picForm2">
  <tr bgcolor="#ECF7FF">
	<td bgcolor="#FFFFFF" height="50">
	<input type="hidden" name="action" value="add" />
	</td>
	<td bgcolor="#FFFFFF" id="objFiles"><input type="file" class="multi" maxlength="5"/></td>
	<td bgcolor="#FFFFFF"><input type="submit" id="picForm1Submit" value="上传" /></td>
  </tr>
</form>
</table>

<%
end if
%>
<!--这是一个获取Iframe里click事件的对象,以此来判断表单是否上传完成,目前只能想到这个,也许有更好的方法-->
<div id="getIframeResponse" style="display:none;"></div>
<!--这是等待画面-->
<div id="loading" style="display:none;">请等待...</div>
<!--这是上传成功画面-->
<div id="success" style="display:none;">成功!!!</div>
</body>
</html>
