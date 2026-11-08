<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="description" content="Feedback Form, to contact the author of the page Paintings and Arts on Stamps">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Feedback Form - Art on Stamps</title>
<script LANGUAGE="JAVASCRIPT">
<!--

function FindIndexOfCheckedRadioButton(radioGroup){
	for (var i = 0; i < radioGroup.length; i++)
		if (radioGroup[i].checked)
			return i
	return 0
}

function ValidateInput(theForm)
{

	// validate user name
	var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz. -";
	var checkStr = theForm.UserName.value;
	var validOK = true;
	var At_found = false;
	var Period_found = false;
	if (checkStr == ""){
		alert("The Full Name field is empty. Please fill it in!");
		theForm.UserName.focus();
		return (false);
	}
	for (i = 0; i < checkStr.length; i++){
		var ch = checkStr.charAt(i);
		for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
			break;
		if (j == checkOK.length){
			validOK = false;
			break;
		}
	}	//for
	if (!validOK){
		alert("Not a valid Full Name. Please re-enter a valid one!");
		theForm.UserName.focus();
		return (false);
	}

	// validate e-mail address
	var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@.-_";
	var checkStr = theForm.UserEmail.value;
	var validOK = true;
	var At_found = false;
	var Period_found = false;
	var IndexOfAt; var IndexOfPeriod;
	if (checkStr == ""){
		alert("The E-mail field is empty. Please fill it in with a valid one!");
		theForm.UserEmail.focus();
		return (false);
	}
	for (i = 0; i < checkStr.length; i++){
		var ch = checkStr.charAt(i);
		if (ch == "@"){
			At_found = true	// @ found
			IndexOfAt = checkStr.indexOf("@")
		}
		if (ch == "."){
			Period_found = true	// . found
			IndexOfPeriod = checkStr.lastIndexOf(".")
		}
		for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
			break;
		if (j == checkOK.length){
			validOK = false;
			break;
		}
	}	//for
	if (!validOK || !At_found || !Period_found){
		alert("Not a valid e-mail address. Please re-enter a valid one!");
		theForm.UserEmail.focus();
		return (false);
	}
	if (((IndexOfPeriod - IndexOfAt) < 2) || ((checkStr.length - IndexOfPeriod) < 3)){
		alert("Not a valid e-mail address. Please re-enter a valid one!");
		theForm.UserEmail.focus();
		return (false);
	}

     // validate PASIC membership (Language and Country fields should be filled-in)
     i = FindIndexOfCheckedRadioButton(theForm.MessageType);
     if (theForm.MessageType[i].value == "Membership"){

	// validate Languages
	var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ,;/+";
	var checkStr = theForm.UserLang.value;
	var validOK = true;
	var At_found = false;
	var Period_found = false;
	if (checkStr == ""){
		alert("The Languages field is empty. Please fill it in!");
		theForm.UserLang.focus();
		return (false);
	}
	for (i = 0; i < checkStr.length; i++){
		var ch = checkStr.charAt(i);
		for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
			break;
		if (j == checkOK.length){
			validOK = false;
			break;
		}
	}	//for
	if (!validOK){
		alert("Not valid Languages. Please re-enter valid ones!");
		theForm.UserLang.focus();
		return (false);
	}

	// validate Country
	var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ";
	var checkStr = theForm.Country.value;
	var validOK = true;
	var At_found = false;
	var Period_found = false;
	if (checkStr == ""){
		alert("The Country field is empty. Please fill it in!");
		theForm.Country.focus();
		return (false);
	}
	for (i = 0; i < checkStr.length; i++){
		var ch = checkStr.charAt(i);
		for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
			break;
		if (j == checkOK.length){
			validOK = false;
			break;
		}
	}	//for
	if (!validOK){
		alert("Not a valid Country. Please re-enter a valid one!");
		theForm.Country.focus();
		return (false);
	}	
     }		// if (theForm...)
}

//--> </script>
</head>

<body bgcolor="#FFFFFF" text="#0000FF" link="#FF0000" alink="#008000" bgproperties="fixed">


