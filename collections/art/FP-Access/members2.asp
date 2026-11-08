<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>PASIC Members List</title>
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
</head>

<body background="../walpasic.gif" bgproperties="fixed" link="#FF0000" vlink="#00FF00" alink="#FFFF00">

<h2 align="center"><img src="../tt-club.gif" alt="tt-club.gif (7280 bytes)" WIDTH="646" HEIGHT="51"></h2>
<div align="center"><center>

<table border="0" cellpadding="5" cellspacing="3" bordercolordark="#000080" bordercolorlight="#008000" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><img src="../ROTATING_EARTH.GIF" alt="ROTATING_EARTH.GIF (44401 bytes)" WIDTH="105" HEIGHT="80"></td>
    <td align="center"><img src="../ttl_members.gif" alt="ttl_members.gif (9996 bytes)" WIDTH="390" HEIGHT="87"></td>
    <td align="center"><img src="../ROTATING_EARTH.GIF" alt="ROTATING_EARTH.GIF (44401 bytes)" WIDTH="105" HEIGHT="80"></td>
  </tr>
</table>
</center></div>

<p>&nbsp;</p>

<table width="100%" border="1" background="../WorldMap.gif">
  <tr>
    <td><font face="Arial" size="2" color="#FFFFFF" align="center"><b>Nr</b></font></td>
    <td><font face="Arial" size="2" color="#FFFFFF" align="center"><b>Name</b></font></td>
    <td><font face="Arial" size="2" color="#FFFFFF" align="center"><b>Country</b></font></td>
    <td><font face="Arial" size="2" color="#FFFFFF" align="center"><b>Interests</b></font></td>
    <td><font face="Arial" size="2" color="#FFFFFF" align="center"><b>Languages</b></font></td>
    <td><font face="Arial" size="2" color="#FFFFFF" align="center"><b>Email</b></font></td>
    <td><font face="Arial" size="2" color="#FFFFFF" align="center"><b>Homepage</b></font></td>
  </tr>
  <!--webbot bot="DatabaseRegionStart" startspan s-columnnames="Nr,Name,Country,Interests,Languages,Email,Homepage" s-connstring="DSN=v-members" s-password b-tableformat="TRUE" s-sql="SELECT * from Members Order BY Nr" local_preview="&lt;tr&gt;&lt;td colspan=14 bgcolor=&quot;#FFFF00&quot; align=&quot;center&quot; width=&quot;100%&quot;color=&quot;#FFFFFF&quot;&gt;&lt;&gt; Database Regions do not preview unless this page is fetched from a Web server using a web browser.  The following table will display one row for each query result row when the page is fetched from a Web server.&lt;/td&gt;&lt;/tr&gt;" preview clientside s-DefaultFields s-NoRecordsFound="No Records Returned" i-MaxRecords i-ScriptTimeout tag="BODY" --><%
