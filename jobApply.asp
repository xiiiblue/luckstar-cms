<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>应聘信息</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/thickbox.css" rel="stylesheet" type="text/css" /><!--thickbox-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/thickbox.js" type="text/javascript"></script><!--thickbox-->
	<script src="js/slider.js" type="text/javascript"></script><!--滑动条-->
	<link href="css/slider.css" rel="stylesheet" type="text/css" />
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/jobApply.js" type="text/javascript"></script><!--本页专有JS-->
</head>
<body style="background:none;">
<%
jobid = request("jobid")
if isempty(jobid)  then
	response.Write("无效的参数")
	response.End()
end if
%>
<table border="0" cellspacing="3" cellpadding="3" class="jobTb" align="center">
<form name="form1" action="jobApplyDo.asp" method="post">
<input type="hidden" name="jobid" value="<%=jobid%>" />
  <tr>
    <td width="74"><div align="right">姓名:</div></td>
    <td width="361"><input type="text" name="applyname" value="姓名" class="jobText" /></td>
  </tr>
  <tr>
    <td><div align="right">性别:</div></td>
    <td>
		<label><input type="radio" name="applysex" value="0" checked="checked" />男</label>	
		<label><input type="radio" name="applysex" value="1" />女</label>	
	</td>
  </tr>
  <tr>
    <td><div align="right">年龄:</div></td>
    <td><input type="text" name="applyage" value="30" maxlength="4" size="50" class="suSlider jobText" minvalue="18" maxvalue="50" stepvalue="1" /></td>
  </tr>
  <tr>
    <td><div align="right">联系方式:</div></td>
    <td><input type="text" name="applyphone" value="联系方式" class="jobText" /></td>
  </tr>
  <tr>
    <td><div align="right">工作经历:</div></td>
    <td><textarea name="applyhistory" cols="30" rows="5" class="jobTA">工作经历...</textarea></td>
  </tr>
  <tr>
    <td><div align="right">个人简介:</div></td>
    <td><textarea name="applyintro" cols="30" rows="5" class="jobTA">个人简介</textarea></td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
    <td>
	<input type="submit" name="submit" value="提 交" />
	</td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
  </tr>
</form>
</table>
</body>
</html>
