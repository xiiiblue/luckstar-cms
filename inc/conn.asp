<%
SqlDataBase	= "E:\iis\manageMent\ls2k8db\ip.mdb"	'IP数据库路径
SqlProvider	= "Microsoft.Jet.OLEDB.4.0"
Connstr="Provider="&SqlProvider&";Data Source="&SqlDataBase
SqlNowString="Now()"
SqlChar="'"
IsSqlVer="ACCESS"
Set connIp=Server.CreateObject("ADODB.Connection")
connIp.open ConnStr

SqlDataBase	= "E:\iis\manageMent\ls2k8db\db.mdb"	'主数据库路径
SqlProvider	= "Microsoft.Jet.OLEDB.4.0"	
Connstr="Provider="&SqlProvider&";Data Source="&SqlDataBase
SqlNowString="Now()"
SqlChar="'"
IsSqlVer="ACCESS"
Set Conn=Server.CreateObject("ADODB.Connection")
Conn.open ConnStr
%>