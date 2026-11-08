<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>ID</title>
</head>

<body>

<table width="100%" border="1">
  <thead>
    <tr>
      <td><b>ID</b></td>
      <td><b>Category</b></td>
      <td><b>Name</b></td>
      <td><b>URL</b></td>
      <td><b>Description</b></td>
      <td><b>Link OK?</b></td>
      <td><b>Date</b></td>
      <td><b>AwardWinner</b></td>
      <td><b>DateExamined</b></td>
    </tr>
  </thead>
  <tbody>
    <!--webbot bot="DatabaseRegionStart" startspan
    s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
    s-columntypes="3,200,200,200,200,200,135,11,135" s-dataconnection="linksdb"
    b-tableformat="TRUE" b-menuformat="FALSE" s-menuchoice="ID" s-menuvalue="ID"
    b-tableborder="TRUE" b-tableexpand="TRUE" b-tableheader="TRUE"
    b-listlabels="TRUE" b-listseparator="TRUE" i-ListFormat="0"
    b-makeform="TRUE" s-recordsource="Links"
    s-displaycolumns="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
    s-criteria s-order s-sql="SELECT * FROM Links" b-procedure="FALSE"
    clientside SuggestedExt="asp" s-DefaultFields
    s-NoRecordsFound="No records returned." i-MaxRecords="256" i-GroupSize="20"
    BOTID="0" u-dblib="../_fpclass/fpdblib.inc"
    u-dbrgn1="../_fpclass/fpdbrgn1.inc" u-dbrgn2="../_fpclass/fpdbrgn2.inc"
    tag="TBODY"
    local_preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Database Results regions will not preview unless this page is fetched from a Web server with a web browser. The following table row will repeat once for every record returned by the query.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;"
    preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The region will not work unless the page has a file extension of &quot;.asp&quot;. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;"
    b-WasTableFormat="TRUE" --><!--#include file="../_fpclass/fpdblib.inc"-->
<%
fp_sQry="SELECT * FROM Links"
fp_sDefault=""
fp_sNoRecords="<tr><td colspan=9 align=left width=""100%"">No records returned.</td></tr>"
fp_sDataConn="linksdb"
fp_iMaxRecords=256
fp_iCommandType=1
fp_iPageSize=20
fp_fTableFormat=True
fp_fMenuFormat=False
fp_sMenuChoice="ID"
fp_sMenuValue="ID"
fp_iDisplayCols=9
fp_fCustomQuery=False
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" endspan -->
    <tr>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="ID" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;ID&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;ID&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"ID")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="Category" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Category&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Category&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"Category")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="Name" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"Name")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="URL" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;URL&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;URL&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"URL")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="Description" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Description&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Description&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"Description")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="Link OK?" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Link OK?&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Link OK?&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"Link OK?")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="Date" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Date&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Date&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"Date")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="AwardWinner" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;AwardWinner&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;AwardWinner&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"AwardWinner")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
      <td><!--webbot bot="DatabaseResultColumn" startspan
        s-columnnames="ID,Category,Name,URL,Description,Link OK?,Date,AwardWinner,DateExamined"
        s-column="DateExamined" b-tableformat="TRUE" b-hasHTML="FALSE"
        clientside
        local_preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;DateExamined&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;"
        preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;DateExamined&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" --><%=FP_FieldVal(fp_rs,"DateExamined")%><!--webbot
        bot="DatabaseResultColumn" endspan -->
      </td>
    </tr>
    <!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="TRUE"
    b-menuformat="FALSE" u-dbrgn2="../_fpclass/fpdbrgn2.inc" i-groupsize="20"
    clientside tag="TBODY"
    local_preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE COLSPAN=64&gt;&lt;FORM&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/20]&lt;/NOBR&gt;&lt;/FORM&gt;&lt;/td&gt;&lt;/tr&gt;"
    preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;TR&gt;&lt;TD ALIGN=LEFT VALIGN=MIDDLE COLSPAN=64&gt;&lt;NOBR&gt;&lt;INPUT TYPE=Button VALUE=&quot;  |&lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;   &lt;  &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;   &quot;&gt;&lt;INPUT TYPE=Button VALUE=&quot;  &gt;|  &quot;&gt;  [1/20]&lt;/NOBR&gt;&lt;BR&gt;&lt;/td&gt;&lt;/tr&gt;" --><!--#include file="../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" endspan -->
  </tbody>
</table>

</body>

</html>
