<!--#include file="../inc/config.asp"-->
<%
dim rs,sql,proid,action
if isempty(request("action")) then 
	action = ""
else
	action = request("action")
end if
if isempty(request("proid")) then 
	proid = 0
else
	proid = request("proid")
end if

if action = "edit" and proid <> 0 then
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql="select * from news where proid = "&proid
	rs.open sql,conn,1,3
	dim proclassid:proclassid = rs("proclassid")
	dim proname_cn:proname_cn = rs("proname_cn")
	dim proname_en:proname_en = rs("proname_en")
	dim propic:propic = rs("propic")
	dim hasparameter:hasparameter = rs("hasparameter")
	dim proorder:proorder = rs("proorder")
	dim proparameter_cn:proparameter_cn = rs("proparameter_cn")
	dim proparameter_en:proparameter_en = rs("proparameter_en")
	dim hasoutline:hasoutline = rs("hasoutline")
	dim prooutline_cn:prooutline_cn = rs("prooutline_cn")
	dim prooutline_en:prooutline_en = rs("prooutline_en")
	dim haspic:haspic = rs("haspic")
	dim prointro_cn:prointro_cn = rs("prointro_cn")
	dim prointro_en:prointro_en = rs("prointro_en")
	dim proshow:proshow = rs("proshow")
	dim prohot:prohot = rs("prohot")
	dim proup:proup = rs("proup")
	dim procommend:procommend = rs("procommend")
	dim prodate:prodate = rs("prodate")
	rs.close
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<link href="css/thickbox.css" rel="stylesheet" type="text/css" /><!--thickbox-->
	<link href="css/jtip.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script><!--FckEditor编辑器-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/thickbox.js" type="text/javascript"></script><!--thickbox-->
	<script src="js/jtip.js" type="text/javascript"></script>
	<script src="js/multiFileUp.js" type="text/javascript"></script><!--多文件上传-->
	<script src="js/slider.js" type="text/javascript"></script><!--滑动条-->
	<link href="css/slider.css" rel="stylesheet" type="text/css" />
	<script src="js/newsEdit.js" type="text/javascript"></script><!--本页专有JS-->
</head>

<body>
<!--header开始-->
<!--#include file="header.asp"-->
<!--header结束-->
<table width="97%" align="center" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/L_33.jpg">
      <tr>
        <td width="9"><img src="images/L_32.jpg" width="9" height="27" /></td>
        <td width="100%">&nbsp;</td>
        <td align="right" width="9"><img src="images/L_35.jpg" width="9" height="27" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="45" valign="bottom" bgcolor="#C7DAE9">
	<a href="newsList.asp?action=search&proClass=<%=request("proClass")%>" onclick="" class="coolBtn2">返回列表</a>
	</td>
  </tr>
  <tr>
    <td height="500" valign="top" bordercolor="#DAEBEF" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="1" bgcolor="#666666"></td>
      </tr>
      <tr>
        <td height="25">&nbsp;</td>
      </tr>
      
      <tr>
        <td>
		<!--表单开始-->
		<table width="700" border="0" align="center" cellpadding="2" cellspacing="2" class="proAddList">
		<form name="form1" action="newsEditDo.asp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="proid" value="<%=proid%>" />
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>分类：</b></td>
            <td bgcolor="#F6F6F6">
<%
dim rsClass,classLevel,outstr
set rsClass=conn.execute("select * from newsclass order by classcode")
outstr = "<select name=""proclassid"">"&vbcrlf
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		outstr = outstr&"<option value="""&rsClass("id")&""" "
		if proclassid = rsClass("id") then
			outstr = outstr&"selected=""selected"""
		end if
		outstr = outstr&">"
		if xiii_language <> "en" then
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_cn")
		else
			outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_en")
		end if
		outstr = outstr&"</option>"&vbcrlf
		rsClass.movenext()
	loop
