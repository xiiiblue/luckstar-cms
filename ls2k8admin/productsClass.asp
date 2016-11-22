
<!--#include file="../inc/config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/productsClass.js" type="text/javascript"></script><!--本页专有JS-->
	<script type="text/javascript" src="js/thickbox.js"></script>
	<link rel="stylesheet" href="css/thickbox.css" type="text/css" media="screen" />
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
    <td height="45" valign="bottom" bgcolor="#C7DAE9"><table border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td width="80" height="25" bgcolor="#838383" align="center" class="white"><a href="productsList.asp">产品管理</a></td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#838383" align="center" class="white"><a href="productsAdd.asp">产品添加</a></td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#FF6600" align="center" class="white"><a href="productsClass.asp"><b>类别管理</b></a></td>
        <td width="10">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
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
        <td height="25" align="center">
		<div style="border:1px dotted #ccc; padding:4px 8px; margin:4px 100px; width:auto;">
		<table border="0" cellpadding="5" cellspacing="0">
		<form action="productsClassAdd.asp" method="POST" name="classForm1">
		<tr>
		<td><strong>新增栏目:</strong></td>
		
		<td>
<%
dim rsClass,classLevel,outstr
set rsClass=conn.execute("select * from productclass order by classcode")
outstr = "<select name=""parentId"">"&vbcrlf
outstr = outstr&"<option value=""0"">根栏目(在此选择父分类)</option>"&vbcrlf
if not (rsClass.eof and rsClass.bof) then
	do while(not rsClass.eof)
		classLevel = (len(rsClass("classcode"))/4)
		outstr = outstr&"<option value="""&rsClass("id")&""" "
		if request("proClass") = cstr(rsClass("id")) then
			outstr = outstr&"selected=""selected"""
		end if
		outstr = outstr&">"
		outstr = outstr&string((classLevel-1)*2,"　")&"├─"&rsClass("classname_cn")
		outstr = outstr&"</option>"&vbcrlf
		rsClass.movenext()
	loop
end if
outstr = outstr&"</select>"&vbcrlf
response.write(outstr)
set rsClass=nothing
%>
          </td>
		  <td>
          <input name="classname_cn" type="text" value="中文类别名称" size="16" maxlength="20" />
          </td>
		  <td>
          <input name="classname_en" type="text" value="English Class Name" size="16" maxlength="20" />
          </td>
		  <td>
          <input type="submit" name="Submit22" value="提交" />
          </td>
		  </tr>
		  </form>
		  </table>
		  </div>
		  </td>
      </tr>
      
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><table width="90%" border="0" align="center" cellpadding="2" cellspacing="2" class="classList">
          <tr>
            <td width="9%" height="23" bgcolor="#F6F6F6" class="green"><div align="center"><b>栏目排序</b></div></td>
            <td class="out"><b>栏目名称</b></td>
            <td class="out"><b>Class Name</b></td>
            <td width="14%" class="out"><div align="center"><b>编辑</b></div></td>
            <td width="13%" class="out"><div align="center"><b>删除</b></div></td>
          </tr>
          <tr>
            <td height="1" colspan="5" bgcolor="#666666"></td>
            </tr>
<!--列表开始-->
<%
dim sql,rs,classNameEn,classNameCn,classCode,classLevelFix,classId
sql="select * from productclass order by classcode"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3
if rs.eof and rs.bof then
	response.write("暂无记录")
else
	do while not rs.eof
		classId = rs("id")
		classNameEn = rs("classname_en")
		classNameCn = rs("classname_cn")
		classCode = rs("classcode")
		classLevel = len(classCode)/4
		classLevelFix = String((classLevel-1)*2,"　")&"├─"
%>

          <tr>
            <td height="" bgcolor="#F6F6F6">
			<div align="center">
			<a class="ajaxOrder" href="productsClassOrder.asp?action=up&classId=<%=classId%>"><u>↑</u></a>
			&nbsp;|&nbsp;
			<a class="ajaxOrder" href="productsClassOrder.asp?action=down&classId=<%=classId%>"><u>↓</u></a>
            </div>
			</td>
            <td width="34%"><%=classLevelFix%><%=classNameCn%></td>
            <td width="30%"><%=classLevelFix%><%=classNameEn%></td>
            <td><div align="center">
			<a href="productsClassEdit.asp?classId=<%=classId%>&height=220&width=340" class="thickbox" title="<strong>修改分类信息</strong>">
			<img src="images/edit.gif" width="22" height="22" />
			</a>
			</div></td>
            <td><div align="center">
			<a href="productsClassDel.asp?classId=<%=classId%>" onclick="return confirm('确定要删除吗?')">
			<img src="images/delete.gif" width="16" height="16" />
			</a>
			</div></td>
          </tr>
          <tr>
            <td height="1" colspan="5" bgcolor="#CCCCCC"></td>
          </tr>
<%
		rs.movenext()
	loop
end if
%>
<!--列表结束-->  
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