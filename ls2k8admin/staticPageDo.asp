<!--#include file="../inc/config.asp"-->
<%
'on error resume next
Response.Buffer=false
Server.ScriptTimeOut=7200

'读URL地址
Function GetPage(url) 
 dim Retrieval
 Set Retrieval = CreateObject("Microsoft.XMLHTTP") 
 With Retrieval 
  .Open "Get", url, False ', "", "" 
  .Send 
  GetPage = BytesToBstr(.ResponseBody)
 End With 
 Set Retrieval = Nothing
End Function

'转码函数,终于找到了方法了^_^
Function BytesToBstr(body)
 dim objstream
 set objstream = Server.CreateObject("adodb.stream")
 objstream.Type = 1
 objstream.Mode =3
 objstream.Open
 objstream.Write body
 objstream.Position = 0
 objstream.Type = 2
 objstream.Charset = "utf-8"
 BytesToBstr = objstream.ReadText 
 objstream.Close
 set objstream = nothing
End Function


'正则替换
Function urlRewrite(strInput,regP,regR)
	Dim objRegExp, strOutput
	Set objRegExp = New Regexp
	objRegExp.IgnoreCase = True
	objRegExp.Global = True
	objRegExp.Pattern = regP
	strInput = objRegExp.Replace(strInput,regR)
	Set objRegExp = Nothing	
	urlRewrite = strInput
End Function

'生成页面!!!
function genHtml(sourcePage,staticPage)
	Url=baseUrl&sourcePage'要读取的页面地址
	wstr = GetPage(Url)
	
	'-------------以下是正则部分,根据需要编写,建议做ASP页面时按规则起名-------------------
	regPattern = """index.asp"""
	regReplace = """index.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)'替换index.aspp
	
	regPattern = """(newsView).asp\?id=(\d+)"""'这个替换列表页里文章链接
	regReplace = """$1_$2.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)
	regPattern = """(newsList).asp\?classid=(\d+)"""'这个替换列表页首页
	regReplace = """$1_$2_1.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)
	regPattern = "(newsList).asp\?classid=(\d+)&page=(\d+)"""'这个替换列表页分页链接
	regReplace = "$1_$2_$3.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)
	regPattern = """newsList.asp"""
	regReplace = """newsList.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)'在这里可以手工添加要替换的地址


	regPattern = """(productView).asp\?id=(\d+)"""'产品
	regReplace = """$1_$2.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)
	regPattern = """(productList).asp\?classid=(\d+)"""
	regReplace = """$1_$2_1.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)
	regPattern = "(productList).asp\?classid=(\d+)&page=(\d+)"""
	regReplace = "$1_$2_$3.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)
	regPattern = """productList.asp"""
	regReplace = """productList.html"""
	wstr = urlRewrite(wstr,regPattern,regReplace)

	savePage=server.MapPath(basePath&staticPage)

	'用ADODB.Stream才能生成UTF-8格式的文本!!!
	Set objStream = Server.CreateObject("ADODB.Stream")
	With objStream
	.Open
	.Charset = "utf-8"
	.Position = objStream.Size
	.WriteText=wstr
	.SaveToFile savePage,2 
	.Close
	End With
	Set objStream = Nothing

	response.write ("<a href="""&baseUrl&staticPage&""" target=""_blank"">"&staticPage&"</a>生成成功!<br />")
end function

'取得分页的页数,这里的iPageSize一定要与列表页的对应起来
'一般情况下是取config里变量xiii_pagesize的值
'tbName是news或product,注意这里用到了func.asp里的getSubClasses函数取子类!
function getPageCount(tbName,classId,ipageSize)
	maxPage = 1
	subClasses = getSubClasses(tbName&"class",classId)
	sql = "select * from "&tbName&" where proclassid in ("&subClasses&")"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write("错误的参数")
	else

		if ipageSize > rs.recordcount then
			ipageSize = rs.recordcount
		end if
		rs.pagesize=iPageSize	'初始化每页文章数
		maxPage = rs.pageCount	'取得页数
	end if
	getPageCount = maxPage
end function

'----------------------以下函数视情形添加-----------------------------------
function genNewsPage()
	sql = "select * from news"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write("暂无记录")
	else
		do while not rs.eof
			'response.write rs("proid")
			call genHtml("newsView.asp?id="&rs("proid"),"newsView_"&rs("proid")&".html")
			rs.movenext
		loop
	end if
	rs.close
end function

function genNewsList()
	sql = "select * from newsclass"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write("暂无记录")
	else
		call genHtml("news.asp","news.html")
		do while not rs.eof
			'call genHtml("news.asp?classid="&rs("id"),"news_"&rs("id")&".html")
			'生成列表的分页
			for i=1 to getPageCount("news",rs("id"),12)
				call genHtml("newsList.asp?classid="&rs("id")&"&page="&i,"newsList_"&rs("id")&"_"&i&".html")
			next
			rs.movenext
		loop
	end if
	rs.close
end function

function genProPage()
	sql = "select * from product"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write("暂无记录")
	else
		do while not rs.eof
			'response.write rs("proid")
			call genHtml("productView.asp?id="&rs("proid"),"productView_"&rs("proid")&".html")
			rs.movenext
		loop
	end if
	rs.close
end function

function genProList()
	sql = "select * from productclass"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write("暂无记录")
	else
		call genHtml("productList.asp","productList.html")
		do while not rs.eof
			'call genHtml("productList.asp?classid="&rs("id"),"productList_"&rs("id")&".html")
			'生成列表的分页
			for i=1 to getPageCount("product",rs("id"),4)
				call genHtml("productList.asp?classid="&rs("id")&"&page="&i,"productList_"&rs("id")&"_"&i&".html")
			next
			rs.movenext
		loop
	end if
	rs.close
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>静态页面生成</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
</head>

<body style="background:#fff; width:280px">
<div style="width:280px; margin:50px 0 50px 20px;; text-align:left;">
<%
start = request("start")
action = request("action")
if start <> "start" then
%>
<a href="?start=start&action=<%=request("action")%>" class="coolBtn">点此开始</a>
<%
else
	if action = "all" then
		baseUrl = xiii_siteurl	'这个URL在系统设置里面设定
		basePath = "../"	'区分语言版本时这里可设为../cn/及../en/
		call genHtml("index.asp","index.html")
		call genNewsPage()
		call genNewsList()
		call genProPage()
		call genProList()
	end if
	response.write "<font color=red>更新完成,请关闭窗口！</font><br />"
end if
%>
</div>
</body>
</html>