end if
outstr = outstr&"</select>"&vbcrlf
response.write(outstr)
set rsClass=nothing
%>
			</td>
            <td bgcolor="#F6F6F6"></td>
          </tr>
          <tr height="25" class="cn">
            <td width="13%" align="right"><b>中文标题：</b></td>
            <td width="63%"><input name="proname_cn" id="proname_cn" type="text" value="<%=proname_cn%>" size="50" /></td>
            <td width="24%"><span class="red" id="proname_cn_err" style="display:none;">您还没有输入中文标题！√</span></td>
          </tr>
          <tr height="25" class="en">
            <td align="right"><b>英文标题：</b></td>
            <td><input name="proname_en" id="proname_en" type="text" value="<%=proname_en%>" size="50" /></td>
            <td><span class="red" id="proname_en_err" style="display:none;">您还没有输入英文标题！√</span></td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>来源：</b></td>
            <td bgcolor="#F6F6F6">
				<input name="hasparameter" id="hasParameter1" type="radio" value="1" <%if hasparameter=1 then response.write("checked=""checked""") end if%> /><label for="hasParameter1">
&nbsp;有&nbsp;</label>
				<input name="hasparameter" id="hasParameter0" type="radio" value="0" <%if hasparameter=0 then response.write("checked=""checked""") end if%> /><label for="hasParameter0">
&nbsp;无&nbsp;</label>
<a href="#" id="openParameter"><img src="images/div_add.gif" border="0" name="openericon"></a></td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td>
			<div id="Parameter" style="DISPLAY: none"> 
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="cn">
                <td><textarea name="proparameter_cn" id="proparameter_cn" cols="48" rows="5"><%=proparameter_cn%></textarea></td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr class="en">
                <td><textarea name="proparameter_en" id="proparameter_en" cols="48" rows="5"><%=proparameter_en%></textarea></td>
              </tr>
            </table>
			</div>
			</td>
            <td>
			<span class="red" id="proparameter_cn_err" style="display:none;">您还没有输入中文来源！√</span>
			<span class="red" id="proparameter_en_err" style="display:none;">您还没有输入英文来源！√</span>			</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>关键词：</b></td>
            <td bgcolor="#F6F6F6">
			<input name="hasoutline" id="hasOutline1" type="radio" value="1" <%if hasoutline=1 then response.write("checked=""checked""") end if%> />
			<label for="hasOutline1">&nbsp;有&nbsp;</label>
            <input name="hasoutline" id="hasOutline0" type="radio" value="0" <%if hasoutline=0 then response.write("checked=""checked""") end if%> />
            <label for="hasOutline0">&nbsp;无&nbsp;</label>
			<a href="#" id="openOutline"><img src="images/open.gif" border="0" name="openericon"></a>
			</td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"></td>
            <td>
			<div id="Outline" style="DISPLAY: none">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="cn">
                <td><textarea id="prooutline_cn" name="prooutline_cn" cols="48" rows="5"><%=prooutline_cn%></textarea></td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr class="en">
                <td><textarea id="prooutline_en" name="prooutline_en" cols="48" rows="5"><%=prooutline_en%></textarea></td>
              </tr>
            </table>
			</div>            </td>
            <td class="red">
			<span class="red" id="prooutline_cn_err" style="display:none;">您还没有输入中文关键词！√</span>
			<span class="red" id="prooutline_en_err" style="display:none;">您还没有输入英文关键词！√</span>
			</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>图片：</b></td>
            <td bgcolor="#F6F6F6">
			<input name="haspic" id="hasPic0" type="radio" value="0" <%if haspic=0 then response.write("checked=""checked""") end if%> />
			<label for="hasPic0">无图片</label>&nbsp;&nbsp;
			<input name="haspic" id="hasPic1" type="radio" value="1" <%if haspic=1 then response.write("checked=""checked""") end if%> />
			<label for="hasPic1">单张图片</label>&nbsp;&nbsp;
			<input name="haspic" id="hasPic2" type="radio" value="2" <%if haspic=2 then response.write("checked=""checked""") end if%> />
			<label for="hasPic2">多张图片</label>&nbsp;&nbsp;
			<div style="display:none;">
			<a href="newsPicAdd.asp?action=single&keepThis=true&TB_iframe=true&height=300&width=300" title="单张图片上传" class="thickbox" id="jumpIframe1">单图片上传伪链接</a>
			<a href="newsPicAdd.asp?action=multi&keepThis=true&TB_iframe=true&height=300&width=300" title="多张图片上传" class="thickbox" id="jumpIframe2">多图片上传伪链接</a>
			</div>
			</td>
            <td bgcolor="#F6F6F6" class="red">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"></td>
            <td>
			<div id = "picList" style="display:none;">
				<div id = "imgList" productId="<%=proid%>"></div>
				<div>
					<div>加入新图片</div>
					<input type="file" class="multi" maxlength="5"/>
				</div>
			</div>
			</td>
            <td></td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>状态：</b></td>
            <td bgcolor="#F6F6F6">
			<input id="proshow" name="proshow" type="checkbox" value="1" <%if proshow=1 then response.write("checked=""checked""") end if%> /><label for="proshow">显示:</label>&nbsp;&nbsp;
			<input id="proup" name="proup" type="checkbox" value="1" <%if proup=1 then response.write("checked=""checked""") end if%> /><label for="proup">固顶:</label>&nbsp;&nbsp;
			<input id="procommend" name="procommend" type="checkbox" value="1" <%if procommend=1 then response.write("checked=""checked""") end if%> /><label for="procommend">推荐:</label>&nbsp;&nbsp;
			<input id="prohot" name="prohot" type="checkbox" value="1" <%if prohot=1 then response.write("checked=""checked""") end if%> /><label for="prohot">热点:</label>
			</td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>优先级：</b></td>
            <td bgcolor="#F6F6F6">
			  <input name="proorder" type="text" value="<%=proorder%>" maxlength="3" size="50" class="suSlider" minvalue="0" maxvalue="100" stepvalue="1"  />
            </td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          
          <tr height="25" class="cn">
            <td align="right"><b>内容：</b></td>
            <td>
