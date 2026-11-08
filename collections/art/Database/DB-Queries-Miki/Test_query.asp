  <%@ lANGUAGE=JavaScript%>
  <!--#INCLUDE FILE="QCS_General.asp"-->
  <!--#INCLUDE FILE="QCS_DataGrid.asp"-->
  
  
  <%@Language=VBscript %>

<%Date_from = Request.QueryString("Date_begin")
Date_to   = Request.QueryString("Date_end")
Country   = Request.QueryString("Country")



%>
<%
<!--Set oRs = Server.CreateObject("ADODB.Recordset")
oRs.Open("Monthly_sender",Session("ITEM"),,,4)-->

<%Set oCmd=Server.CreateObject("ADODB.Command")
oCmd.ActiveConnection=("ITEM")
oCmd.CommandText="Monthly_sender"
oCmd.CommandType=4
Set oRs=oCmd.Execute("EVENTSTAT",Array(Date_from,Date_to,Country),4)

%>

<TABLE BORDER=1 COLS=<% = oRs.Fields.Count%> cellPadding=1 cellSpacing=1>
<TR> 
  <% For Each oField in oRs.Fields %>
  <TH> <% =oField.Name %> </TH> 
  <%Next%>
</TR>  
  
<%Do while Not oRS.EOF%>
     <TR> 
  <% For Each oField in oRs.Fields %>
       <TD ALIGN=CENTER>
         <% IF isNull(oField) Then
               Response.Write "&nbsp;"
            Else
               Response.Write oField.Value
            End if %>
       </TD>
  <% Next
      oRs.MoveNext %>
     </TR>
<%Loop %>
</TABLE>
<% oRs.Close
   Set oRs = Nothing %> 
      
                    

