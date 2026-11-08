<%@ LANGUAGE="VBSCRIPT" %>
<% option explicit %>
<% Response.Buffer = True %>

<!--
'*********************************************************************** 
'                         COPYRIGHT NOTICE								 
'   Code Example  :Self Submitting "Contact Us" Form Using CDOSYS
'   Author     :   Christopher Williams of								 
'                  www.CJWSoft.com and www.PowerASP.com					 
'																		 
' You can use this code anywhere as long as this copyright notice		 
' remains with the code													 
'															 
'   (c) Copyright 2000 - 2008 by CJWSoft / PowerASP	 All rights reserved 
'
' If you like this code please check out some of our ASP Based Applications
' such as ASPProtect and ASPBanner..  www.aspprotect.com / www.aspbanner.com
'
'*********************************************************************** 
-->

<%
'Declaring Variables
Dim smtpserver,youremail,yourpassword,ContactUs_Name,ContactUs_Email
Dim ContactUs_Subject,ContactUs_Body,Action,IsError
	
' Edit these 2 values accordingly
smtpserver = "mail.artonstamps.org"
youremail = "info@artonstamps.org"
	
' Grabbing variables from the form post
ContactUs_Name = Request("ContactUs_Name")
ContactUs_Email = Request("ContactUs_Email")
ContactUs_Subject = Request("ContactUs_Subject")
ContactUs_Body = Request("ContactUs_Body")
Action = Request("Action")
	
' Used to check that the email entered is in a valid format
Function IsValidEmail(Email)
	Dim ValidFlag,BadFlag,atCount,atLoop,SpecialFlag,UserName,DomainName,atChr,tAry1
	ValidFlag = False
		If (Email <> "") And (InStr(1, Email, "@") > 0) And (InStr(1, Email, ".") > 0) Then
			atCount = 0
			SpecialFlag = False
			For atLoop = 1 To Len(Email)
			atChr = Mid(Email, atLoop, 1)
				If atChr = "@" Then atCount = atCount + 1
				If (atChr >= Chr(32)) And (atChr <= Chr(44)) Then SpecialFlag = True
				If (atChr = Chr(47)) Or (atChr = Chr(96)) Or (atChr >= Chr(123)) Then SpecialFlag = True
				If (atChr >= Chr(58)) And (atChr <= Chr(63)) Then SpecialFlag = True
				If (atChr >= Chr(91)) And (atChr <= Chr(94)) Then SpecialFlag = True
			Next
			If (atCount = 1) And (SpecialFlag = False) Then
				BadFlag = False
				tAry1 = Split(Email, "@")
				UserName = tAry1(0)
				DomainName = tAry1(1)
			If (UserName = "") Or (DomainName = "") Then BadFlag = True
			If Mid(DomainName, 1, 1) = "." then BadFlag = True
			If Mid(DomainName, Len(DomainName), 1) = "." then BadFlag = True
				ValidFlag = True
			End If
		End If
		If BadFlag = True Then ValidFlag = False
		IsValidEmail = ValidFlag
End Function
%>

<html>

<head>
<title>Contact Us Form ( Powered By www.CJWSoft.com )</title>
</head>

<body style="font-family: Arial; font-size: 12px">

<%
If Action = "SendEmail" Then
	
	' Here we quickly check/validate the information entered
	' These checks could easily be improved to look for more things
	If IsValidEmail(ContactUs_Email) = "False" Then
		IsError = "Yes"
		Response.Write("<font color=""red"">You did not enter a valid email address.</font><br>")
	End If
	
	If ContactUs_Name = "" Then
		IsError = "Yes"
		Response.Write("<font color=""red"">You did not enter a Name.</font><br>")
	End If
	
	If ContactUs_Subject = "" Then
	IsError = "Yes"
		Response.Write("<font color=""red"">You did not enter a Subject.</font><br>")
	End If
	
	If ContactUs_Body = "" Then
		IsError = "Yes"
		Response.Write("<font color=""red"">You did not enter a Body.</font><br>")
	End If
	
End If
	
' If there were no input errors and the action of the form is "SendEMail" we send the email off
If Action = "SendEmail" And IsError <> "Yes" Then
	
	Dim strBody
	
	' Here we create a nice looking html body for the email
	strBody = strBody & "<font face=""Arial"">Contact Us Form submitted at " & Now() &  vbCrLf & "<br><br>"
	strBody = strBody & "From http://" & Request.ServerVariables("HTTP_HOST") &  vbCrLf & "<br>"
	strBody = strBody & "IP " & Request.ServerVariables("REMOTE_ADDR") & vbCrLf & "<br>"
	strBody = strBody & "Name" & " : " & " " & Replace(ContactUs_Name,vbCr,"<br>") & "<br>"
	strBody = strBody & "Email" & " : " & " " & Replace(ContactUs_Email,vbCr,"<br>") & "<br>"
	strBody = strBody & "Subject" & " : " & " " & Replace(ContactUs_Subject,vbCr,"<br>") & "<br>"
	strBody = strBody & "<br>" & Replace(ContactUs_Body,vbCr,"<br>") & "<br>"
	strBody = strBody & "</font>"
	
	Dim ObjSendMail
	Set ObjSendMail = CreateObject("CDO.Message") 
     
	'This section provides the configuration information for the remote SMTP server.
     
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'Send the message using the network (SMTP over the network).
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = smtpserver
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
	'ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False 'Use SSL for the connection (True or False)
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
     
	'ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'basic (clear-text) authentication
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = youremail

     
	ObjSendMail.Configuration.Fields.Update
     
	'End remote SMTP server configuration section==
     
	ObjSendMail.To = youremail
	ObjSendMail.Subject = ContactUs_Subject
	ObjSendMail.From = ContactUs_Email
     
	' we are sending a html email.. simply switch the comments around to send a text email instead
	ObjSendMail.HTMLBody = strBody
	'ObjSendMail.TextBody = strBody
     
	ObjSendMail.Send
     
	Set ObjSendMail = Nothing 
	
' change the success messages below to say or do whatever you like
' you could do a response.redirect or offer a hyperlink somewhere.. etc etc
%>
<font size="2">Your message as seen below has been sent. Thank You !!
<br><br>
<font color="blue">
<% =Replace(ContactUs_Body,vbCr,"<br>") %>
</font>
</font>
<% Else %>

<form action="contact_us.asp" method="POST">
<input type="hidden" name="Action" value="SendEmail">
<font size="2">Contact Us:</font>
<br><br>
	<table border="0" cellspacing="1">
		<tr>
			<td valign="top">
				Name:
			</td>
			<td colspan="2">
				<input type="text" name="ContactUs_Name" size="35" value="<% =ContactUs_Name %>">
			</td>
		</tr>
		<tr>
			<td valign="top">
				Email:
			</td>
			<td colspan="2">
				<input type="text" name="ContactUs_Email" size="35" value="<% =ContactUs_Email %>">
			</td>
		</tr>
		<tr>
			<td valign="top">
				Subject:
			</td>
			<td colspan="2">
				<input type="text" name="ContactUs_Subject" value="<% =ContactUs_Subject %>" size="35">
			</td>
		</tr>
		<tr>
			<td valign="top">
				Message:
			</td>
			<td valign="top">
              <textarea rows="10" name="ContactUs_Body" cols="40"><% =ContactUs_Body %>
              </textarea>
</td>
		</tr>
		<tr>
			<td valign="top">&nbsp;
				
			</td>
			<td colspan="2">
				<input type="submit" value="Send Message">
			</td>
		</tr>
	</table>
</form>

<% End If %>



</body>

</html>
