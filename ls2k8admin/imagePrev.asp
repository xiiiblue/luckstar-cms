
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
</head>
<body>
<%
picPath = request.QueryString("picPath")
%>
<img src="../uploadPic/<%=picPath%>" onload="javascript:var maxWidth=280;var maxHeight=280;var maxRate=maxWidth/maxHeight;var imageRate = this.width/this.height;if(imageRate>maxRate){this.width=maxWidth;this.height=maxWidth/imageRate;}else{this.height=maxHeight;this.width=maxHeight*imageRate;}" />
</body>
</html>
