  <%@Language=VBscript %>

<%Country = Request.QueryString("Country")
Subject   = Request.QueryString("Subject")
Artist   = Request.QueryString("Artist")

%>

<!--Set oRs = Server.CreateObject("ADODB.Recordset")
oRs.Open("Monthly_sender",Session("ITEM"),,,4)-->

<%Set oCmd=Server.CreateObject("ADODB.Command")
oCmd.ActiveConnection=("manvic_aos")
IF Country <> "All" AND Subject = "" AND Artist = "" THEN
	oCmd.CommandText="QCountry"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array(Country),4)
END IF
IF Country = "All" AND Subject <> "" AND Artist = "" THEN
	oCmd.CommandText="QSubject"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array(Subject),4)
END IF
IF Country = "All" AND Subject = "" AND Artist <> "" THEN
	oCmd.CommandText="QArtists"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array(Artist),4)
END IF
IF Country <> "All" AND Subject = "" AND Artist <> "" THEN
	oCmd.CommandText="QCountryArtists"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array(Country,Artist),4)
END IF
IF Country <> "All" AND Subject <> "" AND Artist = "" THEN
	oCmd.CommandText="QCountrySubject"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array(Country,Subject),4)
END IF
IF Country = "All" AND Subject <> "" AND Artist <> "" THEN
	oCmd.CommandText="QSubjectArtists"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array(Subject,Artist),4)
END IF
IF Country <> "All" AND Subject <> "" AND Artist <> "" THEN
	oCmd.CommandText="QCtrySubjArtists"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array(Country,Subject,Artist),4)
END IF
IF Country = "All" AND Subject = "" AND Artist = "" THEN
	oCmd.CommandText="QCountryArtists"
	oCmd.CommandType=4
	Set oRs=oCmd.Execute("Sorted_paintings",Array("Albania","crbr"),4)
END IF

%>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Description" content="Art on Stamps database on-line results">
<meta http-equiv="Keywords" 
content="stamps, art,  philately, philatelic, collectors, collecting, timbres, Briefmarken">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title></title>
<base target="Member's-Page">
</head>

<body bgproperties="fixed" link="#FFFFFF" vlink="#FF0000" alink="#FFFF00" topmargin="12" bgcolor="#FFF5D7">

<p align="center"><img border="0" src="ttt-db1.gif"></p>

<p align="left"><i><strong><font face="Arial">QUERY PARAMETERS</font></strong></i></p>
  
<p align="left">
<%IF Country <> "All" Then
	Response.Write ("Country: ") %> 
	<font face="Arial" color="#FF0000" size="2"> <%Response.Write Country %>
	 </font> 
<%END IF %>  </p>
<p align="left">
<% IF Subject <> "" THEN
	Response.Write ("Subject: ") %> 
	<font face="Arial" color="#FF0000" size="2"> <%Response.Write Subject %>
	 </font> 
<%END IF %>  </p>
<p align="left">
<% IF Artist <> "" THEN  
	Response.Write("Artist: ")%> 
	<font face="Arial" color="#FF0000" size="2"> <%Response.Write Artist %>
	 </font> 
<%END IF %>  </p>

  <p align="center"><i><strong><font face="Arial">
  QUERY RESULTS</font></strong></i></p>

<div align="center">
  <center>
<TABLE BORDER=1 COLS=<% = oRs.Fields.Count%> cellPadding=1 cellSpacing=1>
<TR> 
  <% 
  If Not oRS.EOF Then  
  	For Each oField in oRs.Fields %>
  	<TH> <font face="Arial" color="#000000" size="2"><% =oField.Name %> &nbsp;</TH> 
  <%Next %> </TR>  

  <%	Else %> <TD ALIGN=CENTER> <font face="Arial" color="#FF0000" size="3">
  <% Response.Write ("No record satisfies your searching criteria. Eventually widen them.")%> &nbsp;</TD>
  <% End If
  %>
    
<%Do while Not oRS.EOF%>
     <TR> 
  <% For Each oField in oRs.Fields %>
       <TD ALIGN=CENTER> <font color="#000000" size="2">      
  			<%Response.Write oField.Value%>
  			&nbsp;</TD>
  <% Next
      oRs.MoveNext %>
     </TR>
<%Loop %>
</TABLE>
  </center>
</div>

<% oRs.Close
   Set oRs = Nothing %>
<p>&nbsp;</p>
<hr>

<table border="0" cellspacing="0" width="100%" cellpadding="0">
  <tr>
    <td width="704" valign="middle"><strong><font face="Arial" color="#000000" size="1">
    Created 02/02/01. Revised:
    <!--webbot bot="TimeStamp" s-format="%m/%d/%y" s-type="EDITED" startspan -->12/30/05<!--webbot bot="TimeStamp" i-checksum="12873" endspan -->.&nbsp;<br>
 Copyright © 1997 - 2006<br>
    by Victor Manta, Switzerland.&nbsp;<br>
 All rights reserved
      worldwide.</font></strong></td>
    <td valign="middle" align="right"><p align="center"><font color="#000000" face="Arial" size="1">
    <a target="_blank" href="../index.html"><img src="../vmbanner1.gif" 
    alt="Site's Banner" align="center" vspace="3"></a><br>
      <strong>Click the above banner to visit
    the site</strong></font></td>
  </tr>

  </table>
    
<hr>
    
</body>
</html>