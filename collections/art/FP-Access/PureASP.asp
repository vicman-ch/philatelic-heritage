<html>

<head>
<title></title>
</head>

<body>
<!-- PureASP.asp revised 07-01-98  -->
<div align="center"><center>

<pre>
  *--------------------------------------------------------------------*
  | This ASP program will display data from any ODBC data source using |
  | only plain ASP code.                                               |
  |                                                                    |
  *--------------------------------------------------------------------*
</pre>
</center></div><%

DSN="v-members"
Tablename="Members"

'------------- Modify the two lines above and run this program ------------

response.write("<BR><h3>Pure ASP - Navigation Check</h3>")
myself=request.ServerVariables("SCRIPT_NAME")
Set oRs=Server.CreateObject("ADODB.Recordset")
response.write("Object created"+"<BR>")
Cursor=0	'do not change this forward cursor!
oRs.open "SELECT * from " & Tablename,DSN,Cursor,1,1
Count=0
While not oRs.eof
    Count=Count+1
    oRs.moveNext
Wend
oRs.close
oRs.open "SELECT * from " & Tablename,DSN,Cursor,1,1
response.write("DSN=" & DSN & "<BR>")
response.write("Tablename=" & Tablename & "<BR>")
response.write("RecordCount=" & Count & "<BR>")
response.write("FieldCount=" & oRs.fields.count & "<BR>")
Q=request.querystring("Inc")
if Q<>"" then
    start=Clng(Q)
    if start<0 then start=0
    if start+5>Count then start=Count-5
        else
    start=0
end if
response.write("Start at " & start+1 & "<BR>")
response.write("<center><table border=1 cellspacing=1 cellpadding=3>")
response.write("<tr>")
for i=0 to oRs.fields.count-1
    response.write("<th>" & oRs(i).name & "</th>")
next
response.write("</tr><tr>")
oRs.move start
for i=start to start+4
    for j=0 to oRs.fields.count-1
        t=oRs(j).type
        if t=5 then
            s="BLOB"
        else
            if t=1 then
                s="MEMO"
            else
                t=oRs(j)
            end if
        response.write("<td>" & t & "</td>")
        end if
    next
    response.write("</tr>")
    oRs.MoveNext
    if oRs.eof then exit for
next
response.write("</table></center>")
response.write("<A HREF=""" & myself & "?Inc=" & i & """> Next </a> ")
response.write("--")
response.write("<A HREF=""" & myself & "?Inc=" & i-10 & """> Previous </a> ")
oRs.close
Set oRs=nothing
%>

</body>
</html>
