
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/jtip.js" type="text/javascript"></script>
	<link href="css/jtip.css" rel="stylesheet" type="text/css" />
	<script src="js/guestBookList.js" type="text/javascript"></script><!--本页专有JS-->
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
    <td height="45" align="right" valign="bottom" bgcolor="#C7DAE9"><table border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td width="10" align="center" class="white">&nbsp;</td>
        <td width="80" height="25" bgcolor="#FF6600" align="center" class="white"><a href="guestBookList.asp"><b>留言管理</b></a></td>
        <td width="10">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="500" valign="top" bordercolor="#DAEBEF" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#666666" height="1"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right" bgcolor="#F6F6F6"><!--查询开始-->
            <!--查询结束--></td>
      </tr>
      <tr>
        <td height="1" bgcolor="#666666"></td>
      </tr>
      <tr>
        <td height="300" valign="top"><!--列表开始-->
            <form method="post" name="formProList" id="formProList" action="guestBookAlter.asp">
              <input name="action" value="del" type="hidden" id="formProListAction" />
              <table width="100%" border="0" cellpadding="2" cellspacing="2" class="title">
                <tr align="center" bgcolor="#F6F6F6">
                  <td width="5%"><input name="chkAll" type="checkbox" id="vote" onclick="CheckAll(this.form)" value="checkbox" />
                  </td>
                  <td width="5%">NO</td>
                  <td width="10%" bgcolor="#F6F6F6">姓名</td>
                  <td width="15%">时间</td>
                  <td width="20%">留言内容</td>
                  <td width="15%">联系方式</td>
                  <td width="10%">类型</td>
                  <td width="10%">回复方式</td>
                  <td width="5%">删除</td>
                </tr>
              </table>
              <%
'输出列表函数,放在这里是因为在DM里容易预览...
function showProList(rs,iPageSize)
	dim curPage,maxPage
	if not (rs.eof and rs.bof) then
		if not isempty(request.QueryString("page")) then   
			curPage=cint(request.QueryString("page"))   
		else   
			curPage=1
		end if
		if ipageSize > rs.recordcount then
			ipageSize = rs.recordcount
		end if
		rs.pagesize=iPageSize	'初始化每页文章数
		rs.AbsolutePage=curPage	'初始化当前页
		maxPage = rs.pageCount	'取得页数
		dim i:i=0
		do while not rs.eof
			i = i + 1
%>
              <table width="100%" border="0" cellpadding="2" cellspacing="2" class="proList">
                <tr align="center">
                  <td width="5%"><input name='gbid' type='checkbox' onclick="unselectall()" id="gbid" value='<%=cstr(rs("gbid"))%>' /></td>
                  <td width="5%"><%=rs.AbsolutePosition%></td>
                  <td width="10%" align="left">
				  <strong><%=rs("gbname")%></strong>
				  </td>
                  <td width="15%" align="center">
					<%=rs("sysdate")%>
				  </td>
                  <td width="20%" align="center">
				  <%=limitTitle(rs("gbcontent"),10)%>
				  <a href="guestBookView.asp?gbid=<%=rs("gbid")%>&action=content&width=240" class="jTip" id="content_<%=rs("gbid")%>" name="详情"><strong>[详情]</strong></a>
				  </td>
                  <td width="15%" class="center">
				  <%=limitTitle(rs("gbphone"),10)%>
				  <a href="guestBookView.asp?gbid=<%=rs("gbid")%>&action=contact&width=240" class="jTip" id="contact_<%=rs("gbid")%>" name="详情"><strong>[详情]</strong></a>
				  </td>
                  <td width="10%">
					<%
					if rs("gbclass")=0 then
						response.Write("谘询")
					elseif rs("gbclass")=1 then
						response.Write("合作")
					else
						response.Write("建议")
					end if
					%>
				  </td>
                  <td width="10%">
					<%
					if rs("gbreply")=0 then
						response.Write("不限")
					elseif rs("gbreply")=1 then
						response.Write("电话")
					else
						response.Write("邮件")
					end if
					%>
				  </td>
                  <td width="5%"><a href="guestBookAlter.asp?action=del&amp;gbid=<%=rs("gbid")%>"> <img src="images/delete.gif" width="16" height="16" /></a> </td>
                </tr>
              </table>
              <%
			rs.movenext()
			if i >= rs.pagesize then exit do    
		loop
	end if
end function
%>
              <%
'--------------------主程序部分-------------------------------
dim action
'列出全部内容
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from guestbook"
sql = sql&" order by gbid desc"
rs.open sql,conn,1,3
if rs.eof and rs.bof then
	response.write("暂无记录")
else
	call showProList(rs,xiii_pagesize)
end if

%>
              <table border="0" cellpadding="2" cellspacing="2" class="title">
                <tr>
                  <td></td>
                  <td><input type="button" name="bt1" value="删除选定" onclick="fromProListSubmit1()" /></td>
                </tr>
              </table>
            </form>
          <!--列表结束-->
        </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="2" cellspacing="2">
            <tr bgcolor="#F7F7F7">
              <td bgcolor="#F7F7F7" align="right">
			  <div class="splitPage"><%call splitPage(rs,xiii_pagesize)%></div>
			  </td>
            </tr>
        </table></td>
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