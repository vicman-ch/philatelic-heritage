

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Members -- View</title>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>

<body bgcolor="#FFFFFF">

<table width="100%" align=left>
  <tr>
    <td width="50%">
	  <b><font size=+3 color="#000080"> Results Page </font></b>
	</td>
    <td width="50%" align=right>
      <table>
        <tr>
          <td>
		Results Page
| <a href="submission_form.asp" target="_top">Submission Form</a>

          </td>
        </tr>
      </table>
	</td>
  </tr>
</table>


<p>
<br clear="all">
<hr>
<p>

<table width="100%" border="1">
  <thead>
    <tr>
      <td><b>Author</b></td>
      <td><b>Country</b></td>
      <td><b>Lang</b></td>
      <td><b>E-mail</b></td>
      <td><b>Name</b></td>
      <td><b>URL</b></td>
      <td><b>Type</b></td>

   </tr>
  </thead>

  <tbody>

  <!--webbot bot="DatabaseRegionStart" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-columntypes="200,200,200,200,200,201,200" s-dataconnection="pwo-members" b-tableformat="TRUE" b-menuformat="FALSE" s-menuchoice s-menuvalue b-tableborder="TRUE" b-tableexpand="TRUE" b-tableheader="TRUE" b-listlabels="TRUE" b-listseparator="TRUE" i-listformat="0" b-makeform="TRUE" s-recordsource="Members" s-displaycolumns="Author,Country,Lang,E-mail,Name,URL,Type" s-criteria s-order s-sql="SELECT * FROM Members" b-procedure="FALSE" clientside suggestedext="asp" s-defaultfields s-norecordsfound="No records returned." i-maxrecords="256" i-groupsize="5" botid="0" u-dblib="../_fpclass/fpdblib.inc" u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc" tag="TBODY" startspan preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;" --><!--#include file="../_fpclass/fpdblib.inc"-->
<% if 0 then %>
<SCRIPT Language="JavaScript">
document.write("<div style='background: yellow; color: black;'>The Database Results component on this page is unable to display database content. The page must have a filename ending in '.asp', and the web must be hosted on a server that supports Active Server Pages.</div>");
</SCRIPT>
<% end if %>
<%
fp_sQry="SELECT * FROM Members"
fp_sDefault=""
fp_sNoRecords="<tr><td colspan=7 align=left width=""100%"">No records returned.</td></tr>"
fp_sDataConn="pwo-members"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=5
fp_fTableFormat=True
fp_fMenuFormat=False
fp_sMenuChoice=""
fp_sMenuValue=""
fp_iDisplayCols=7
fp_fCustomQuery=False
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" endspan -->

  <tr>

    <td>
    <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Author" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Author&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Author")%><!--webbot bot="DatabaseResultColumn" endspan -->
    </td>
    <td>
    <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Country" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Country&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Country")%><!--webbot bot="DatabaseResultColumn" endspan -->
    </td>
    <td>
    <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Lang" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Lang&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Lang")%><!--webbot bot="DatabaseResultColumn" endspan -->
    </td>
    <td>
    <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="E-mail" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;E-mail&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"E-mail")%><!--webbot bot="DatabaseResultColumn" endspan -->
    </td>
    <td>
    <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Name" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Name")%><!--webbot bot="DatabaseResultColumn" endspan -->
    </td>
    <td>
    <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="URL" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;URL&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"URL")%><!--webbot bot="DatabaseResultColumn" endspan -->
    </td>
    <td>
    <!--webbot bot="DatabaseResultColumn" s-columnnames="Author,Country,Lang,E-mail,Name,URL,Type" s-column="Type" b-tableformat="TRUE" b-hashtml="FALSE" b-makelink="FALSE" clientside b-MenuFormat preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Type&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" startspan --><%=FP_FieldVal(fp_rs,"Type")%><!--webbot bot="DatabaseResultColumn" endspan -->
    </td>


  </tr>
  <!--webbot bot="DatabaseRegionEnd" b-tableformat="TRUE" b-menuformat="FALSE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="5" clientside tag="TBODY" startspan preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE COLSPAN=64&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/5]&lt;/NOBR&gt;&lt;BR&gt;&lt;/td&gt;&lt;/tr&gt;" --><!--#include file="../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" endspan -->
  </tbody>

</table>


</body>

</html>