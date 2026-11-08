<html>

<head>
<meta http-equiv="Description" content="Association of Philatelic Web Publishers">
<meta http-equiv="Keywords" content="stamps, Web Publishers, association,  philaty, philatelic, collectors, collecting, timbres, Briefmarken">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title></title>
<base target="Member's-Page">
</head>

<body bgproperties="fixed" link="#FFFFFF" vlink="#FF0000" alink="#FFFF00" topmargin="12" bgcolor="#FFF5D7">
<!-- PureASP.asp revised 07-01-98  -->

<p align="center"><img border="0" src="../ttl-pwo.gif"></p>

<p align="center"><b><font face="Arial" color="#000080" size="4">Our Members</font></b></p>
<div align="center">
  <center>
  <table width="100%" border="1" background="../../WorldMap.gif" bordercolorlight="#FFFFFF">
    <thead>
      <tr>
        <td align="center" ><b><font color="#FF0000">Member</font></b></td>
        <td align="center" ><b><font color="#FF0000">Country</font></b></td>
        <td align="center" ><b><font color="#FF0000">Language(s)</font></b></td>
        <td align="center" ><b><font color="#FF0000">Site's Name</font></b></td>
        <td align="center" ><b><font color="#FF0000">Link</font></b></td>
        <td align="center" ><font color="#FF0000"><b>Type</b></font></td>
      </tr>
    </thead>
    <tbody>
      <!--webbot bot="DatabaseRegionStart" startspan
      s-columnnames="Name,Type,URL,Author,Country,Lang,E-mail"
      s-columntypes="200,200,201,200,200,200,200" s-dataconnection="apwp"
      b-tableformat="TRUE" b-menuformat="FALSE" s-menuchoice="Name" s-menuvalue="Name"
      b-tableborder="TRUE" b-tableexpand="TRUE" b-tableheader="TRUE"
      b-listlabels="TRUE" b-listseparator="TRUE" i-ListFormat="0"
      b-makeform="TRUE" s-recordsource
      s-displaycolumns="Name,Type,URL,Author,Country,Lang,E-mail" s-criteria
      s-order s-sql="SELECT * FROM Members ORDER BY Author ASC"
      b-procedure="FALSE" clientside SuggestedExt="asp" s-DefaultFields
      s-NoRecordsFound="No records found that match your search criteria"
      i-MaxRecords="0" i-GroupSize="0" BOTID="0"
      u-dblib="../../_fpclass/fpdblib.inc"
      u-dbrgn1="../../_fpclass/fpdbrgn1.inc"
      u-dbrgn2="../../_fpclass/fpdbrgn2.inc" tag="TBODY"
      preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the start of a Database Results region. The page must be fetched from a web server with a web browser to display correctly; the current web is stored on your local disk or network.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;" b-WasTableFormat="TRUE" --><!--#include file="../../_fpclass/fpdblib.inc"-->
<% if 0 then %>
<SCRIPT Language="JavaScript">
document.write("<div style='background: yellow; color: black;'>The Database Results component on this page is unable to display database content. The page must have a filename ending in '.asp', and the web must be hosted on a server that supports Active Server Pages.</div>");
</SCRIPT>
<% end if %>
<%
fp_sQry="SELECT * FROM Members ORDER BY Author ASC"
fp_sDefault=""
fp_sNoRecords="<tr><td colspan=7 align=left width=""100%"">No records found that match your search criteria</td></tr>"
fp_sDataConn="apwp"
fp_iMaxRecords=0
fp_iCommandType=1
fp_iPageSize=0
fp_fTableFormat=True
fp_fMenuFormat=False
fp_sMenuChoice="Name"
fp_sMenuValue="Name"
fp_iDisplayCols=7
fp_fCustomQuery=True
BOTID=0
fp_iRegion=BOTID
%>
<!--#include file="../../_fpclass/fpdbrgn1.inc"-->
<!--webbot bot="DatabaseRegionStart" endspan -->
      <tr>
        <td align="center"><font color="#FFFFFF" face="Arial" size="2"><a href="mailto:<%=FP_FieldLink(fp_rs,"E-mail")%>">
        <!--webbot bot="DatabaseResultColumn" startspan
          s-columnnames="Name,Type,URL,Author,Country,Lang,E-mail"
          s-column="Author" b-tableformat="TRUE" b-hasHTML="TRUE" clientside
          preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Author&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_Field(fp_rs,"Author")%><!--webbot
          bot="DatabaseResultColumn" endspan -->
          </a>
          </font>
        </td>
        <td align="center"><font color="#FFFFFF" face="Arial" size="2">
        <!--webbot bot="DatabaseResultColumn" startspan
          s-columnnames="Name,Type,URL,Author,Country,Lang,E-mail"
          s-column="Country" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
          preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Country&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"Country")%><!--webbot
          bot="DatabaseResultColumn" endspan -->
          </font>
        </td>
        <td align="center"><font color="#FFFFFF" face="Arial" size="2">
        <!--webbot bot="DatabaseResultColumn" startspan
          s-columnnames="Name,Type,URL,Author,Country,Lang,E-mail"
          s-column="Lang" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
          preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Lang&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"Lang")%><!--webbot
          bot="DatabaseResultColumn" endspan -->
          </font>
        </td>
        <td align="center"><font color="#FFFFFF" face="Arial" size="2">
        <!--webbot bot="DatabaseResultColumn" startspan
          s-columnnames="Name,Type,URL,Author,Country,Lang,E-mail"
          s-column="Name" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
          preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Name&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"Name")%><!--webbot
          bot="DatabaseResultColumn" endspan -->
          </font>
        </td>
        <td align="center"><font color="#FFFFFF" face="Arial"><a href="<%=FP_FieldLink(fp_rs,"URL")%>"><i>URL</i></a></font>
        </td>
        <td align="center"><font color="#FFFFFF" face="Arial" size="2">
        <!--webbot bot="DatabaseResultColumn" startspan
          s-columnnames="Name,Type,URL,Author,Country,Lang,E-mail"
          s-column="Type" b-tableformat="TRUE" b-hasHTML="FALSE" clientside
          preview="&lt;font size=&quot;-1&quot;&gt;&amp;lt;&amp;lt;&lt;/font&gt;Type&lt;font size=&quot;-1&quot;&gt;&amp;gt;&amp;gt;&lt;/font&gt;" b-makelink b-MenuFormat --><%=FP_FieldVal(fp_rs,"Type")%><!--webbot
          bot="DatabaseResultColumn" endspan -->
          </font>
        </td>
      </tr>
      <!--webbot bot="DatabaseRegionEnd" startspan b-tableformat="TRUE"
      b-menuformat="FALSE" u-dbrgn2="../../_fpclass/fpdbrgn2.inc"
      i-groupsize="0" clientside tag="TBODY"
      preview="&lt;tr&gt;&lt;td colspan=64 bgcolor=&quot;#FFFF00&quot; align=&quot;left&quot; width=&quot;100%&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;This is the end of a Database Results region.&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;" --><!--#include file="../../_fpclass/fpdbrgn2.inc"-->
