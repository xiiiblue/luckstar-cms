<!--#include file="../inc/config.asp"-->
<%
if isempty(request.QueryString("classid")) then
	classid = 103
else
	classid = clng(request.QueryString("classid"))
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Luck-Star</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/thickbox.css" rel="stylesheet" type="text/css" /><!--thickbox-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/thickbox.js" type="text/javascript"></script><!--thickbox-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/productList.js" type="text/javascript"></script><!--本页专有JS-->
</head>
<body>
<!--#include file="header.asp"-->
<table width="961" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="4"><img src="images/L.S_13.jpg" width="960" height="10" /></td>
  </tr>
  <tr>
    <td width="4" valign="top">&nbsp;</td>
    <td width="204" valign="top" class="left"><table width="204" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="63" valign="bottom" background="images/L.S_L.top.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="31%">&nbsp;</td>
                    <td width="69%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td height="30" class="write_big">文章分类</td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="20">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><img src="images/L_01_up.jpg" /></td>
                  </tr>
<%
subClasses = getSubClasses("newsclass",103)
sql = "select * from newsclass where id in("&subClasses&") and id <> 103 "
set rs = conn.execute(sql)
if rs.eof and rs.bof then
	response.write "暂无分类"
else
	do while not rs.eof
%>
                  <tr>
                    <td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="80%" align="right"><a href="news.asp?classid=<%=rs("id")%>" class="main_title"><%=rs("classname_cn")%></a></td>
                          <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
                        </tr>
                    </table></td>
                  </tr>
<%
		rs.movenext
	loop
end if
%>
				  
              </table></td>
            </tr>
        </table>
		<%call loginBox()%>
		
		</td>
      </tr>
    </table></td>
    <td width="1" valign="top" bgcolor="#9CC1D1"><img src="images/L.S_16.jpg" width="1" height="521" /></td>
    <td width="752" valign="top" align="left">
	<table width="747" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="938" valign="top" class="right"><table width="650" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22">&nbsp;</td>
            </tr>
            <tr>
              <td><span class="blue_02">■</span>&nbsp;当前位置 :<a href="index.asp">网站首页</a> &gt; 建站常识</td>
            </tr>
            <tr>
              <td>
			  <ul class="newsList">
<%
xiii_pagesize = 12
subClasses = getSubClasses("newsclass",classid)
sql = "select * from news where proclassid in ("&subClasses&")"
sql = sql&" order by proid desc"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3
if rs.eof and rs.bof then
	response.write("暂无记录")
else
	call showProList(rs,xiii_pagesize)
end if
%>

<%
'输出列表函数,放在这里是因为在DM里容易预览...
function showProList(rs,iPageSize)
	dim curPage,maxPage
	if not (rs.eof and rs.bof) then
		if not isempty(request("page")) then   
			curPage=cint(request("page"))   
		else   
			curPage=1
		end if
		if ipageSize > rs.recordcount then
			ipageSize = rs.recordcount
		end if
		rs.pagesize=iPageSize	'初始化每页文章数
		maxPage = rs.pageCount	'取得页数
		if curPage>maxPage then
			curPage=maxPage
		end if
		rs.AbsolutePage=curPage	'初始化当前页
		dim i:i=0
		do while not rs.eof
			i = i + 1
%>
<li>
<a href="" title="<%=rs("proname_cn")%>" target="_blank"><%=limitTitle(rs("proname_cn"),20)%></a>
<span><%=rs("prodate")%></span>
</li>
<%
			rs.movenext()
			if i >= rs.pagesize then exit do    
		loop
	end if
end function
%>

				</ul>
				</td>
            </tr>
            <tr>
              <td><div class="splitPage"><%call splitPage(rs,xiii_pagesize)%></div></td>
            </tr>
          </table>
         </td>
      </tr>
    </table>	</td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>
