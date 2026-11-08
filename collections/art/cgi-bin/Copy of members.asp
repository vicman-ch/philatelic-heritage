<html>

<head>
<meta http-equiv="Description" content="Paintings and Arts on Stamps Club - members List">
<meta http-equiv="Keywords" content="paintings, arts, stamps, PASIC, club, members">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title></title>
</head>

<body background="../walpasic.gif" bgproperties="fixed" link="#FF0000" vlink="#00FF00" alink="#FFFF00" topmargin="8">
<!-- PureASP.asp revised 07-01-98  -->

<h2 align="center"><img src="../tt-club.gif" alt="PASIC" WIDTH="646" HEIGHT="51"></h2>
<div align="center"><center>

<table border="0" cellpadding="5" cellspacing="3" bordercolordark="#000080" bordercolorlight="#008000" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><img src="../ROTATING_EARTH.GIF" alt="Rotating Earth" WIDTH="105" HEIGHT="80"></td>
    <td align="center"><img src="../ttl_members.gif" alt="Members" WIDTH="390" HEIGHT="87"></td>
    <td align="center"><img src="../ROTATING_EARTH.GIF" alt="Rotating Earth" WIDTH="105" HEIGHT="80"></td>
  </tr>
</table>
</center></div>
<p>&nbsp;</p>

<%
DSN = "Provider=Microsoft.Jet.OLEDB.4.0;" &_
      "Data Source=" & Server.MapPath ("members.mdb")
 frmt = "<font face=""Arial"" size=""2"" color=""#FFFFFF"">"  ' format the output for the members table
 frmte = "</font>"

Tablename="Members"

'response.write("<BR><h3>Pure ASP - Navigation Check</h3>")
myself=request.ServerVariables("SCRIPT_NAME")
Set oRs=Server.CreateObject("ADODB.Recordset")
'response.write("Please wait..."+"<BR>")
Cursor=0	'do not change this forward cursor!
oRs.open "SELECT * from " & Tablename,DSN,Cursor,1,1
Count=0	'Number of records
While not oRs.eof	'Count the records
    Count=Count+1
    oRs.moveNext
Wend
oRs.close
oRs.open "SELECT * from " & Tablename & " Order BY DateTim",DSN,Cursor,1,1
'response.write("DSN=" & DSN & "<BR>")
'response.write("Tablename=" & Tablename & "<BR>")
'response.write("RecordCount=" & Count & "<BR>")
'response.write("FieldCount=" & oRs.fields.count & "<BR>")
Q=request.querystring("Inc")
if Q<>"" then
    start=Clng(Q)
    if start<0 then start=0
    if start+5>Count then start=Count-5
        else
    start=0
end if
'response.write("Start at " & start+1 & "<BR>")
response.write("<center><table width=""100%"" background=""../WorldMap.gif"" border=1 cellspacing=1 cellpadding=3>") 

'response.write("<center><table border=1 cellspacing=1 cellpadding=3>") CHANGED
response.write("<tr>")
for i=1 to oRs.fields.count-1		'don't write DateTim
    'response.write("<th>" & oRs(i).name & "</th>") CHANGED
    response.write("<th>" & frmt & oRs(i).name & frmte & "</th>")
next
response.write("</tr><tr>")
'oRs.move start CHANGED
'for i=start to start+4 CHANGED
oRs.MoveFirst
'for i = 1 to Count CHANGED
for i = 0 to Count	 'counts the records
    for j=1 to oRs.fields.count-1	'counts the fields in the record. Don't writes DateTim
        t=oRs(j).type
        if t=5 then
            s="BLOB"
        else
            if t=1 then
                s="MEMO"
            else
                t=oRs(j)
            end if
            'response.write("<td>" & t & "</td>") CHANGED
            response.write("<td>"  & frmt & t & frmte & "</td>")
        end if
    next
    response.write("</tr>")
    oRs.MoveNext
    if oRs.eof then exit for
next
response.write("</table></center>")
'response.write("<A HREF=""" & myself & "?Inc=" & i & """> Next </a> ")
'response.write("--")
'response.write("<A HREF=""" & myself & "?Inc=" & i-10 & """> Previous </a> ")
oRs.close
Set oRs=nothing
%>

