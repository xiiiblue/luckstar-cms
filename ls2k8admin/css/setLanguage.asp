<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
/*这里设置语言，但这种方式在FF下无效*/
<%if session("xiii_language") = "cn" then%>
.en{display:none;}
<%end if%>
<%if session("xiii_language") = "en" then%>
.cn{display:none;}
<%end if%>