' Substitute in form parameters into the query string
fp_sQry = "SELECT * from Members Order BY Nr"
fp_sDefault = ""
fp_sNoRecords = "No Records Returned"
fp_iMaxRecords = 0
fp_iTimeout = 0
fp_iCurrent = 1
fp_fError = False
fp_bBlankField = False
If fp_iTimeout <> 0 Then Server.ScriptTimeout = fp_iTimeout
Do While (Not fp_fError) And (InStr(fp_iCurrent, fp_sQry, "%%") <> 0)
	' found a opening quote, find the close quote
	fp_iStart = InStr(fp_iCurrent, fp_sQry, "%%")
	fp_iEnd = InStr(fp_iStart + 2, fp_sQry, "%%")
	If fp_iEnd = 0 Then
		fp_fError = True
		Response.Write "<B>Database Region Error: mismatched parameter delimiters</B>"
	Else
		fp_sField = Mid(fp_sQry, fp_iStart + 2, fp_iEnd - fp_iStart - 2)
		If Mid(fp_sField,1,1) = "%" Then
			fp_sWildcard = "%"
			fp_sField = Mid(fp_sField, 2)
		Else
			fp_sWildCard = ""
		End If
		fp_sValue = Request.Form(fp_sField)

		' if the named form field doesn't exist, make a note of it
		If (len(fp_sValue) = 0) Then
			fp_iCurrentField = 1
			fp_bFoundField = False
			Do While (InStr(fp_iCurrentField, fp_sDefault, fp_sField) <> 0) _
				And Not fp_bFoundField
				fp_iCurrentField = InStr(fp_iCurrentField, fp_sDefault, fp_sField)
				fp_iStartField = InStr(fp_iCurrentField, fp_sDefault, "=")
				If fp_iStartField = fp_iCurrentField + len(fp_sField) Then
					fp_iEndField = InStr(fp_iCurrentField, fp_sDefault, "&")
					If (fp_iEndField = 0) Then fp_iEndField = len(fp_sDefault) + 1
					fp_sValue = Mid(fp_sDefault, fp_iStartField+1, fp_iEndField-1)
					fp_bFoundField = True
				Else
					fp_iCurrentField = fp_iCurrentField + len(fp_sField) - 1
				End If
			Loop
		End If

		' this next finds the named form field value, and substitutes in
		' doubled single-quotes for all single quotes in the literal value
		' so that SQL doesn't get confused by seeing unpaired single-quotes
		If (Mid(fp_sQry, fp_iStart - 1, 1) = """") Then
			fp_sValue = Replace(fp_sValue, """", """""")
		ElseIf (Mid(fp_sQry, fp_iStart - 1, 1) = "'") Then
			fp_sValue = Replace(fp_sValue, "'", "''")
		ElseIf Not IsNumeric(fp_sValue) Then
			fp_sValue = ""
		End If

		If (len(fp_sValue) = 0) Then fp_bBlankField = True

		fp_sQry = Left(fp_sQry, fp_iStart - 1) + fp_sWildCard + fp_sValue + _
			Right(fp_sQry, Len(fp_sQry) - fp_iEnd - 1)
		
		' Fixup the new current position to be after the substituted value
		fp_iCurrent = fp_iStart + Len(fp_sValue) + Len(fp_sWildCard)
	End If
Loop

If Not fp_fError Then
	' Use the connection string directly as entered from the wizard
	On Error Resume Next
	set fp_rs = CreateObject("ADODB.Recordset")
	If fp_iMaxRecords <> 0 Then fp_rs.MaxRecords = fp_iMaxRecords
	fp_rs.Open fp_sQry, "DSN=v-members"
	If Err.Description <> "" Then
		Response.Write "<B>Database Error: " + Err.Description + "</B>"
		if fp_bBlankField Then
			Response.Write "  One or more form fields were empty."
		End If
	Else
		' Check for the no-record case
		If fp_rs.EOF And fp_rs.BOF Then
			Response.Write fp_sNoRecords
		Else
			' Start a while loop to fetch each record in the result set
			Do Until fp_rs.EOF
%>
<!--webbot bot="DatabaseRegionStart" i-CheckSum="45812" endspan -->
<% frmt = "<font face=""Arial"" size=""2"" color=""#FFFFFF"">" %>
<% frmt-e = "</font>" %>
  <tr>
    <td>!--webbot bot=&quot;DatabaseResultColumn&quot; startspan s-columnnames=&quot;Nr,Name,Country,Interests,Languages,Email,Homepage&quot; s-column=&quot;Nr&quot; b-tableformat=&quot;TRUE&quot; clientside local_preview=&quot;Database: Nr&quot; preview=&quot;Database: Nr&quot; --&gt;
<%
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write frmt & CStr(fp_rs("Nr")) & frmt-e
%>
<!--webbot bot="DatabaseResultColumn" startspan --><strong>[FrontPage DatabaseResultColumn Component]</strong><!--webbot bot="DatabaseResultColumn" endspan i-checksum="42042" --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan s-columnnames="Nr,Name,Country,Interests,Languages,Email,Homepage" s-column="Name" b-tableformat="TRUE" clientside local_preview="Database: Name" preview="Database: Name" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Name")) 
%>
<!--webbot bot="DatabaseResultColumn" i-CheckSum="27668" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan s-columnnames="Nr,Name,Country,Interests,Languages,Email,Homepage" s-column="Country" b-tableformat="TRUE" clientside local_preview="Database: Country" preview="Database: Country" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Country")) 
%>
<!--webbot bot="DatabaseResultColumn" i-CheckSum="27655" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan s-columnnames="Nr,Name,Country,Interests,Languages,Email,Homepage" s-column="Interests" b-tableformat="TRUE" clientside local_preview="Database: Interests" preview="Database: Interests" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Interests")) 
%>
<!--webbot bot="DatabaseResultColumn" i-CheckSum="33861" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan s-columnnames="Nr,Name,Country,Interests,Languages,Email,Homepage" s-column="Languages" b-tableformat="TRUE" clientside local_preview="Database: Languages" preview="Database: Languages" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Languages")) 
%>
<!--webbot bot="DatabaseResultColumn" i-CheckSum="32013" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan s-columnnames="Nr,Name,Country,Interests,Languages,Email,Homepage" s-column="Email" b-tableformat="TRUE" clientside local_preview="Database: Email" preview="Database: Email" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Email")) 
%>
<!--webbot bot="DatabaseResultColumn" i-CheckSum="23454" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan s-columnnames="Nr,Name,Country,Interests,Languages,Email,Homepage" s-column="Homepage" b-tableformat="TRUE" clientside local_preview="Database: Homepage" preview="Database: Homepage" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Homepage")) 
%>
<!--webbot bot="DatabaseResultColumn" i-CheckSum="29204" endspan --> </td>
  </tr>
  <!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="TRUE" local_preview preview clientside tag="BODY" --><%
				' Close the loop iterating records
				fp_rs.MoveNext
			Loop
		End If
		fp_rs.Close
	' Close the If condition checking for a connection error
	End If
' Close the If condition checking for a parse error when replacing form field params
End If
set fp_rs = Nothing
%>
<!--webbot bot="DatabaseRegionEnd" i-CheckSum="55813" endspan -->

</table>

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
    <td><img src="../dogrun.gif" alt="dogrun.gif (12972 bytes)" WIDTH="200" HEIGHT="35"></td>
    <td align="center"><p align="center"><img src="../Apply.gif" alt="Apply.gif (5410 bytes)" WIDTH="180" HEIGHT="65"></td>
    <td><img src="../CAT+FLY.GIF" alt="CAT+FLY.GIF (11679 bytes)" WIDTH="256" HEIGHT="48"></td>
  </tr>
</table>
</center></div>

<p><font color="#FF0000"><strong>Legal notice: This is a private list, owned by the author
of this site and&nbsp; legally copyrighted. It is strictly forbidden to distribute it or
to send commercial offers to PASIC members!</strong></font></p>
<div align="center"><center>

<table border="0" cellspacing="0" width="100%" cellpadding="0">
  <tr>
    <td width="704" valign="middle"><small><strong><small><font color="#0000FF" face="Arial">Revised:
    <!--webbot bot="TimeStamp" s-format="%m/%d/%y" s-type="EDITED" startspan -->02/11/01<!--webbot bot="TimeStamp" endspan i-checksum="12360" -->.<br>
    Copyright © 1997 - 1998 by Victor Manta. All rights reserved.</font></small></strong></small></td>
    <td valign="middle" align="right" width="10"></td>
    <td valign="middle" align="right"><img src="../vmbanner1.gif" alt="vmbanner1.gif (5478 bytes)" WIDTH="400" HEIGHT="40"></td>
  </tr>
</table>
</center></div>
</body>
</html>