<%if xiii_language <> "en" then%>
<script type="text/javascript">
<!--
var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('admin')) + "admin/fckeditor/" ;
var oFCKeditor = new FCKeditor( 'prointro_cn' ) ;
oFCKeditor.BasePath	= sBasePath ;
oFCKeditor.Height	= 150 ;
oFCKeditor.ToolbarSet = "Basic"; 
oFCKeditor.Value	= '<%=prointro_cn%>' ;
oFCKeditor.Create() ;
//-->
</script>
<%end if%>		
			</td>
            <td>&nbsp;</td>
          </tr>
          <tr height="25" class="en">
            <td align="right">&nbsp;</td>
            <td>
<%if xiii_language <> "cn" then%>
<script type="text/javascript">
<!--
var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('admin')) + "admin/fckeditor/" ;
var oFCKeditor = new FCKeditor( 'prointro_en' ) ;
oFCKeditor.BasePath	= sBasePath ;
oFCKeditor.Height	= 150 ;
oFCKeditor.ToolbarSet = "Basic"; 
oFCKeditor.Value	= '<%=prointro_en%>' ;
oFCKeditor.Create() ;
//-->
</script>
<%end if%>
			</td>
            <td>&nbsp;</td>
          </tr>
          <tr height="25">
            <td align="right">&nbsp;</td>
            <td><input type="submit" value="提交" /></td>
            <td>&nbsp;</td>
          </tr>
		</form>
        </table>
		<!--表单结束-->
		</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
	</td>
  </tr>
</table>
<!--footer开始-->
<!--#include file="footer.asp"-->
<!--footer结束-->
</body>
</html>