<h1 align="center"><!--webbot bot="HTMLMarkup" startspan --><%@ Language=VBScript %>

<%
if request.Form("Submit")="Submit Feedback" then

	Email=trim(request.form("Email"))
	Subject="Feedback from the AOS Site + " & trim(request.form("Subject"))
	
	Name=trim(request.form("Name"))
	Experience=trim(request.form("Experience"))
	UserURL=trim(request.form("UserURL"))
	Country=trim(request.form("Country"))
	Found_me=trim(request.form("Found_me"))
	ContactRequested=trim(request.form("ContactRequested"))
	UserLang=trim(request.form("UserLang"))
	Body=trim(request.form("Body"))
	    
	WholeInfo = "Name: " & Name & "¦ ¦" ' & vbCrLf does not work ???
	WholeInfo = WholeInfo & "Country: " & Country & "¦ ¦" & "Experience: " & Experience & "¦ ¦"  
	WholeInfo = WholeInfo & "User URL: " & UserURL & "¦ ¦" & "Found me: : " & Found_me & "¦ ¦"
	WholeInfo = WholeInfo & "Contact Requested: " & ContactRequested & "¦ ¦" & "User Language: " & UserLang  & "¦ ¦" & "Comment: " & Body
	
	Set objSendMail = CreateObject("CDO.Message") 
	
	'With objSendMail 'not work
       'Delete the PR_RTF_COMPRESSED property so that
       'RTF synchronization does not take place.
       '.Fields(CdoPR_RTF_COMPRESSED).Delete
       '.HTMLBody = .HTMLBody & WholeInfo
       '.Update
    'End With
	
	objSendMail.From = Email
	objSendMail.To = "info@artonstamps.org"
	objSendMail.Subject = Subject
	objSendMail.HTMLBody = "<html><body><font face=arial size=2>"&WholeInfo&_
	"</font></body></html>"
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="mail.artonstamps.org"
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25 
	objSendMail.Configuration.Fields.Update
	objSendMail.Send
	Set objSendMail=Nothing
	
	msg="ok"
end if
%><!--webbot bot="HTMLMarkup" endspan --></h1>


<h1 align="center"><img src="ttl-feed.gif" alt="Feedback Form" width="256" height="49"></h1>

<%if msg="ok" then%>
<table border="0" width="100%" id="table39" cellpadding="0" style="border-collapse: collapse">
	<tr>
		<td>
        <p align="center"><font face="Arial" size="4" color="#84395C">Your message has been 
		sent.  </font><font face="Arial" color="#FF0000" size="4"><br>
        </font><i><font face="Arial" color="#F16051" size="4">Thank You !!</font></i></td>
	</tr>
</table>
<%else%>
<blockquote>

<p><font color="#000080" face="Arial">Tell me what you think about my Web site. I welcome all of
your comments and suggestions. <br>
&nbsp;You can also use this form  to apply for the &quot;Paintings and
Arts Stamps Internet Club&quot; (PASIC) membership.</font></p>

<p><font face="Arial"><!--webbot bot="HTMLMarkup" startspan --><form action="feedback.asp" method="POST"><!--webbot bot="HTMLMarkup" endspan --></font><font face="Arial" color="#000080">What kind of comment would you like to send? </font>

<dl>
  <dd><p align="left"><small><font size="3" face="Arial" color="#000080">
  <input type="radio" name="Subject" value="Complaint" tabindex="1">Complaint 
  <input type="radio" name="Subject" value="Problem" tabindex="2">Problem 
  <input type="radio" name="Subject" value="Suggestion" tabindex="3">Suggestion 
  <input type="radio" name="Subject" value="Praise" tabindex="4" checked>Praise 
  <input type="radio" name="Subject" value="Membership" tabindex="5">Club Membership</font></small></p>
  </dd>
</dl>

<p><font face="Arial" color="#000080">Enter your comments in the field&nbsp; provided below: </font></p>


      <p align="center"><em><font color="#000080">
      <textarea name="Body" rows="6" cols="53" tabindex="6"></textarea></font></em></p>

