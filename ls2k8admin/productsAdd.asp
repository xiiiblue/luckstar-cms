<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script><!--FckEditor编辑器-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/multiFileUp.js" type="text/javascript"></script><!--多文件上传-->
	<script src="js/slider.js" type="text/javascript"></script><!--滑动条-->
	<link href="css/slider.css" rel="stylesheet" type="text/css" />
	<script src="js/productsAdd.js" type="text/javascript"></script><!--本页专有JS-->
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
	<a href="productsList.asp?action=search&proClass=<%=request("proClass")%>" onclick="" class="coolBtn2">返回列表</a>
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
		<form name="form1" action="productsAddDo.asp" method="post" enctype="multipart/form-data">
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>分类：</b></td>
            <td bgcolor="#F6F6F6">
<%
dim rsClass,classLevel,outstr
set rsClass=conn.execute("select * from productclass order by classcode")
outstr = "<select name=""proclassid"" id=""proclassid"">"&vbcrlf
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		outstr = outstr&"<option value="""&rsClass("id")&""" "
		if request("proClass") = cstr(rsClass("id")) then
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
            <td bgcolor="#F6F6F6"><span class="red" id="proclassid_err">请选择分类!√</span></td>
          </tr>
          <tr height="25" class="cn">
            <td width="13%" align="right"><b>中文名称：</b></td>
            <td width="63%">
			<input name="proname_cn" id="proname_cn" type="text" value="中文标题" size="50" maxlength="50" />
			</td>
            <td width="24%">
			<span class="red" id="proname_cn_err" style="display:none;">您还没有输入中文标题！√</span>
			<span class="green" id="proname_cn_tip" style="display:none;"></span>
			</td>
          </tr>
          <tr height="25" class="en">
            <td align="right"><b>英文名称：</b></td>
            <td><input name="proname_en" id="proname_en" type="text" value="English Title" size="50" / maxlength="50"></td>
            <td>
			<span class="red" id="proname_en_err" style="display:none;">您还没有输入英文标题！√</span>
			<span class="green" id="proname_en_tip" style="display:none;"></span>
			</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>参数：</b></td>
            <td bgcolor="#F6F6F6">
				<input name="hasparameter" id="hasParameter1" type="radio" value="1" /><label for="hasParameter1">
&nbsp;有&nbsp;</label>
				<input name="hasparameter" id="hasParameter0" type="radio" value="0" checked="checked" /><label for="hasParameter0">
&nbsp;无&nbsp;</label>
<span class="green">备注：此选项对应有复杂参数的产品！<a href="#" id="openParameter"><img src="images/div_add.gif" border="0" name="openericon"></a></span></td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td>
			<div id="Parameter" style="DISPLAY: none"> 
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="cn">
                <td><textarea name="proparameter_cn" id="proparameter_cn" cols="48" rows="3">型号：ABC
参数：123</textarea></td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr class="en">
                <td><textarea name="proparameter_en" id="proparameter_en" cols="48" rows="3">Type:123
Money:123</textarea></td>
              </tr>
            </table>
			</div>
			</td>
            <td>
			<div class="red" id="proparameter_cn_err" style="display:none;">您还没有输入中文型号！√</div>
			<div class="green" id="proparameter_cn_tip" style="display:none;"></div>
			<div class="red" id="proparameter_en_err" style="display:none;">您还没有输入英文型号！√</div>
			<div class="green" id="proparameter_en_tip" style="display:none;"></div>
			</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>概述：</b></td>
            <td bgcolor="#F6F6F6">
			<input name="hasoutline" id="hasOutline1" type="radio" value="1" />
			<label for="hasOutline1">&nbsp;有&nbsp;</label>
            <input name="hasoutline" id="hasOutline0" type="radio" value="0" checked="checked" />
            <label for="hasOutline0">&nbsp;无&nbsp;</label>
			<span class="green">备注：此选项对应首页展示有描述的产品！</span>
			<a href="#" id="openOutline"><img src="images/open.gif" border="0" name="openericon"></a>
			</td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td>
			<div id="Outline" style="DISPLAY: none">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="cn">
                <td><textarea id="prooutline_cn" name="prooutline_cn" cols="48" rows="3">中文描述</textarea></td>
              </tr>
              <tr class="en">
                <td><textarea id="prooutline_en" name="prooutline_en" cols="48" rows="3">English</textarea></td>
              </tr>
            </table>
			</div>
			</td>
            <td class="red">
			<div class="red" id="prooutline_cn_err" style="display:none;">您还没有输入中文描述！√</div>
			<div class="green" id="prooutline_cn_tip" style="display:none;"></div>
			<div class="red" id="prooutline_en_err" style="display:none;">您还没有输入英文描述！√</div>
			<div class="green" id="prooutline_en_tip" style="display:none;"></div>
			</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>图片：</b></td>
            <td bgcolor="#F6F6F6">
			<input name="haspic" id="hasPic0" type="radio" value="0" checked="checked" />
			<label for="hasPic0">无图片</label>&nbsp;&nbsp;
			<input name="haspic" id="hasPic1" type="radio" value="1" />
			<label for="hasPic1">单张图片</label>&nbsp;&nbsp;
			<input name="haspic" id="hasPic2" type="radio" value="2" />
			<label for="hasPic2">多张图片</label>&nbsp;&nbsp;
			<span class="green">备注：此选项对应图片产品！</span>
			</td>
            <td bgcolor="#F6F6F6" class="red">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"></td>
            <td>
			<div id="upPic" style="DISPLAY: none">
				<input type="file" class="multi" accept="gif|jpg" maxlength="50" id="multiFile"/>
			</div>
			</td>
            <td></td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>状态：</b></td>
            <td bgcolor="#F6F6F6">
			<input id="proshow" name="proshow" type="checkbox" value="1" checked="checked" /><label for="proshow">显示:</label>&nbsp;&nbsp;
			<input id="proup" name="proup" type="checkbox" value="1" /><label for="proup">固顶:</label>&nbsp;&nbsp;
			<input id="procommend" name="procommend" type="checkbox" value="1" /><label for="procommend">推荐:</label>&nbsp;&nbsp;
			<input id="prohot" name="prohot" type="checkbox" value="1" /><label for="prohot">热点:</label>
			</td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>优先级：</b></td>
            <td bgcolor="#F6F6F6">
              <input name="proorder" type="text" value="50" maxlength="3" size="50" class="suSlider" minvalue="0" maxvalue="100" stepvalue="1"  />
            </td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr height="25">
            <td align="right" bgcolor="#F6F6F6"><b>价格：</b></td>
            <td bgcolor="#F6F6F6">
              <input name="proprice" type="text" value="1000" maxlength="6" size="50" class="suSlider" minvalue="0" maxvalue="10000" stepvalue="10"  />
            </td>
            <td bgcolor="#F6F6F6">&nbsp;</td>
          </tr>
          <tr height="25" class="cn">
            <td align="right"><b>说明：</b></td>
            <td>
<script type="text/javascript">
<!--
if (xiii_language != "en"){
	var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('admin')) + "admin/fckeditor/" ;
	var oFCKeditor = new FCKeditor( 'prointro_cn' ) ;
	oFCKeditor.BasePath	= sBasePath ;
	oFCKeditor.Height	= 150 ;
	oFCKeditor.ToolbarSet = "Basic"; 
	oFCKeditor.Value	= '请在此输入内容。。。' ;
	oFCKeditor.Create() ;
}
//-->
</script>
			</td>
            <td>&nbsp;</td>
          </tr>
          <tr height="25" class="en">
            <td align="right">&nbsp;</td>
            <td>
<script type="text/javascript">
<!--
if (xiii_language != "cn"){
	var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('admin')) + "admin/fckeditor/" ;
	var oFCKeditor = new FCKeditor( 'prointro_en' ) ;
	oFCKeditor.BasePath	= sBasePath ;
	oFCKeditor.Height	= 150 ;
	oFCKeditor.ToolbarSet = "Basic"; 
	oFCKeditor.Value	= 'enter product introduce here...' ;
	oFCKeditor.Create() ;
}
//-->
</script>
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

