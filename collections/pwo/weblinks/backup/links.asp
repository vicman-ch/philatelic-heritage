<%@ Language=VBScript %>
<html>

<head>
<link rel="stylesheet" href="basic1.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Philatelic Links Online</title>
</head>

<body>
<%
Dim cs, rs
' Open the links database.
cs = "Provider=Microsoft.Jet.OLEDB.4.0;"
cs = cs & "Persist Security Info=False;"
cs = cs & "Data Source="
cs = cs & server.mappath("databases\Stamplinks.mdb") & ";"
set ldb = server.createobject("adodb.connection")
ldb.open cs
set rs = ldb.Execute("select * from categories")
%>

<p align="center"><img src="IMAGES/stamps/links_page_title.gif" width="582" height="78"
alt="links_page_title.gif (3531 bytes)"></p>

<p align="center"><small>Compiled by Peter G. Aitken</small></p>
<div align="center">
<table border="0" width="72%">
  <tr>
    <td width="33%"><p align="center"><a href="STAMPCOL.ASP">Main stamp page</a></td>
    <td width="34%"><p align="center"><a href="#This page">More information</a></td>
    <td width="33%"><p align="center"><a href="add_a_link.htm">Submit your link</a></td>
  </tr>
</table>
</div>

<p align="center" style="border: 1 solid #0000FF; padding: 1"><font color="#FF0000">New
feature!</font>&nbsp;<br>
Check the Working Links Only option (the default) to display only those links
which were found to be working the last time they were tested. Turn off this
option to display all links in the database, working or not. Bad links will be
flagged in the results list.</p>

<hr>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="newonly"><p>View only new links added within
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
  Only</p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="bycategory"><p>List all links in this
  category: <select name="key" size="1">
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
  Only</p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchtitles"><p>List all links where the title
  contains: <input type="text" name="key" size="20"> <input type="submit" value="Search"
  name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked>Working
  Links Only</p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchurls"><p>List all links where the URL
  contains: <input type="text" name="key" size="20"> <input type="submit" value="Search"
  name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked>Working
  Links Only </p>
  <hr>
</form>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="srchtitlesanddesc"><p>List all links where
  the title or description contains: <input type="text" name="key" size="20"> <input
  type="submit" value="Search" name="B1">&nbsp;&nbsp;&nbsp; <input type="checkbox" name="WorkingLinks" value="ON" checked>Working
  Links Only</p>
</form>

<hr>

<form method="POST" action="showlinks.asp">
  <input type="hidden" name="ExtraInfo" value="listall"><p>List all links (warning - large
  and possibly slow download!) <input type="submit" value="List All" name="B1">&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="WorkingLinks" value="ON" checked>Working Links
  Only</p>
</form>

<hr>

<p align="left"><a name="This page">This page </a>provides access to web pages and other
Internet resources related to philately and stamp collecting. It is unique in providing
the following advantages over other sites that provide philatelic web links:</p>
<div align="center"><center>

<table border="0" width="66%">
  <tr>
    <td width="10%" valign="top"><p align="right"><img src="IMAGES/bullet_small_blue.gif" width="17"
    height="17" alt="bullet_small_blue.gif (858 bytes)" align="middle"></td>
    <td width="90%">Over 1525 links and constantly growing!</td>
  </tr>
  <tr>
    <td width="10%" valign="top"><p align="right"><img src="IMAGES/bullet_small_blue.gif" width="17"
    height="17" alt="bullet_small_blue.gif (858 bytes)" align="middle"></td>
    <td width="90%">Essentially no duplicate links. Some other sites have the same
      page listed 4 or 5
    times.</td>
  </tr>
  <tr>
    <td width="10%" valign="top"><p align="right"><img src="IMAGES/bullet_small_blue.gif" width="17"
    height="17" alt="bullet_small_blue.gif (858 bytes)" align="middle"> </td>
    <td width="90%">A live, fully searchable database of links instead of static out-of-date
    lists.</td>
  </tr>
  <tr>
    <td width="10%" valign="top"><p align="right"><img src="IMAGES/bullet_small_blue.gif" width="17"
    height="17" alt="bullet_small_blue.gif (858 bytes)" align="middle"> </td>
    <td width="90%">The ability to view only new links.</td>
  </tr>
  <tr>
    <td width="10%" valign="top"><p align="right"><img src="IMAGES/bullet_small_blue.gif" width="17"
    height="17" alt="bullet_small_blue.gif (858 bytes)" align="middle"> </td>
    <td width="90%">Close to 100% working links thanks to regular removal of <a href="dead_links.htm">dead
    links</a>.</td>
  </tr>
</table>
</center></div>

<p align="center"><font color="#FF0000"><big>Bookmark this page for future reference!</big></font>
</p>

<table border="0" width="100%">
  <tr>
    <td width="50%"><p align="center"><a href="add_a_link.htm">SUBMIT YOUR LINK</a></td>
    <td width="50%"><p align="center"><a href="STAMPCOL.ASP">MAIN STAMP PAGE</a></td>
  </tr>
</table>

<hr>

</body>
</html>
