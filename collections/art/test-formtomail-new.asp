<% 
Set myMail=CreateObject("CDO.Message") 
myMail.Subject="This Email sent from CDO code" 
myMail.From="info@artonstamps.org" 
myMail.To="info@artonstamps.org" 
'myMail.TextBody="This Email sent from CDO code , hostdone.com team has test the codes and use test URL http://www.artonstamps.org/test-formtomail.asp to confirm the function" 

myMail.TextBody="Name: " & Request.Form("famname") & vbnewline & "E-Mail Address: " & Request.Form("emladdress") & vbnewline & "Message: " & Request.Form("message")

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

<html>
<head>
<title>Contact Us</title>
</head>
<body>
<form method="POST" action="">
<p>
Name: <input type="text" name="famname" size="20"><br>
E-mail Address: <input type="text" name="emladdress" size="20"><br>
Message: <input type="text" name="message" size="80">
</p>
<p>
<input type="submit" value="Submit" name="submit">
<input type="reset" value="Reset" name="reset">
</p>
</form>
</body>
</html>
