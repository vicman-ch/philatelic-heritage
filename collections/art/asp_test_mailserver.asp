<% 
Set myMail=CreateObject("CDO.Message") 
myMail.Subject="Test ArtOnStamps" 
myMail.From="info@artonstamps.org" 
myMail.To="info@artonstamps.org" 
myMail.TextBody="This is a message body" 
myMail.Configuration.Fields.Item _ 
("http://schemas.microsoft.com/cdo/configuration/sendusing")=2 
'Name or IP of remote SMTP server 
myMail.Configuration.Fields.Item _ 
("http://schemas.microsoft.com/cdo/configuration/smtpserver") _ 
="mail.artonstamps.org" 
'Server port 
myMail.Configuration.Fields.Item _ 
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") _ 
=25 
myMail.Configuration.Fields.Update 
myMail.Send 
set myMail=nothing
%> 