<p><font face="Arial" color="#000080">Philatelic experience</font></p>

<p><small><font face="Arial" color="#000080"><font size="3"><input type="radio" name="Experience" value="Newcomer" tabindex="7"></font><em><font size="3"> Newcomer <input type="radio" checked name="Experience" value="Experienced" tabindex="8"> Experienced <input type="radio" name="Experience" value="Advanced" tabindex="9"> Advanced</font></em></font></small></p>

<p><font face="Arial" color="#000080">If Interested, tell me how to get in touch with you. Please fill-in
at least the&nbsp; fields: <i>Full Name</i> and <i>E-mail</i>.</font></p>

<p><font face="Arial" color="#000080">Please fill-in all&nbsp; fields marked with * if you apply for the PASIC membership 
(mention this in the Comments field too, please) or if you wish to get an answer.</font></p>

<pre><font color="#000080"><em><strong>Full name    	*<!--webbot bot="Validation" s-display-name="Full Name" i-minimum-length="6" i-maximum-length="30" --><input type="text" size="35" name="Name" tabindex="10" maxlength="30"> Nom, prénom
E-mail      	*<input type="text" size="35" maxlength="256" name="Email" tabindex="11" value="eventually.replace@noone.com"></strong></em> <em><strong>E-mail</strong></em>
<em><strong>URL	 	 <input type="text" size="35" maxlength="256" name="UserURL" tabindex="12"></strong></em> <em><strong>URL</strong></em>
<em><strong>Languages   	*<input type="text" size="35" maxlength="256" name="UserLang" tabindex="13"> Langues</strong></em></font></pre>
<div align="left">

<pre><em><strong><font color="#000080">Country     	*<input type="text" size="35" maxlength="256" name="Country" tabindex="14"> Pays</font></strong></em></pre>
</div>

<pre><em><strong><font color="#000080">Where have you 	 <input type="text" size="35" maxlength="256" name="Found_me" tabindex="15"> Trouvé ou?
found my site? </font></strong></em></pre>

  <blockquote>
    <blockquote>

<dl>
  <dd><p align="left"><em><font color="#000080"><strong><input type="checkbox" name="ContactRequested" value="ContactRequested" tabindex="16"> 
    </strong> <font face="Arial"><small>Please contact me as
    soon as possible regarding this matter</small><br>
    <small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contactez-moi aussi vite que possible, s.v.p.</small></font></font></em></p>
  </dd>
</dl>

    </blockquote>
  </blockquote>

<p><!--webbot bot="HTMLMarkup" startspan --><p><input type="submit" name="Submit" value="Submit Feedback"> <input
type="reset" value="Reset Form"> </p><!--webbot bot="HTMLMarkup" endspan --></p>
</blockquote>
</form>
<%end if%> <hr>
<div align="center"><center>

<table border="0" cellspacing="0" width="100%" cellpadding="0">
  <tr>
    <td valign="middle" rowspan="2"><strong><font face="Arial" color="#000000"><small><small>Revised:
    <!--webbot bot="TimeStamp" s-format="%m/%d/%y" s-type="EDITED" startspan -->12/31/05<!--webbot bot="TimeStamp" i-checksum="12889" endspan -->.<br>
    Copyright © 1997 - 2006 by Victor Manta, Switzerland</small></small><small><small>.<br>
    All rights
      reserved in all countries</small></small><small><small>.</small></small></font></strong></td>
    <td valign="middle" align="right" rowspan="2">
      <p align="center"><a href="index.html" target="_blank">
      <img src="vmbanner1.gif" alt="Site's Banner" align="center" vspace="3" width="400" height="40"><br>
      </a><strong><font face="Arial" color="#000000"><small><small>Click the
      banner to visit the site</small></small></font></strong></p>
    </td>
    <td valign="middle" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" align="right">&nbsp;</td>
  </tr>
</table>
<hr>						

</body>
</html>