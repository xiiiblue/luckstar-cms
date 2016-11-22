
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/uploadclass.asp"-->
<%
'--------------初始化--------------------
'初始化缩略图组件
dim Jpeg
if IsObjInstalled("Persits.Jpeg") then	'判断JPEG组件是否安装,开始生成缩略图
	Set Jpeg = Server.CreateObject("Persits.Jpeg")
end if
'初始化风声上传类
dim request2
set request2=New UpLoadClass
request2.MaxSize=5000*1024 
request2.FileType="bmp/gif/jpg" 
request2.Savepath="../uploadPic/"
request2.Charset="UTF-8"
request2.Open()
'初始化RS
dim rs
Set rs = Server.CreateObject("ADODB.Recordset")


'---------------图片保存,写数据库-------------------
dim productId,rsOrder,sql,startOrder,L
dim intTemp,formName,picPath,picName

'取得图片序号
sql="select top 1 * from productpic where productid = "&cstr(Request2.Form("proid"))&" order by picorder desc"
rs.open sql,conn,1,3
if not (rs.eof and rs.bof) then
	startOrder = rs("picorder")
else
	startOrder = 0
end if
rs.close
'response.write startOrder
for intTemp=2 to Ubound(request2.FileItem) '因为使用JS多文件上传会有空白Input栏,故从2开始
	startOrder = startOrder + 1 
	formName=request2.FileItem(intTemp)
	picPath = Server.MapPath(".")&"\"&request2.SavePath
	picName = request2.Form(formname)
	
	if IsObjInstalled("Persits.Jpeg") then	'判断JPEG组件是否安装,开始生成缩略图
		Jpeg.Open picPath&picName
		if (xiii_picwidth/xiii_picheight)>=(Jpeg.OriginalWidth/Jpeg.OriginalHeight) then
			Jpeg.Width = xiii_picheight*(Jpeg.OriginalWidth/Jpeg.OriginalHeight)
			Jpeg.Height = xiii_picheight
		else
			Jpeg.Width = xiii_picwidth
			Jpeg.Height = xiii_picwidth/(Jpeg.OriginalWidth/Jpeg.OriginalHeight)
		end if
		'L = 100
'		Jpeg.Width = L
'		Jpeg.Height = Jpeg.OriginalHeight * L / Jpeg.OriginalWidth
		Jpeg.Save picPath&"min_"&picName
	end if
	
	sql="select * from productpic"
	rs.open sql,conn,1,3
	rs.addnew
	rs("productid") = Request2.Form("proid")
	rs("picorder") = startOrder
	rs("picname") = ""
	rs("picpath") = picName
	rs.update
	rs.close
next




'接收表单
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from product where proid = " & Request2.Form("proid")
rs.open sql,conn,1,3
rs("proclassid") = clng(Request2.Form("proclassid"))
rs("proname_cn") = Request2.Form("proname_cn")
rs("proname_en") = Request2.Form("proname_en")
rs("propic") = Request2.Form("propic")
rs("hasparameter") = clng(Request2.Form("hasparameter"))
rs("proorder") = clng(Request2.Form("proorder"))
rs("proparameter_cn") = Request2.Form("proparameter_cn")
rs("proparameter_en") = Request2.Form("proparameter_en")
rs("hasoutline") = clng(Request2.Form("hasoutline"))
rs("prooutline_cn") = Request2.Form("prooutline_cn")
rs("prooutline_en") = Request2.Form("prooutline_en")
rs("haspic") = clng(Request2.Form("haspic"))
rs("prointro_cn") = Request2.Form("prointro_cn")
rs("prointro_en") = Request2.Form("prointro_en")
if Request2.Form("proshow") <> "" then
	rs("proshow") = 1
end if
if Request2.Form("prohot") <> "" then
	rs("prohot") = 1
end if
if Request2.Form("proup") <> "" then
	rs("proup") = 1
end if
if Request2.Form("procommend") <> "" then
	rs("procommend") = 1
end if
rs("prodate") =  now()
rs("proprice") = Request2.Form("proprice")
rs.update
rs.close

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>product_add_do</title>
</head>

<body>
<script>alert("变更成功");window.history.go(-2);</script>
</body>
</html>
