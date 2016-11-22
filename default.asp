<!--#include file="inc/config.asp"-->
<%
if xiii_staticpage="html" then
	server.Transfer("index.html")
else
	server.Transfer("index.asp")	
end if
%>