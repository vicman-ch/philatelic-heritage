<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Erase Records</title>
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
</head>

<body>

<table width="100%" border="1">
  <tr>
    <td><b>DateTim</b></td>
    <td><b>Name</b></td>
    <td><b>Country</b></td>
    <td><b>Interests</b></td>
    <td><b>Languages</b></td>
    <td><b>Email</b></td>
    <td><b>Homepage</b></td>
  </tr>
  <!--webbot bot="DatabaseRegionStart" startspan
  s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage"
  s-connstring="DSN=v-members" s-password b-tableformat="TRUE"
  s-sql="DELETE FROM MEMBERS WHERE NAME='%%Name1%%' and COUNTRY = '%%Country1%%'"
  local_preview="&lt;tr&gt;&lt;td colspan=14 bgcolor=&quot;#FFFF00&quot; align=&quot;center&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt; Database Regions do not preview unless this page is fetched from a Web server using a web browser.  The following table will display one row for each query result row when the page is fetched from a Web server.&lt;/td&gt;&lt;/tr&gt;"
  preview clientside s-DefaultFields s-NoRecordsFound="Record erased" i-MaxRecords
  i-ScriptTimeout tag="BODY" --><%
' Substitute in form parameters into the query string
fp_sQry = "DELETE FROM MEMBERS WHERE NAME='%%Name1%%' and COUNTRY = '%%Country1%%'"
fp_sDefault = ""
fp_sNoRecords = "Record erased"
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
<!--webbot bot="DatabaseRegionStart" i-checksum="47737"
  endspan -->

  <tr>
    <td><!--webbot bot="DatabaseResultColumn" startspan
    s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage" s-column="DateTim"
    b-tableformat="TRUE" clientside local_preview="Database: DateTim"
    preview="Database: DateTim" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("DateTim")) 
%>
<!--webbot bot="DatabaseResultColumn" i-checksum="26458"
    endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan
    s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage" s-column="Name"
    b-tableformat="TRUE" clientside local_preview="Database: Name" preview="Database: Name" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Name")) 
%>
<!--webbot
    bot="DatabaseResultColumn" i-checksum="27668" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan
    s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage" s-column="Country"
    b-tableformat="TRUE" clientside local_preview="Database: Country"
    preview="Database: Country" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Country")) 
%>
<!--webbot bot="DatabaseResultColumn" i-checksum="27655"
    endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan
    s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage"
    s-column="Interests" b-tableformat="TRUE" clientside local_preview="Database: Interests"
    preview="Database: Interests" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Interests")) 
%>
<!--webbot bot="DatabaseResultColumn"
    i-checksum="33861" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan
    s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage"
    s-column="Languages" b-tableformat="TRUE" clientside local_preview="Database: Languages"
    preview="Database: Languages" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Languages")) 
%>
<!--webbot bot="DatabaseResultColumn"
    i-checksum="32013" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan
    s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage" s-column="Email"
    b-tableformat="TRUE" clientside local_preview="Database: Email" preview="Database: Email" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Email")) 
%>
<!--webbot
    bot="DatabaseResultColumn" i-checksum="23454" endspan --> </td>
    <td><!--webbot bot="DatabaseResultColumn" startspan
    s-columnnames="DateTim,Name,Country,Interests,Languages,Email,Homepage"
    s-column="Homepage" b-tableformat="TRUE" clientside local_preview="Database: Homepage"
    preview="Database: Homepage" --><% 
If Not IsEmpty(fp_rs) And Not (fp_rs Is Nothing) Then Response.Write CStr(fp_rs("Homepage")) 
%>
<!--webbot bot="DatabaseResultColumn" i-checksum="29204"
    endspan --> </td>
  </tr>
  <!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="TRUE" local_preview preview
  clientside tag="BODY" --><%
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
<!--webbot bot="DatabaseRegionEnd" i-checksum="55813" endspan
  -->

</table>
</body>
</html>
