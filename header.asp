<table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="9">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="18"><img src="images/Lii_07.jpg" width="18" height="179" /></td>
        <td width="924" background="images/Lii_08.jpg">

		</td>
        <td width="18"><img src="images/Lii_10.jpg" width="18" height="179" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="36"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="18"><img src="images/L.S_08.jpg" width="18" height="36" /></td>
        <td align="center" valign="top" class="menu">
		<ul class="lavaLampWithImage" id="lavaLampMenu">
			<li><a href="index.asp">首页</a></li>
			<li><a href="about.asp">关于我们</a></li>
			<li><a href="onsaleList.asp">火爆促销</a></li>
			<li><a href="productList.asp?classId=114">系统展示</a></li>
			<li><a href="bestList.asp">推荐套餐</a></li>
			<li><a href="caseList.asp">案例展示</a></li>
			<li><a href="newsList.asp?classId=103">建站常识</a></li>
			<li><a href="guestBook.asp?keepThis=true&TB_iframe=true&height=340&width=400" class="thickbox">留言反馈</a></li>
			<li><a href="contact.asp">联系我们</a></li>
			<li><a href="job.asp">在线招聘</a></li>
			<li><a href="bbs/">论坛</a></li>
		</ul>
		</td>
        <td width="18"><img src="images/L.S_11.jpg" width="18" height="36" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="12"><img src="images/L.S_12.jpg" width="960" height="12" /></td>
  </tr>
</table>
<%
sub loginBox()
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td height="63" valign="bottom" background="images/L.S_L.top.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td width="31%">&nbsp;</td>
		<td width="69%">&nbsp;</td>
	  </tr>
	  <tr>
		<td>&nbsp;</td>
		<td height="30" class="write_big">会员中心</td>
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
if CookieUserName=empty then
%>
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right"><a href="userLogin.asp?keepThis=true&TB_iframe=true&height=200&width=320" class="thickbox">用户登录</a></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
	  
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right"><a href="userReg.asp?keepThis=true&TB_iframe=true&height=300&width=400" class="thickbox">我要注册</a></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
<%
else
%>
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right">欢迎您:<%=CookieUserName%></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right"><a href="userProfile.asp?keepThis=true&TB_iframe=true&height=350&width=400" class="thickbox">用户资料</a></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right"><a href="userProfile.asp?Menu=pass&keepThis=true&TB_iframe=true&height=300&width=400" class="thickbox">修改密码</a></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right"><a href="goodsCart.asp?keepThis=true&TB_iframe=true&height=400&width=520" class="thickbox">查看购物车</a></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right"><a href="goodsOrderList.asp?keepThis=true&TB_iframe=true&height=250&width=400" class="thickbox">我的订单</a></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
	  <tr>
		<td class="left_bg"><table width="70%" height="27" border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="80%" align="right"><a href="userLogin.asp?Menu=OUT&keepThis=true&TB_iframe=true&height=200&width=320" class="thickbox">退出登录</a></td>
			  <td width="20%" align="center"><img src="images/arrow_green_rt.gif" width="4" height="8" /></td>
			</tr>
		</table></td>
	  </tr>
<%
end if
%>

  </table></td>
</tr>
</table>


<%
end sub
%>