<%
Function stripcrlf(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True
  objRegExp.Pattern = "\s"
  strOutput = objRegExp.Replace(strHTML, "")
  stripcrlf = strOutput
  Set objRegExp = Nothing
End Function

Function stripsql(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True 
  objRegExp.Pattern = "\'"
  strOutput = objRegExp.Replace(strHTML, "''")
  stripsql = strOutput
  Set objRegExp = Nothing
End Function

Function stripeditor(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True 
  objRegExp.Pattern = """"
  strOutput = objRegExp.Replace(strHTML, "¡°")
  stripeditor = strOutput
  Set objRegExp = Nothing
End Function

Function stripspecial(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True
  
  objRegExp.Pattern = "\s"
  strOutput = objRegExp.Replace(strHTML, "")
  objRegExp.Pattern = "\\"
  strOutput = objRegExp.Replace(strOutput, "\\")
  objRegExp.Pattern = "\."
  strOutput = objRegExp.Replace(strOutput, "\.")
  objRegExp.Pattern = "\|"
  strOutput = objRegExp.Replace(strOutput, "\|")
  objRegExp.Pattern = "\("
  strOutput = objRegExp.Replace(strOutput, "\(")
  objRegExp.Pattern = "\)"
  strOutput = objRegExp.Replace(strOutput, "\)")
  objRegExp.Pattern = "\{"
  strOutput = objRegExp.Replace(strOutput, "\{")
  objRegExp.Pattern = "\}"
  strOutput = objRegExp.Replace(strOutput, "\}")
  objRegExp.Pattern = "\?"
  strOutput = objRegExp.Replace(strOutput, "\?")
  objRegExp.Pattern = "\+"
  strOutput = objRegExp.Replace(strOutput, "\+")

  stripspecial = strOutput
  Set objRegExp = Nothing
End Function
'---------------------------------------------------
Function stripcontent(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = false
  strOutput=strHTML

  objRegExp.Pattern = keyword1  
  Set Matches = objRegExp.Execute(strOutput) 
  For Each Match in Matches 
  	n=len(strOutput)-len(keyword1)-match.FirstIndex
	strOutput = right(strOutput,n)
	flag=flag+1
	exit for
  next
  
  objRegExp.Pattern = keyword2
  Set Matches = objRegExp.Execute(strOutput)
  For Each Match in Matches  
  	strOutput = left(strOutput,match.FirstIndex)	
	flag=flag+2
	exit for
  next
  
  objRegExp.Global = true
  objRegExp.Pattern = "<script>.+?</script>"
  strOutput = objRegExp.Replace(strOutput, "")

  objRegExp.Global = true
  objRegExp.Pattern = "<style>.+?</style>"
  strOutput = objRegExp.Replace(strOutput, "")

  objRegExp.Global = true
  objRegExp.Pattern = "<a.+?>|</a>"
  strOutput = objRegExp.Replace(strOutput, "")

  objRegExp.Global = true
  objRegExp.Pattern = "<.+?>"
  strOutput = objRegExp.Replace(strOutput, "<br>")

  objRegExp.Global = true
  objRegExp.Pattern = "(<br>)+"
  strOutput = objRegExp.Replace(strOutput, "</p><p>")

  objRegExp.Global = false
  objRegExp.Pattern = "</p><p>"
  strOutput = objRegExp.Replace(strOutput, "<p>")

  strOutput=left(strOutput,30000)
  stripcontent = strOutput
  Set objRegExp = Nothing
End Function
'--------------------------------------------------------
Function striptitle1(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = False
  
  objRegExp.Pattern = "<title>.+?</title>"
  set matches=objRegExp.Execute(strHTML)
  For Each Match in Matches
  	strOutput = match.value
	exit for
  next

  objRegExp.Global = true
  objRegExp.Pattern = "<.+?>"
  strOutput = objRegExp.Replace(strOutput, "")

  objRegExp.Pattern = keyword0
  Set Matches = objRegExp.Execute(strOutput)
  For Each Match in Matches  
  	strOutput = left(strOutput,match.FirstIndex)
	flag=flag+12
	exit for
  next
  
  strOutput=left(strOutput,25)
  striptitle1 = strOutput
  Set objRegExp = Nothing
End Function
'--------------------------------------------------------
Function striptitle2(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = false
  strOutput=strHTML

  objRegExp.Pattern = keyword3
  Set Matches = objRegExp.Execute(strOutput) 
  For Each Match in Matches 
  	n=len(strOutput)-len(keyword3)-match.FirstIndex
	strOutput = right(strOutput,n)
	flag=flag+4
	exit for
  next
  
  objRegExp.Pattern = keyword4
  Set Matches = objRegExp.Execute(strOutput)
  For Each Match in Matches  
  	strOutput = left(strOutput,match.FirstIndex)	
	flag=flag+8
	exit for
  next

  objRegExp.Global = true
  objRegExp.Pattern = "<.+?>"
  strOutput = objRegExp.Replace(strOutput, "")
  
  strOutput = left(strOutput,25)
  striptitle2 = strOutput
  Set objRegExp = Nothing
End Function
'-------------------------------------------------
function striptitle3()
  Dim objRegExp, strOutput
  strOutput=f1.name
  
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = true
  
  objRegExp.Pattern = "\..*"
  strOutput = objRegExp.Replace(strOutput, "")
  flag=flag+12
  strOutput = left(strOutput,25)
  striptitle3 = strOutput
End function

%>