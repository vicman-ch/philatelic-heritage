  <%@Language=VBscript %>

<%Date_from = Request.QueryString("Date_from")
Date_to   = Request.QueryString("Date_to")
Country   = Request.QueryString("Country_cd")



%>

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
               
               if oField.Name="Receiver" Then %>
  <A HREF="Test_query.asp?Country=<%= oField.Value%>&Date_begin=<%=Date_from%>&Date_end=<%=Date_to%>">
  <%Response.Write oField.Value%></A>
               <%else
               Response.Write oField.Value
               end if
            
            End if %>
       </TD>
  <% Next
      oRs.MoveNext %>
     </TR>
<%Loop %>
</TABLE>
<% oRs.Close
   Set oRs = Nothing %> 
      
                    

