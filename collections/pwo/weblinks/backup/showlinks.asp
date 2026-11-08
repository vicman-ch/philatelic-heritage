<%@ Language=VBScript %>
<html>

<head>
<title>Stamp Web Database Results Page</title>
<link rel="stylesheet" href="basic1.css" type="text/css">
</head>

<body>
<%
' Open the database
Dim cs, rs
' Open the links database.
cs = "Provider=Microsoft.Jet.OLEDB.4.0;"
cs = cs & "Persist Security Info=False;"
cs = cs & "Data Source="
cs = cs & server.mappath("databases/Stamplinks.mdb") & ";"
set ldb = server.createobject("adodb.connection")
ldb.open cs
' Get the request sent. 
cat = Request.Form("key")
frm = Request.Form("ExtraInfo")
zz =  Request.Form("dys")
working = Request.Form("WorkingLinks")  
if frm = "bycategory" then
  if working = "ON" then
    cmd = "Select * from WorkingLinks where Category='" 
    cmd = cmd & cat & "' order by Name"
    title = "All working links in the " & cat & " category"
  else
    cmd = "Select * from Links where Category='" 
    cmd = cmd & cat & "' order by Name"
    title = "All links in the " & cat & " category"
  end if
elseif frm="listall" then
  if working = "ON" then
   cmd = "Select Category, Name, Date, URL, Description, AwardWinner from WorkingLinks "
   cmd = cmd & "order by Name"
   title = "All working links"
  else
   cmd = "Select Category, Name, Date, URL, Description, [Link OK?], AwardWinner from Links "
   cmd = cmd & " order by Name"
   title = "All links"
  end if
elseif frm = "newonly" then
  if working = "ON" then
    cmd = "Select Category, Name, Date, URL, Description, AwardWinner from WorkingLinks "
    cmd = cmd & "where Date()-Date < " & zz & " order by Name"
    title = "Working links added in the past " & zz & " days"
  else
    cmd = "Select Category, Name, Date, URL, Description, [Link OK?], AwardWinner from Links "
    cmd = cmd & "where Date()-Date < " & zz & " order by Name"
    title = "Links added in the past " & zz & " days"
  end if
elseif frm = "srchtitles" then
  if working = "ON" then
    cmd = "Select Name, URL, Date, Description, AwardWinner from WorkingLinks "
    cmd = cmd & "where instr(name,'"& cat & "') > 0 "
    cmd = cmd &  "order by Name"
    title = "Working links where Title contains " & chr(34) & cat & chr(34) 
  else
    cmd = "Select Name, URL, Date, Description, [Link OK?], AwardWinner from Links "
      cmd = cmd & "where instr(name,'"& cat & "') > 0 "
      cmd = cmd &  " order by Name"
    title = "Links where Title contains " & chr(34) & cat & chr(34) 
  end if
elseif frm = "srchurls" then
  if working = "ON" then
    cmd = "Select Name, URL, Date, Description, AwardWinner from WorkingLinks "
    cmd = cmd & "where instr(URL,'"& cat & "') > 0 "
    cmd = cmd & "order by Name"
    title = "Working links where the URL contains " & chr(34) & cat & chr(34) 
  else
    cmd = "Select Name, URL, Date, Description, [Link OK?], AwardWinner from Links "
    cmd = cmd & "where instr(URL,'"& cat & "') > 0 "
    cmd = cmd & " order by Name"
    title = "Links where the URL contains " & chr(34) & cat & chr(34) 
  end if
elseif frm = "srchtitlesanddesc" then
  if working = "ON" then
    cmd = "Select Name, URL, Date, Description, AwardWinner from WorkingLinks "
    cmd = cmd & "where (instr(name,'"& cat & "') > 0 or "
    cmd = cmd & "instr(description,'"& cat & "') > 0) "
    cmd = cmd & "order by Name"
    title = "Working links where the Title or Description contains " & chr(34) & cat & chr(34) 
  else
    cmd = "Select Name, URL, Date, Description, [Link OK?], AwardWinner from Links "
    cmd = cmd & "where (instr(name,'"& cat & "') > 0 or "
    cmd = cmd & "instr(description,'"& cat & "') > 0) "
    cmd = cmd & " order by Name"
    title = "Links where the Title or Description contains " & chr(34) & cat & chr(34) 
  end if
end if %>

<h2 align="center"><img src="IMAGES/stamps/links_page_title.gif" width="582" height="78"
alt="links_page_title.gif (3531 bytes)"></h2>

<hr>
<% 
xxx = ""
if frm <> "newonly" then
    xxx = "<p><img src='IMAGES/NEW.GIF' width=28 height=11 alt='NEW.GIF (111 bytes)'>"
    xxx = xxx & " Links added in the past 45 days.</p>"
end if %>
<%= xxx %>

<p>The <img src="IMAGES/AWARD_SMALL.GIF" width="66" height="15" alt="AWARD"> icon
indicates a winner of the <a href="stampsiteaward.asp"><img src="IMAGES/sssaward.gif"
width="80" height="120" alt="sssaward.gif (1709 bytes)" align="middle"></a></p>

<p>Click the browser's Back button to return from here to the links search page.</p>

<hr>
<% set rs = ldb.execute(cmd)
if rs.bof and rs.eof then %>

<p>Your search for <i><%=title%></i> returned no records. Click <a href="LINKS.ASP">here</a> to
return to the search page and try again. <% else
'rs.movefirst
dim temp()
count = 0
do while not rs.eof 
count = count + 1
redim preserve temp(count)
xxx = ""
if frm <> "newonly" then
    if (date() - rs("Date").value) < 45 then
        xxx = "<img src='IMAGES/NEW.GIF' width=28 height=11 alt='NEW.GIF (111 bytes)'>"
   end if
end if
 temp(count)= xxx & "<a href='" & rs("URL").value & "'>" & rs("name").value & "</a> "
if working <> "ON" then
   if rs("Link OK?").Value <> "OK" then
     temp(count) = temp(count) & " <font color='#FF0000'>[Dead link]</font> "
   end if
end if
temp(count) = temp(count) & rs("description").value
temp(count) = trim(temp(count))
' Be sure there's a period if punctuation not already present.
if rs("description").value <> "" then
   if right(temp(count),1) <> "." and right(temp(count),1) <> "!" and right(temp(count),1) <> Chr(34) then temp(count) = temp(count) & "."
end if
if rs("AwardWinner").value then
    temp(count) = temp(count) & " <img src='IMAGES/AWARD_SMALL.GIF' width=66 height=15 alt='AWARD'>"
end if
temp(count) = temp(count) & "<br>" & vbcrlf
rs.movenext
loop %> Your search for links: <i><%=title%> </i>returned <%= count %>
records.</p>

<p><% for i = 1 to count %> <%= temp(i) %> <% next %> </p>

<hr>
<% end if 
ldb.close
set ldb=nothing
set rs=nothing %>
</body>
</html>
