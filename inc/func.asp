<%
'取论坛用户名
function getUserName(userid)
	rtn = "无此用户"
	sql = "select * from BBSXP_Users where UserID = "&cstr(userid)
	set rsUserName = conn.execute(sql)
	if rsUserName.bof and rsUserName.eof then
	else
		rtn = rsUserName("UserName")
	end if
	getUserName = rtn
end function

'IP地址转换
Function getIntIp(IP)
	IP=cstr(IP)
	IP1=Left(IP,cint(instr(IP,".")-1))
	IP=Mid(IP,cint(instr(IP,".")+1))
	IP2=Left(IP,cint(instr(IP,".")-1))
	IP=Mid(IP,cint(instr(IP,".")+1))
	IP3=Left(IP,cint(instr(IP,".")-1))
	IP4=Mid(IP,cint(instr(IP,".")+1))
	getIntIp=Cint(IP1)*256*256*256+Cint(IP2)*256*256+Cint(IP3)*256+Cint(IP4)
End Function
'IP地址查询
Function getRegion(strIp)
	ip = getIntIp(strIp)
	set rsRegion=Server.CreateObject("ADODB.Recordset")
	sql="select country,city from ip_H where ip1<=" & ip & " and ip2>=" & ip
	rsRegion.Open sql,connIp,1,1
	IF rsRegion.RecordCount<>0 THEN
		getRegion=rsRegion("country") & rsRegion("city")
	Else
		getRegion="未知"
	End IF
	rsRegion.Close
	Set rsRegion=Nothing
	'connIp.Close
	'Set connIp=Nothing
End Function



'-------取标题前N个字-------------------
function limitTitle(title,titleleng)
	dim rtn
	rtn = left(title,titleleng)
	if (len(title) > titleleng) then
		rtn = rtn&"..."
	end if
	limitTitle = rtn
end function



'--------取得栏目名称-------------------
'输入:栏目ID,语言("en"或"cn")
'输出:父栏名
'注意:若父ID或语言不存在,输出为"无名分类"
'-------------------------------------
function getClassName(tbName,classId,lang)
	dim rtn,sql,rsClassName
	rtn = "111"
	sql = "select * from "&tbName&" where id = "&cstr(classId)
	set rsClassName = conn.execute(sql)
	if not (rsClassName.eof and rsClassName.bof) then
		if lang = "cn" then
			rtn = rsClassName("classname_cn")
		elseif lang = "en" then
			rtn = rsClassName("classname_en")
		else
			rtn = "无名分类"
		end if
	else
		rtn = "无名分类"
	end if
	if rtn = "" then
		rtn = "无名分类"
	end if
	getClassName = rtn
end function

'--------取得父栏目ID---------------
'输入:子栏目ID
'输出:父栏目ID
'注意:若父ID不存在或为根栏目,输出为0
'-------------------------------
function getParentClass(tbName,subClassId)
	dim sql,rsGPC,parentClassId,subClassCode
	sql = "select * from "&tbName&" where id="&subClassId
	set rsGPC = conn.execute(sql)
	if rsGPC.eof and rsGPC.bof then
		parentClassId = 0
	else
		subClassCode = rsGPC("classcode")
		sql = "select * from "&tbName&" where classcode ='"&left(subClassCode,len(subClassCode)-4)&"'"
		set rsGPC = conn.execute(sql)
		if rsGPC.eof and rsGPC.bof then
			parentClassId = 0
		else
			parentClassId = rsGPC("id")
		end if
	end if
	'response.write sql
	getParentClass = parentClassId
end function

'--------取得子栏目---------------
'输入:父栏目ID
'输出:父栏目及所有子栏目ID,豆号分隔
'注意:若父ID不存在,输出为所有ID
'-------------------------------
function getSubClasses(tbName,parentClass)
	dim rtn,sql,parentCode,rsSubClasses
	rtn = ""
	sql = "select * from "&tbName&" where id = "&parentClass
	set rsSubClasses = conn.execute(sql)
	if not (rsSubClasses.eof and rsSubClasses.bof) then
		parentCode = rsSubClasses("classcode")
	end if
	sql = "select * from "&tbName&" where classcode like """&parentCode&"%"" order by classcode"
	set rsSubClasses = conn.execute(sql)
	if not (rsSubClasses.eof and rsSubClasses.bof) then
		do while not rsSubClasses.eof
			rtn = rtn+cstr(rsSubClasses("id"))+","
			rsSubClasses.movenext()
		loop
	end if
	rtn = left(rtn,len(rtn)-1)
	getSubClasses = rtn
