<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/L_02.jpg">
      <tr>
        <td width="276"><img src="images/L_01.jpg" width="276" height="83" /></td>
        <td width="100%"></td>
        <td width="370" align="right"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="images/L_04.jpg" width="50" height="83" /></td>
            <td width="320" background="images/L_05.jpg"><table width="260" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="14"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr align="center">
                <td height="42"><a href="welcome.asp"><img src="images/LR_09.jpg" name="Image5" width="42" height="42" border="0" id="Image5" /></a></td>
                <td></td>
                <td><a href="help.asp"><img src="images/LR_11.jpg" name="Image6" width="42" height="42" border="0" id="Image6" /></a></td>
                <td></td>
                <td><a href="adminPassAlt.asp"><img src="images/LR_13.jpg" name="Image7" width="42" height="42" border="0" id="Image7" /></a></td>
                <td></td>
                <td><a href="login.asp"><img src="images/LR_15.jpg" name="Image8" width="42" height="42" border="0" id="Image8" /></a></td>
              </tr>
              <tr align="center" class="out">
                <td height="18" valign="bottom"><a href="welcome.asp">后台首页</a></td>
                <td></td>
                <td valign="bottom"><a href="help.asp">系统信息</a></td>
                <td></td>
                <td valign="bottom"><a href="adminPassAlt.asp">修改密码</a></td>
                <td></td>
                <td valign="bottom"><a href="login.asp">退出登陆</a></td>
              </tr>
              <tr>
                <td height="9"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="29" background="images/L_21.jpg" align="right" class="manager"><%=xiii_sitename%>网站 &gt; 管理员:<%=session("adminRealName")%> &nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
  <tr>
    <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" background="images/L_27.jpg">
      <tr>
        <td width="18"><img src="images/L_25.jpg" width="18" height="36" /></td>
        <td width="100%" align="center" valign="middle" class="menu">
<!--菜单开始-->
<div class="menucontainer">
<div class="menu">
<ul>
<li><a href="welcome.asp">管理首页</a></li>

<li><a href="newsList.asp">新闻管理<!--[if IE 7]><!-->
</a>
<!--<![endif]-->
<table><tr><td>
<ul>
<%
set rsClass=conn.execute("select * from newsclass order by classcode")
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		if xiii_language <> "en" then
%>
<li><a href="newsList.asp?action=search&proClass=<%=rsClass("id")%>" target="_self"><%=string((classLevel-1),"　")&"├"&rsClass("classname_cn")%></a></li>
<%
		else
%>
<li><a href="newsList.asp?action=search&proClass=<%=rsClass("id")%>" target="_self"><%=string((classLevel-1),"　")&"├"&rsClass("classname_en")%></a></li>
<%
		end if
		rsClass.movenext()
	loop
end if
set rsClass=nothing
%>
<li><a href="newsAdd.asp" target="_self">添加新闻</a></li>
<li><a href="newsList.asp" target="_self">查看全部</a></li>
<li><a href="newsClass.asp" target="_self">分类管理</a></li>

</ul></td></tr></table>
<!--[if lte IE 6]>
</a>
<![endif]-->
</li>

<li><a href="productsList.asp">产品管理<!--[if IE 7]><!-->
</a>
<!--<![endif]-->
<table><tr><td>
<ul>

<%
set rsClass=conn.execute("select * from productclass order by classcode")
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		if xiii_language <> "en" then
%>
<li><a href="productsList.asp?action=search&proClass=<%=rsClass("id")%>" target="_self"><%=string((classLevel-1),"　")&"├"&rsClass("classname_cn")%></a></li>
<%
		else
%>
<li><a href="productsList.asp?action=search&proClass=<%=rsClass("id")%>" target="_self"><%=string((classLevel-1),"　")&"├"&rsClass("classname_en")%></a></li>
<%
		end if
		rsClass.movenext()
	loop
end if
set rsClass=nothing
%>
<li><a href="productsAdd.asp" target="_self">添加产品</a></li>
<li><a href="productsList.asp" target="_self">查看全部</a></li>
<li><a href="productsClass.asp" target="_self">分类管理</a></li>

</ul></td></tr></table>
<!--[if lte IE 6]>
</a>
<![endif]-->
</li>
<li><a href="orderList.asp">订单管理</a></li>
<li><a href="guestBookList.asp">留言管理</a></li>
<li><a href="jobList.asp">招聘管理<!--[if IE 7]><!-->
</a>
<!--<![endif]-->
<table><tr><td>
<ul><li><a href="jobAdd.asp" target="_self">添加职位</a></li><li><a href="jobList.asp" target="_self">管理职位</a></li></ul></td></tr></table>
<!--[if lte IE 6]>
</a>
<![endif]-->
</li>

<li><a href="sysConfig.asp">系统设置<!--[if IE 7]><!-->
</a>
<!--<![endif]-->
<table><tr><td>
<ul><li><a href="sysConfig.asp" target="_self">常规设置</a></li><li><a href="adminPassAlt.asp" target="_self">修改密码</a></li><li><a href="help.asp" target="_self">系统信息</a></li></ul></td></tr></table>
<!--[if lte IE 6]>
</a>
<![endif]-->
</li>

<li><a href="staticPage.asp">静态页面</a></li>
<li><a href="login.asp">退出登录</a></li>

</ul>
</div>
</div>
<!--菜单结束-->
		</td>	
        <td align="right" width="16"><img src="images/L_28.jpg" width="16" height="36" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>