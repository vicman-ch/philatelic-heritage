<% 
Set myMail=CreateObject("CDO.Message") 
myMail.Subject="This Email sent from CDO code" 
myMail.From="info@artonstamps.org" 
myMail.To="info@artonstamps.org" 
myMail.TextBody="This Email sent from CDO code , hostdone.com team has test the codes and use test URL http://www.artonstamps.org/test-formtomail.asp to confirm the function" 
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