<table border="1" bordercolorlight="#800000" cellspacing="1" cellpadding="0" background="../WorldMap.gif" width="100%" height="168">
  <tr>
    <td align="center" bgcolor="#FFFF00" height="28" background="../WorldMap.gif"><p align="center"><font color="#00FF00"><em><strong>THESE PLACES </strong></em></font></td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../WorldMap.gif"><p align="center"><font color="#00FF00"><em><strong>ARE </strong></em></font></td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../WorldMap.gif"><p align="center"><font color="#00FF00"><em><strong>RESERVED</strong></em></font></td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../WorldMap.gif"><font color="#00FF00"><em><strong>FOR YOU !!!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></em></font></td>
  </tr>
  <tr>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><img src="../anim_subscribe.gif" width="136" height="30"></td>
    <td align="center" width="15%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif">&nbsp;</td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><font color="#00FF00"><strong>Entrée libre!</strong></font></td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif">&nbsp;<a href="db-update.asp" target="_blank"><font color="#FF0000" face="Arial"><strong><em>Hier klicken zum Beitreten</em></strong></font></a></td>
  </tr>
  <tr>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" valign="middle" background="../WorldMap.gif">&nbsp;<font color="#FF0000" face="Arial"><small><strong><small>Click
    here to </small></strong></small></font><a href="db-update.asp" target="_blank"><img src="../btn-join.gif" alt="Join PASIC" align="middle" WIDTH="97" HEIGHT="21"></a></td>
    <td align="center" width="15%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><img src="../anim_subscribe.gif" width="136" height="30"></td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><font color="#00FF00">&nbsp;<strong>Free Entry!</strong></font></td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><a href="db-update.asp" target="_blank"><font face="Arial"><strong><em>Cliquer
    ici pour s'inscrire</em></strong></font></a></td>
  </tr>
  <tr>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><font color="#00FF00"><strong>Keine Angebote!</strong></font></td>
    <td align="center" width="15%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif">&nbsp;</td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><img src="../anim_subscribe.gif" width="136" height="30"></td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><font color="#00FF00"><strong>NO commercial offers!</strong></font></td>
  </tr>
  <tr>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><font color="#00FF00"><strong>Eintritt ist kostenlos!</strong></font></td>
    <td align="center" width="15%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif">&nbsp;<font color="#FF0000" face="Arial"><small><strong><small>Click
    here to </small></strong></small></font><a href="db-update.asp" target="_blank"><img src="../btn-join.gif" alt="Join PASIC" align="middle" WIDTH="97" HEIGHT="21"></a></td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif">&nbsp;<strong><font color="#FF0000"> </font><font color="#00FF00">NO Hidden Costs!</font></strong></td>
    <td align="center" width="20%" bgcolor="#FFFF00" nowrap height="30" background="../WorldMap.gif"><img src="../anim_subscribe.gif" width="136" height="30"></td>
  </tr>
</table>

<p><font color="#0000FF" face="Arial"><strong><blink><marquee width="100%" border="1" behavior="alternate" bgcolor="#FFFF00">PASIC doesn't mean PASSIVE at all. Take your hobbies seriously! Nehmen Sie ihre Hobbies ernst! Prenez vos hobbies au serieux! Luati-va hobbiurile in serios!</marquee></blink></strong></font></p>
<div align="center"><center>

<table border="4" cellpadding="0" cellspacing="0" bgcolor="#808080">
  <tr>
    <td><img src="../dogrun.gif" alt="dog running" WIDTH="200" HEIGHT="35"></td>
    <td align="center"><p align="center"><img src="../Apply.gif" alt="Apply" WIDTH="180" HEIGHT="65"></td>
    <td><img src="../CAT+FLY.GIF" alt="CAT+FLY.GIF" WIDTH="256" HEIGHT="48"></td>
  </tr>
</table>
</center></div>

<p><font color="#FF0000"><strong>Legal notice: This is a private list, owned by the author
of this site and&nbsp; legally copyrighted. It is strictly prohibited to distribute it or
to send commercial offers to PASIC members!</strong></font></p>
<div align="center"><center>

<table border="0" cellspacing="0" width="100%" cellpadding="0">
  <tr>
    <td valign="middle" rowspan="2"><strong><small><small><font face="Arial">Revised:
    <!--webbot bot="TimeStamp" s-format="%m/%d/%y" s-type="EDITED" startspan -->11/10/03<!--webbot bot="TimeStamp" endspan i-checksum="12599" -->. Copyright © 1997 -
      2000</font></small></small><font face="Arial"><small> <small> by Victor
      Manta, Switzerland. The distribution of the list is prohibited.<br>
      All rights reserved in all countries</small></small><small><small>.</small></small></font></strong></td>
    <td rowspan="2"><p align="center"><font color="#0000FF"><a href="../indexold.html" target="_blank"><img border="0" src="../PASIC/pasic-banner.jpg"><br>
      </a></font><strong><font face="Arial"><small><small>Click the banner to
      visit the site</small></small></font></strong></td>
</center>
    <td>
      <p align="right"><a href="../PASIC/journal.htm"><img border="0" src="../buttons/btn-oneArrow.gif"></a></td>
  </tr>
  <tr>
    <td>
      <p align="right"><a href="../toc-gale.htm"><img border="0" src="../buttons/btn-dblArrow.gif"></a></td>
  </tr>
</table>
</div>

</body>
</html>
