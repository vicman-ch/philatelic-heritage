<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Search Through PWO Members</title>
</head>

<body>

<form BOTID="0" METHOD="POST" ACTION="search-members.asp">
  <p>&nbsp;</p>
  <table BORDER="0" width="629">
    <tr>
      <td width="429" align="center"><b>Enter the Country</b></td>
      <td width="190" align="center">
      <input TYPE="TEXT" NAME="Country" VALUE="<%=Request("Country")%>" size="20"></td>
    </tr>
    <tr>
      <td width="429" align="center"><b>or Enter Member's Full Name<br>
      </b>(as<span lang="de-ch">:</span> LASTNAME<span lang="de-ch">,</span> 
      Firstname<span lang="de-ch">)</span></td>
      <td width="190" align="center">
      <input TYPE="TEXT" NAME="Author" VALUE="<%=Request("Author")%>" size="20"></td>
    </tr>
  </table>
  <p><br>
  <input TYPE="Submit"><input TYPE="Reset"><!--webbot bot="SaveAsASP" clientside suggestedext="asp" preview=" " startspan --><!--webbot bot="SaveAsASP" endspan --></p>
  <p>&nbsp;</p>
</form>
<table width="100%" border="1">
  <thead>
    <tr>
      <td align="center"><font color="#FF0000"><b>Author</b></font></td>
      <td align="center"><font color="#FF0000"><b>Country</b></font></td>
      <td align="center"><font color="#FF0000"><b>Lang</b></font></td>
      <td align="center"><font color="#FF0000"><b>Name</b></font></td>
      <td align="center"><font color="#FF0000"><b>Type</b></font></td>
    </tr>
  </thead>
  <tbody>
    <!--webbot bot="DatabaseRegionStart" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-columntypes="200,200,200,200,200,201,200" s-dataconnection="pwo-members" b-tableformat="TRUE" b-menuformat="FALSE" s-menuchoice="Author" s-menuvalue="Author" b-tableborder="TRUE" b-tableexpand="TRUE" b-tableheader="TRUE" b-listlabels="TRUE" b-listseparator="TRUE" i-listformat="0" b-makeform="TRUE" s-recordsource="Members" s-displaycolumns="Author,Country,Lang,E-mail,Name,URL,Type" s-criteria="[Country] EQ {Country} | [Author] EQ {Author} +" s-order s-sql="SELECT * FROM Members WHERE (Country =  '::Country::' OR Author =  '::Author::')" b-procedure="FALSE" clientside suggestedext="asp" s-defaultfields="Country=U.S.A.&amp;amp;Author=MANTA, Victor" s-norecordsfound="No records match your criteria" i-maxrecords="256" i-groupsize="10" botid="0" u-dblib="../_fpclass/fpdblib.inc" u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc" tag="TBODY" preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;" b-WasTableFormat="TRUE" startspan --><!--#include file="../_fpclass/fpdblib.inc"-->
<% if 0 then %>
<SCRIPT Language="JavaScript">
document.write("<div style='background: yellow; color: black;'>The Database Results component on this page is unable to display database content. The page must have a filename ending in '.asp', and the web must be hosted on a server that supports Active Server Pages.</div>");
</SCRIPT>
<% end if %>
<%
fp_sQry="SELECT * FROM Members WHERE (Country =  '::Country::' OR Author =  '::Author::')"
fp_sDefault="Country=U.S.A.&Author=MANTA, Victor"
fp_sNoRecords="<tr><td colspan=7 align=left width=""100%"">No records match your criteria</td></tr>"
fp_sDataConn="pwo-members"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=10
fp_fTableFormat=True
fp_fMenuFormat=False
fp_sMenuChoice="Author"
fp_sMenuValue="Author"
fp_iDisplayCols=7
fp_fCustomQuery=False
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" endspan --><tr>
      <td align="center">
      <a href="mailto:<%=FP_FieldLink(fp_rs,"E-mail")%>">
      <font size="2" color="#000080">
      <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Author" b-tableformat="TRUE" b-hashtml="TRUE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Author&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_Field(fp_rs,"Author")%><!--webbot bot="DatabaseResultColumn" endspan --></font></a></td>
      <td align="center">
      <font size="2" color="#000080">
      <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Country" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Country&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Country")%><!--webbot bot="DatabaseResultColumn" endspan --></font></td>
      <td align="center">
      <font size="2" color="#000080">
      <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Lang" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Lang&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Lang")%><!--webbot bot="DatabaseResultColumn" endspan --></font></td>
      <td align="center">
      <a href="<%=FP_FieldLink(fp_rs,"URL")%>"><font size="2" color="#000080">
      <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Name" b-tableformat="TRUE" b-hashtml="TRUE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_Field(fp_rs,"Name")%><!--webbot bot="DatabaseResultColumn" endspan --></font></a></td>
      <td align="center">
      <font size="2" color="#000080">
      <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Type" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Type&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Type")%><!--webbot bot="DatabaseResultColumn" endspan --></font></td>
    </tr>
    <!--webbot bot="DatabaseRegionEnd" b-tableformat="TRUE" b-menuformat="FALSE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="10" clientside tag="TBODY" preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE COLSPAN=64&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/10]&lt;/NOBR&gt;&lt;BR&gt;&lt;/td&gt;&lt;/tr&gt;" startspan --><!--#include file="../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" endspan --></tbody>
</table>

</body>

</html>