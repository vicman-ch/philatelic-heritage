<% 
    sch = "http://schemas.microsoft.com/cdo/configuration/" 
 
    Set cdoConfig = CreateObject("CDO.Configuration") 
 
    With cdoConfig.Fields 
        .Item(sch & "sendusing") = 2 ' cdoSendUsingPort 
        .Item(sch & "smtpserver") = "mail.artonstamps.org" 
        .update 
    End With 
 
    Set cdoMessage = CreateObject("CDO.Message") 
 
    With cdoMessage 
        Set .Configuration = cdoConfig 
        .From = "info@artonstamps.org" 
        .To = "info@artonstamps.org" 
        .Subject = "Sample CDO Message" 
        .TextBody = "This is a test for CDO.message" 
        .Send 
    End With 
 
    Set cdoMessage = Nothing 
    Set cdoConfig = Nothing 
%>