<!--webbot bot="DatabaseRegionEnd" endspan -->
    </tbody>
  </table>
  </center>
</div>

<table border="1" bordercolorlight="#800000" cellspacing="1" cellpadding="0" background="../../WorldMap.gif" width="100%">
  <tr>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif">&nbsp;</td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif">&nbsp;</td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif">&nbsp;</td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif"><p align="center"><font color="#00FF00"><em><strong>THESE PLACES </strong></em></font></td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif"><p align="center"><font color="#00FF00"><em><strong>ARE </strong></em></font></td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif"><p align="center"><font color="#00FF00"><em><strong>RESERVED</strong></em></font></td>
    <td align="center" bgcolor="#FFFF00" height="28" background="../../WorldMap.gif"><font color="#00FF00"><em><strong>FOR YOU !!!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></em></font></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><img src="../../anim_subscribe.gif" width="136" height="30"></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif">&nbsp;</td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><font color="#00FF00"><strong>Entrée libre!</strong></font></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif">&nbsp;<a href="../cgi-bin/apwp-db-update.asp" target="_blank"><font color="#FF0000" face="Arial"><strong><em>Hier klicken zum Beitreten</em></strong></font></a></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" valign="middle" background="../../WorldMap.gif"><font size="2">&nbsp;<strong><font color="#FF0000" face="Arial">Click
      <a href="../cgi-bin/apwp-db-update.asp"><i>
    here</i></a> to join us</font></strong></font></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><img src="../../anim_subscribe.gif" width="136" height="30"></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><font color="#00FF00">&nbsp;<strong>Free Entry!</strong></font></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><a href="../cgi-bin/apwp-db-update.asp" target="_blank"><font face="Arial"><strong><em>Cliquer
    ici pour s'inscrire</em></strong></font></a></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><font color="#00FF00"><strong>Keine Angebote!</strong></font></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif">&nbsp;</td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><img src="../../anim_subscribe.gif" width="136" height="30"></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><font color="#00FF00"><strong>NO commercial offers!</strong></font></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><font color="#00FF00"><strong>Eintritt ist kostenlos!</strong></font></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif">&nbsp;<font size="2">&nbsp;<strong><font color="#FF0000" face="Arial">Click
      <a href="../cgi-bin/apwp-db-update.asp"><i>
    here</i></a> to join us</font></strong></font></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif">&nbsp;<strong><font color="#FF0000"> </font><font color="#00FF00">NO Hidden Costs!</font></strong></td>
    <td align="center" bgcolor="#FFFF00" nowrap height="30" background="../../WorldMap.gif"><img src="../../anim_subscribe.gif" width="136" height="30"></td>
  </tr>
</table>

<p><strong><font color="#000080">Legal notice: This is a private list, owned by the
</font><font color="#FF0000">Philatelic Webmasters Organization</font><font color="#000080">
and&nbsp; legally copyrighted. It is strictly prohibited to copy or to distribute
it, as well as to send commercial offers to any PWO member!</font></strong></p>

<table border="0" cellspacing="0" width="100%" cellpadding="0">
  <tr>
    <td valign="middle"><strong><font face="Arial" size="1">Created Feb.
      2001. Revised:
    <!--webbot bot="TimeStamp" s-format="%m/%d/%y" s-type="EDITED" startspan -->10/14/01<!--webbot bot="TimeStamp" i-checksum="12405" endspan -->.&nbsp;<br>
 Copyright ©
      2001  by PWO and by Victor
      Manta, Switzerland.<br>
      The distribution of this list is strictly prohibited.<br>
      All rights reserved worldwide.</font></strong></td>
    <td rowspan="2"><p align="center"><a href="http://www.pwmo.org">
    <img border="0" src="../images/pwo-logo.gif"></a></td>
  </tr>
  <tr>
    <td valign="middle"><strong><font face="Arial" color="#FF0000" size="1">After
      having joined us, the members are permitted&nbsp; and are invited to use<br>
      the banner on the right and to link it to the PWO site: http://www.pwmo.org</font></strong></td>
  </tr>
</table>

</body>
</html>