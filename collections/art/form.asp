<%@ Language=VBScript %>

<%
if request.Form("Submit")="Send" then

	Name=trim(request.form("Name"))
	Email=trim(request.form("Email"))
	Subject=trim(request.form("Subject"))
	Body=trim(request.form("Body"))
	
	Set objSendMail = CreateObject("CDO.Message") 
	objSendMail.From = Email
	objSendMail.To = "info@artonstamps.org"
	objSendMail.Subject = Subject
	objSendMail.HTMLBody = "<html><body><font face=arial size=2>"&Body&_
	"</font></body></html>"
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="mail.artonstamps.org"
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25 
	objSendMail.Configuration.Fields.Update
	objSendMail.Send
	Set objSendMail=Nothing
	
	msg="ok"
end if
%>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">

<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Thank you for your feedback</title>
</head>

<body bgcolor="#EFEFEF">


<p align="center">
&nbsp;</p>


<p align="center">
<img src="ttl-feed.gif" alt="Feedback Form" width="256" height="49"></p>


<%if msg="ok" then%>
<table border="0" width="100%" id="table39" cellpadding="0" style="border-collapse: collapse">
	<tr>
		<td>
        <p align="center"><font face="Arial" size="4">Your message has been 
		sent.  </font><font face="Arial" color="#FF0000" size="4"><br>
        Thank You !!</font></td>
	</tr>
</table>
<%else%>
<table border="0" width="100%" id="table39" cellpadding="0" style="border-collapse: collapse">
	<tr>
		<td>
        <p align="center"><font color="#000080" face="Arial"><small><a name="Tell">
        <font size="3">Tell</font></a><font size="3"> me what you think about my Web site. I welcome all  your comments and suggestions.</font></small></font></p>
        <p align="center">
        <font face="Arial" color="#FF0000">
        <a name="Tell">If you wish that I contact you then please replace </a>
        the dummy e-mail address by your own one.</font></p>
        <p align="center">&nbsp;</td>
	</tr>
</table>

						<form method="POST" action="form.asp">

						<table border="0" width="100%" id="table38" cellpadding="2" style="border-collapse: collapse">
							<tr>
								<td width="170" bgcolor="#EFEFEF">
								<p align="right">
								<font face="Arial" color="#A938A9">
								<span style="font-weight: 700">
								<font size="2">Name</font></span><span style="font-size: 9pt; font-weight: 700">:</span></font></td>
								<td>
									<p>
									<input type="text" name="Name" size="47" style="font-family: arial; font-size: 8pt; border: 1px solid #A938A9"></p>

								</td>
							</tr>
							<tr>
								<td width="170" height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
								<td height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td width="170" bgcolor="#EFEFEF">
								<p align="right">
								<font face="Arial" color="#A938A9">
								<span style="font-weight: 700">
								<font size="2">E-mail Address:</font></span></font></td>
								<td>
								<input type="text" name="Email" size="47" style="font-family: Arial; font-size: 8pt; border: 1px solid #A938A9" value="eventually.replace@artonstamps.org"></td>
							</tr>
							<tr>
								<td width="170" height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
								<td height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td width="170" bgcolor="#EFEFEF">
								<p align="right">
								<font face="Arial" color="#A938A9" size="2">
								<span style="font-weight: 700">
								Subject:</span></font></td>
								<td>
								<input type="text" name="Subject" size="47" style="font-family: Arial; font-size: 8pt; border: 1px solid #A938A9" value="Feedback from the AOS Site"></td>
							</tr>
							<tr>
								<td width="170" height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
								<td height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td width="170" bgcolor="#EFEFEF" valign="top">
								<p align="right">
								<span style="font-weight: 700">
								<font size="2" face="Arial" color="#A938A9">Message</font></span><font face="Arial" color="#A938A9"><span style="font-weight: 700"><font size="2">:</font></span></font></td>
								<td>
								<textarea rows="10" name="Body" cols="60"></textarea></td>
							</tr>
							<tr>
								<td width="170" height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
								<td height="5">
								<img border="0" src="images/spacer.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td width="170">&nbsp;</td>
								<td>
									<p align="center">
									<input type="submit" value="Send" name="Submit" style="font-family: arial; font-size: 8pt; color: #A938A9; float:left"></p>
								</td>
							</tr>
						</table>
						</form>
<%end if%>						

</body>

</html>