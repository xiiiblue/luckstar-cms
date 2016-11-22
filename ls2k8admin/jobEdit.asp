
<!--#include file="../inc/config.asp"-->
<%
dim rs,sql,jobid,action
if isempty(request.QueryString("action")) then 
	action = ""
else
	action = request.QueryString("action")
end if
if isempty(request.QueryString("jobid")) then 
	jobid = 0
else
	jobid = request.QueryString("jobid")
end if

if action = "edit" and jobid <> 0 then
	Set rs = Server.CreateObject("ADODB.Recordset")
	sql="select * from job where jobid = "&jobid
	rs.open sql,conn,1,3
	jobid=rs("jobid")
	jobname_cn=rs("jobname_cn")
	jobname_en=rs("jobname_en")
	jobnumber=rs("jobnumber")
	jobpay=rs("jobpay")
	jobdate=rs("jobdate")
	jobaddress_cn=rs("jobaddress_cn")
	jobaddress_en=rs("jobaddress_en")
	jobduties_cn=rs("jobduties_cn")
	jobduties_en=rs("jobduties_en")
	jobcontent_cn=rs("jobcontent_cn")
	jobcontent_en=rs("jobcontent_en")
	jobstate=rs("jobstate")		
	rs.close
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LUCK-STAR WEBSITE MANAGEMENT 3.0</title>
	<link href="css/global.css" rel="stylesheet" type="text/css" /><!--通用CSS-->
	<script src="js/jquery.js" type="text/javascript"></script><!--Jquery库-->
	<script src="js/global.js" type="text/javascript"></script><!--全局JS-->
	<script src="js/calendar.js" type="text/javascript"></script><!--日历-->
	<link href="css/calendar.css" rel="stylesheet" type="text/css" />
	<script src="js/slider.js" type="text/javascript"></script><!--日历-->
	<link href="css/slider.css" rel="stylesheet" type="text/css" />
	<script src="js/jobAdd.js" type="text/javascript"></script><!--本页专有JS-->
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
    <td height="45" valign="bottom" bgcolor="#C7DAE9"><table border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td width="80" height="25" bgcolor="#FF6600" align="center" class="white"><a href="jobAdd.asp"><b>职位添加</b></a></td>
        <td width="10">&nbsp;</td>
        <td width="80" bgcolor="#838383" align="center" class="white"><a href="jobList.asp">职位管理</a></td>
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
        <td>
		<!--表单开始-->
		<table width="700" border="0" align="center" cellpadding="2" cellspacing="2" class="proAddList">
		<form name="form1" action="jobEditDo.asp" method="post">
		<input name="jobid" value="<%=jobid%>" type="hidden" />
          <tr height="25" class="cn">
            <td width="13%" align="right"><b>职位名称:</b></td>
            <td width="63%">
			<input name="jobname_cn" id="jobname_cn" type="text" value="<%=jobname_cn%>" size="50" maxlength="50" />
			</td>
            <td width="24%">
			<span class="red" id="jobname_cn_err" style="display:none;">您还没有输入中文职位名！√</span>
			<span class="green" id="jobname_cn_tip" style="display:none;"></span>
			</td>
          </tr>
          <tr height="25" class="en">
            <td align="right"><b>职位名称:</b></td>
            <td><input name="jobname_en" id="jobname_en" type="text" value="<%=jobname_en%>" size="50" / maxlength="50"></td>
            <td>
			<span class="red" id="jobname_en_err" style="display:none;">您还没有输入英文职位名！√</span>
			<span class="green" id="jobname_en_tip" style="display:none;"></span>
			</td>
          </tr>
		  
		  

          <tr height="25">
            <td width="13%" align="right"><b>招聘人数:</b></td>
            <td width="63%">
			<input name="jobnumber" id="jobnumber" type="text" value="<%=jobnumber%>" maxlength="3" size="50" class="suSlider" minvalue="0" maxvalue="50" stepvalue="1"  />
			</td>
            <td width="24%">
			</td>
          </tr>

          <tr height="25">
            <td width="13%" align="right"><b>薪资标准:</b></td>
            <td width="63%">
			<input name="jobpay" id="jobpay" type="text" value="<%=jobpay%>" size="50" maxlength="50" />
			</td>
            <td width="24%">
			</td>
          </tr>
		  
          <tr height="25">
            <td width="13%" align="right"><b>截止日期:</b></td>
            <td width="63%">
			<div id="demo1"></div>
			<input name="jobdate" id="jobdate" type="text" value="<%=jobdate%>" size="50" maxlength="50" style=" background:url(images/calendar/cal_btn.gif) no-repeat right; cursor:default;" readonly="readonly"/>
			</td>
            <td width="24%">
			</td>
          </tr>
		  
          <tr height="25" class="cn">
            <td width="13%" align="right"><b>工作地点:</b></td>
            <td width="63%">
			<input name="jobaddress_cn" id="jobaddress_cn" type="text" value="<%=jobaddress_cn%>" size="50" maxlength="50" />
			</td>
            <td width="24%">
			<span class="red" id="jobaddress_cn_err" style="display:none;">您还没有输入中工作地点！√</span>
			<span class="green" id="jobaddress_cn_tip" style="display:none;"></span>
			</td>
          </tr>
          <tr height="25" class="en">
            <td align="right"><b>工作地点:</b></td>
            <td><input name="jobaddress_en" id="jobaddress_en" type="text" value="<%=jobaddress_en%>" size="50" / maxlength="50"></td>
            <td>
			<span class="red" id="jobaddress_en_err" style="display:none;">您还没有输入英文工作地点！√</span>
			<span class="green" id="jobaddress_en_tip" style="display:none;"></span>
			</td>
          </tr>

          <tr height="25" class="cn">
            <td width="13%" align="right"><b>职位要求:</b></td>
            <td width="63%">
			<textarea name="jobduties_cn" id="jobduties_cn" cols="20" rows="3"><%=jobduties_cn%></textarea>
			</td>
            <td width="24%">
			<span class="red" id="jobduties_cn_err" style="display:none;">您还没有输入中文要求！√</span>
			<span class="green" id="jobduties_cn_tip" style="display:none;"></span>
			</td>
          </tr>
          <tr height="25" class="en">
            <td align="right"><b>职位要求:</b></td>
            <td>
			<textarea name="jobduties_en" id="jobduties_en" cols="20" rows="3"><%=jobduties_en%></textarea>
			</td>
            <td>
			<span class="red" id="jobduties_en_err" style="display:none;">您还没有输入英文要求！√</span>
			<span class="green" id="jobduties_en_tip" style="display:none;"></span>
			</td>
          </tr>

          <tr height="25" class="cn">
            <td width="13%" align="right"><b>详情(可选):</b></td>
            <td width="63%">
			<textarea name="jobcontent_cn" id="jobcontent_cn" cols="20" rows="3"><%=jobcontent_cn%></textarea>
			</td>
            <td width="24%">
			<span class="red" id="jobcontent_cn_err" style="display:none;">您还没有输入中文详情！√</span>
			<span class="green" id="jobcontent_cn_tip" style="display:none;"></span>
			</td>
          </tr>
          <tr height="25" class="en">
            <td align="right"><b>详情(可选):</b></td>
            <td>
			<textarea name="jobcontent_en" id="jobcontent_en" cols="20" rows="3"><%=jobcontent_en%></textarea>
			</td>
            <td>
			<span class="red" id="jobcontent_en_err" style="display:none;">您还没有输入英文详情！√</span>
			<span class="green" id="jobcontent_en_tip" style="display:none;"></span>
			</td>
          </tr>
		  
          <tr height="25">
            <td align="right">职位状态</td>
            <td>
			<label><input type="radio" name="jobstate" value="1"
			<%
			if jobstate=1 then
				response.Write("checked=""checked""")
			end if
			%>
			 />热招</label>	
			<label><input type="radio" name="jobstate" value="2"
			<%
			if jobstate=2 then
				response.Write("checked=""checked""")
			end if
			%>
			 />饱和</label>	
			<label><input type="radio" name="jobstate" value="0"
			<%
			if jobstate=0 then
				response.Write("checked=""checked""")
			end if
			%>
			 />暂停</label>	
			</td>
            <td>
			</td>
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