end function

'--------取得图片---------------
'输入:表名,id,第N张
'输出:<img>
'-------------------------------
function getPic(tbName,id,n)
	rtn = ""
	sql = "select * from "&tbName&" where productid = "&id
	sql = sql&" order by picorder desc"
	Set rsPic = Server.CreateObject("ADODB.Recordset")
	rsPic.open sql,conn,1,3
	if rsPic.eof or rs.eof then
		rtn = "nopic.jpg"
	else
		rtn = rsPic("picpath")
	end if
	rsPic.close
	getPic = rtn
end function


'--------输出列表函数(demo,不使用)-------------
function showProListDemo(rs)
	dim curPage,maxPage
	if not isempty(request("page")) then   
		curPage=cint(request("page"))   
	else
		curPage=1
	end if
	
	rs.pagesize=3	'初始化每页文章数
	rs.AbsolutePage=curPage	'初始化当前页
	maxPage = rs.pageCount	'取得页数
	dim i:i=0
	do while not rs.eof
		i = i + 1
		response.write(rs("prooutline_cn"))
		rs.movenext()
		if i >= rs.pagesize then exit do    
	loop
end function

'----------通用分页函数-------------------
function splitPage(rsSplitPage,iPageSize)
	dim curPage,maxPage,sQueryString,iQueryString,splitPageUrl,splitPageUrlFinal
	'取地址
	splitPageUrl = request.ServerVariables("URL")+"?"
	iQueryString = 0
	For Each sQueryString in Request.QueryString
		if sQueryString <> "page" then
			iQueryString = iQueryString + 1
			splitPageUrl = splitPageUrl + sQueryString + "=" + Request.QueryString(sQueryString) + "&"
		end if
	Next
	
	if not (rsSplitPage.eof and rsSplitPage.bof) then
		if not isempty(request.QueryString("page")) then   
			curPage=cint(request.QueryString("page"))   
		else   
			curPage=1
		end if
		if iPageSize > rsSplitPage.recordcount then
			iPageSize = rsSplitPage.recordcount
		end if
		rsSplitPage.pagesize=iPageSize	'初始化每页文章数
		maxPage = rsSplitPage.pageCount	'取得页数
		if curPage>maxPage then
			curPage=maxPage
		end if
		rsSplitPage.AbsolutePage=curPage	'初始化当前页
		'response.write("共"&maxPage&"页 当前第"&curPage&"页 ")
		response.write("<ul>"&vbcrlf)
		for i = 1 to maxPage
			splitPageUrlFinal = splitPageUrl + "page="&i
			if i = curPage then
				response.write("<li><a href="""&splitPageUrlFinal&""" class=""splitPageChecked"">"&i&"</a></li>"&vbcrlf)
			else
				response.write("<li><a href="""&splitPageUrlFinal&""">"&i&"</a></li>"&vbcrlf)
			end if
		next
		response.write("</ul>"&vbcrlf)
	end if
end function



'*************************************************
'函数名：IsObjInstalled
'作  用：判断组件是否安装成功
'参  数：strClassString   ----组件ID
'返回值：True or False
'*************************************************
Function   IsObjInstalled(strClassString)   
	On   Error   Resume   Next   
	IsObjInstalled   =   False   
	Err   =   0   
	Dim   xTestObj   
	Set   xTestObj   =   Server.CreateObject(strClassString)   
	If   0   =   Err   Then   IsObjInstalled   =   True   
	Set   xTestObj   =   Nothing   
	Err   =   0   
End   Function
%>

<%
'--------------------字符串相关函数-----------------------------------------------------------------
Function gotTopic(str,strlen,clasx)
	IF str="" THEN
		gotTopic=""
		Exit Function
	End IF
	Dim l,t,c, i
	IF int(clasx)=1 THEN
		IF len(str)>strlen+1 THEN
			str=left(str,strlen) & "..."
		End IF
		gotTopic=str
	Else
		str=replace(replace(replace(replace(str,"&nbsp;"," "),"&quot;",chr(34)),"&gt;",">"),"&lt;","<")
		l=len(str)
		t=0
		For i=1 To l
			c=Abs(Asc(Mid(str,i,1)))
			IF c>255 THEN
				t=t+2
			Else
				t=t+1
			End IF
			IF t>=strlen THEN
				gotTopic=left(str,i) & "..."
				Exit For
			Else
				gotTopic=str
			End IF
		Next
		gotTopic=replace(replace(replace(replace(gotTopic," ","&nbsp;"),chr(34),"&quot;"),">","&gt;"),"<","&lt;")
	End IF
End Function


Function checkfSQLStr(strContent)
	Dim CheckfContent
	IF isnull(strContent) THEN
		checkfSQLStr = ""
		Exit Function 
	End IF
	CheckfContent=CheckfRequest_Content
	CheckfContent=split(CheckfContent,"|")
	For ix=0 To ubound(CheckfContent)
		strContent = replace(strContent,CheckfContent(ix),"")
	Next
	checkfSQLStr=strContent
End Function


Function checkfSQL(strContent)
	Dim CheckSQLContent
	IF isnull(strContent) THEN
		checkfSQL = ""
		Exit Function 
	End IF
	CheckSQLContent=CheckfSQL_Content
	CheckSQLContent=split(CheckSQLContent,"|")
	For ix=0 To ubound(CheckSQLContent)
		strContent = replace(strContent,CheckSQLContent(ix),"")
	Next
	checkfSQL=strContent
End Function



Function isChkInteger(para)
	on error resume Next
	Dim str
	Dim l,i
	IF isNUll(para) THEN 
	isChkInteger=false
	Exit Function
	End IF
	str=cstr(para)
	IF trim(str)="" THEN
	isChkInteger=false
	Exit Function
	End IF
	l=len(str)
	For i=1 To l
	IF mid(str,i,1)>"9" or mid(str,i,1)<"0" THEN
	isChkInteger=false 
	Exit Function
	End IF
	Next
	isChkInteger=True
	IF err.number<>0 THEN err.clear
End Function


Function dvHTMLEncode(fString)
	IF Not isnull(fString) THEN
		fString = replace(fString, ">", "&gt;")
		fString = replace(fString, "<", "&lt;")
		fString = Replace(fString, CHR(32), "&nbsp;")
		fString = Replace(fString, CHR(9), "&nbsp;")
		fString = Replace(fString, CHR(34), "&quot;")
		fString = Replace(fString, CHR(39), "&#39;")
		fString = Replace(fString, CHR(13), "")
		fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
		fString = Replace(fString, CHR(10), "<BR> ")
		dvHTMLEncode = fString
	End IF
End Function


Function dvHTMLCode(fString)
	IF Not isnull(fString) THEN
		fString = replace(fString, "&gt;", ">")
		fString = replace(fString, "&lt;", "<")
		fString = Replace(fString,  "&nbsp;"," ")
		fString = Replace(fString, "&quot;", CHR(34))
		fString = Replace(fString, "&#39;", CHR(39))
		fString = Replace(fString, "</P><P> ",CHR(10) & CHR(10))
		fString = Replace(fString, "<BR> ", CHR(10))
		dvHTMLCode = fString
	End IF
End Function


Function nohtml(str)
	Dim re
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
	re.Pattern="(\<.[^\<]*\>)"
	str=re.replace(str," ")
	re.Pattern="(\<\/[^\<]*\>)"
	str=re.replace(str," ")
	nohtml=str
	Set re=Nothing
	End Function
	Function YearDa(str)
	IF isnull(str) THEN
	checkfSQLStr = ""
	Exit Function 
	End IF
	IF len(month(str))<2 THEN
	m="0" & month(str)
	Else
	m=month(str)
	End IF
	IF len(day(str))<2 THEN
	d="0" & day(str)
	Else
	d=day(str)
	End IF
	str=year(str) & "-" & m & "-" & d
	YearDa=str
End Function


Function YearDami(str)
	IF isnull(str) THEN
		checkfSQLStr = ""
		Exit Function 
	End IF
	IF len(month(str))<2 THEN
		m="0" & month(str)
	Else
		m=month(str)
	End IF
	IF len(day(str))<2 THEN
		d="0" & day(str)
	Else
		d=day(str)
	End IF
	IF len(Hour(str))<2 THEN
		h="0" & Hour(str)
	Else
		h=Hour(str)
	End IF
	IF len(minute(str))<2 THEN
		n="0" & minute(str)
	Else
		n=minute(str)
	End IF
	str=year(str) & "-" & m & "-" & d & " " & h & ":" & n
	YearDami=str
End Function
%>
<%
'测试部分

'Response.Buffer = true
'Response.CacheControl = "no-cache"   
'Response.Expires = 0   
'response.charset="utf-8"
'
'dim conn,connstr
'dim xiii_db:xiii_db = "../../db/db.mdb"
'Set conn = Server.CreateObject("ADODB.Connection")     
'connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&server.mapPath(xiii_db)
'conn.Open connstr   
'response.write(getParentClass(103))

%>