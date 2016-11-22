
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>

<%
sql ="insert into SendMsgTable (PhoneNumber, MsgTitle, MsgStatus, MsgType) values ('13605406030','文字短信测试消息',0,0)"
connSms.execute(sql)
%>
</body>
</html>
