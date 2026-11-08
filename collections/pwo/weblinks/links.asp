<%@ Language=VBScript %>
<html>

<head>
<link rel="stylesheet" href="basic1.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Philatelic Links Online</title>
</head>

<body topmargin="8" leftmargin="4" bgcolor="#FFF5D7">
<%
Dim cs, rs
' Open the links database.
cs = "Provider=Microsoft.Jet.OLEDB.4.0;"
cs = cs & "Persist Security Info=False;"
cs = cs & "Data Source="
cs = cs & server.mappath("stamplinks.mdb") & ";"
set ldb = server.createobject("adodb.connection")
ldb.open cs
set rs = ldb.Execute("select * from categories")
%>

<p align="center"><img border="0" src="../ttl-pwo.gif"></p>

<p align="center"><img border="0" src="links_page_title.gif"></p>

<div align="center">
<table border="0" width="72%">
  <tr>
    <td width="33%"><p align="center"><a href="../index.html" target="_top">Main
      PWO Page</a></td>
    <td width="34%"><p align="center"><a href="#This page">More information</a></td>
    <td width="33%"><p align="center"><a href="add_a_link.htm">Submit your link</a></td>
  </tr>
</table>
</div>

<p><font color="#000080">Each horizontal compartment shown below permits for a
different kind of searching. You can search for all sites that were posted in the last
XX days, all those
that belong to a given Category, or all those that have a specific word in site's
Title, URL or Description.&nbsp;You supply the word in the entry field, then you
press the Display button.</font><font color="#000080"> The matching results are displayed
in a separate windows, with links to the sites of interest (just click on those
links for visiting the sites that were found by the PWO Philatelic Links Online
search engine).</font></p>
<p><font color="#000080">Check the Working Links Only option (the default) to display only those links
which were found to be working the last time they were tested. Turn off this
option to display all links in the database, working or not. Bad links will be
flagged in the results list.</font></p>

<hr color="#FF0000">

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="newonly"><p><font color="#000080">View only new links added within
  the last <select name="dys" size="1">
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
    <option value="25">25</option>
    <option value="30">30</option>
    <option value="35">35</option>
    <option value="40">40</option>
    <option selected value="45">45</option>
    <option value="50">50</option>
  </select> days. <input type="submit" value="Display" name="B1">&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="WorkingLinks" value="ON" checked>Working Links
  Only</font></p>

<hr color="#FF0000">

</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="bycategory"><p><font color="#000080">List all links in this
  <span style="background-color: #FFFF00">Category</span>: <select name="key" size="1">
<% ' load the select list.
  rs.movefirst
  do while not rs.eof %>    <option value="<%= rs.fields("Category").value %>"><%= rs.fields("Category").value %> </option>
<% rs.movenext
  loop
  ldb.close
set ldb = nothing
set rs = nothing 
%>  </select><input type="submit" value="Display" name="B1">&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="WorkingLinks" value="ON" checked> Working Links
  Only</font></p>

<hr color="#FF0000">

</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchtitles"><p><font color="#000080">List all links where the
  <span style="background-color: #FFFF00">Title</span>
  contains: <input type="text" name="key" size="20"> <input type="submit" value="Search"
  name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked>Working
  Links Only</font></p>

<hr color="#FF0000">

</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchurls"><p><font color="#000080">List all links where the
  <span style="background-color: #FFFF00"> URL</span>
  contains: <input type="text" name="key" size="20"> <input type="submit" value="Search"
  name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked>Working
  Links Only</font> </p>

<hr color="#FF0000">

</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchtitlesanddesc"><p><font color="#000080">List all links where
  the <span style="background-color: #FFFF00">Title or Description</span> contains: <input type="text" name="key" size="20"> <input
  type="submit" value="Search" name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked>Working
  Links Only</font></p>
</form>

<hr color="#FF0000">

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="listall"><p><font color="#000080">List
  All links (warning - large
  and possibly slow download!) <input type="submit" value="List All" name="B1">&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="WorkingLinks" value="ON" checked>Working Links
  Only</font></p>
</form>

<hr color="#FF0000">

<p align="left"><font color="#000080"><a name="This page">This page </a>provides access to
Web pages and other
Internet resources related to philately and stamp collecting. It is unique in providing
the following advantages over other sites that provide philatelic Web links:</font></p>
<div align="center"><center>

<table border="0" width="66%">
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF">
      <p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"></font></td>
    <td width="90%"><font color="#000080">Over 1700 links and constantly growing!</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"></font></td>
    <td width="90%"><font color="#000080">Essentially few duplicate links. Some other sites have the same
      page listed 4 or 5
    times.</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"> </font> </td>
    <td width="90%"><font color="#000080">A live, fully searchable database of links instead of static out-of-date
    lists.</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"> </font> </td>
    <td width="90%"><font color="#000080">The ability to view only new links.</font></td>
  </tr>
  <tr>
    <td width="10%" valign="middle" align="center" bordercolor="#FFFFFF"><p align="center"><font color="#000080"><img border="0" src="../images/red-star.jpg"> </font> </td>
    <td width="90%"><font color="#000080">Close to 100% working links thanks to regular removal of <a href="dead_links.htm">dead
    links</a>.</font></td>
  </tr>
</table>
</center></div>

<p align="center"><big><font color="#000080">This is a free service brought to
you by the&nbsp; <b><br>
P</b>hilatelic <b>W</b>ebmasters <b>O</b>rganization.</font><font color="#FF0000">
&nbsp;<br>
</font>
</big><font color="#FF0000"><big>Bookmark this page for future reference!</big></font>
</p>

<table border="0" width="100%">
  <tr>
    <td width="50%"><p align="center"><a href="add_a_link.htm">SUBMIT YOUR LINK</a></td>
    <td width="50%"><p align="center"><a href="../index.html" target="_top">MAIN
      PWO PAGE</a></td>
  </tr>
</table>

<hr>

<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="3" width="100%">
    <tr>
      <td><font FACE="Arial"><font color="#000080"><strong><small><small><small>Created:
07/13/01. Revised: 
      <!--webbot
bot="TimeStamp" s-format="%m/%d/%y" s-type="EDITED" startspan -->03/16/02<!--webbot bot="TimeStamp" i-checksum="12570" endspan -->
 .</small></small></small></strong></font><b><font face="Arial" size="1" color="#000080"><small><br>
Copyright © 2001 - 2002 by PWO and<br>
        by <a href="http://www.values.ch" target="_blank">Victor
Manta,</a> Switzerland<br>
All rights reserved worldwide. Credits:<br>
        </small></font></b></font><b><font face="Arial" size="1" color="#FF0000">Compiled
and programmed by Peter G. Aitken, USA</font></b></td>
    </center>
      <td><!--webbot bot="HTMLMarkup" startspan --><script language="JavaScript1.2" type="text/javascript" src="http://pub21.bravenet.com/counter/code.php?id=343886&usernum=1722293326&groupnum=21&cpv=1"> </script>
<noscript>
<a href="http://counter21.bravenet.com/index.php?id=343886&usernum=1722293326&cpv=1" 
target="_top"><img src="http://counter21.bravenet.com/counter.php?id=343886&usernum=1722293326" 
alt="Bravenet.com" border="0" /></a>
</noscript><!--webbot bot="HTMLMarkup" endspan --></td>
    <td>
      <p align="right"><a href="http://www.pwmo.org" target="_top"><img border="0" src="../images/pwo-logo.gif"></a></td>
  </tr>
  </table>
</div>

<hr>

</body>
</html>