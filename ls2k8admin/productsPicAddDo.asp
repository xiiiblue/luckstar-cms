
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/uploadclass.asp"-->
<%
dim myrequest,Jpeg,rs
Set myrequest=new UpLoadClass
if IsObjInstalled("Persits.Jpeg") then	'判断JPEG组件是否安装,开始生成缩略图
	Set Jpeg = Server.CreateObject("Persits.Jpeg")
end if
Set rs = Server.CreateObject("ADODB.Recordset")
myrequest.MaxSize=5000*1024 
myrequest.FileType="bmp/gif/jpg" 
myrequest.Savepath="../uploadPic/"
myrequest.open


dim productId,rsOrder,sql,startOrder,L

response.Write("<p>"&productId&"</p>")
response.Write("<p>"&startOrder&"</p>")

dim intTemp,formName,picPath,picName
if  myrequest.form("action")="add" then
	startOrder = 0
	for intTemp=2 to Ubound(myrequest.FileItem) '因为使用JS多文件上传会有空白Input栏,故从2开始
		startOrder = startOrder + 1 
		formName=myrequest.FileItem(intTemp)
		picPath = Server.MapPath(".")&"\"&myrequest.SavePath
		picName = myrequest.Form(formname)
		
		if IsObjInstalled("Persits.Jpeg") then	'判断JPEG组件是否安装,开始生成缩略图
			Jpeg.Open picPath&picName
			L = 100
			Jpeg.Width = L
			Jpeg.Height = Jpeg.OriginalHeight * L / Jpeg.OriginalWidth
			Jpeg.Save picPath&"min_"&picName
		end if
		
		sql="select * from productpic"
		rs.open sql,conn,1,3
		rs.addnew
		rs("productid") = 0
		rs("picorder") = startOrder
		rs("picname") = ""
		rs("picpath") = picName
		rs.update
		rs.close
	next
%>
<strong>添加成功,请关闭本窗口</strong>
<%
end if
response.End()
%>
