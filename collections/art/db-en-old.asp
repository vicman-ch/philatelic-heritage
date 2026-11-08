<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="description" content="Feedback Form, to contact the author of the page Paintings and Arts on Stamps">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Download Databases - Art on Stamps</title>
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
	Subject="From AOS-DB-Download - " & trim(request.form("Subject"))
	
	Name=trim(request.form("Name"))
	Experience=trim(request.form("Experience"))
	UserURL=trim(request.form("UserURL"))
	Country=trim(request.form("Country"))
	Found_me=trim(request.form("Found_me"))
	ContactRequested=trim(request.form("ContactRequested"))
	UserLang=trim(request.form("UserLang"))
	Body=trim(request.form("Body"))
	    
	WholeInfo = "Name: " & Name & "¦ ¦" ' & vbCrLf does not work ???
	WholeInfo = WholeInfo & "Country: " & Country & vbnewline & "Experience: " & Experience & vbnewline  
	WholeInfo = WholeInfo & "User URL: " & UserURL & vbnewline & "Found me: : " & Found_me & vbnewline
	WholeInfo = WholeInfo & "Contact Requested: " & ContactRequested & vbnewline & "User Language: " & UserLang  & vbnewline & "Comment: " & Body
	
	Set objSendMail = CreateObject("CDO.Message") 
	
	objSendMail.From = Email
	objSendMail.To = "info@artonstamps.org"
	objSendMail.Subject = Subject
	objSendMail.HTMLBody = "<html><body><font face=arial size=2>"&WholeInfo&_
	"</font></body></html>"
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="mail.artonstamps.org"
	objSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
objSendMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 0
objSendMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = ""
objSendMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "" 
	objSendMail.Configuration.Fields.Update
	objSendMail.Send
	Set objSendMail=Nothing
	
	msg="ok"
end if
%><!--webbot bot="HTMLMarkup" endspan --><img border="0" src="Database/ttl-download-db.gif"></h1>

<%if msg="ok" then%>
<table border="0" width="100%" id="table39" cellpadding="0" style="border-collapse: collapse">
	<tr>
		<td>
        <p align="center"><font face="Arial" size="4" color="#000000">Your message has been 
		sent.  </font><font face="Arial" color="#FF0000" size="4"><br>
        <i>Thank You !!</i></font><i> </i>
        <blockquote>
    <p align="left"><strong style="font-weight: 400">
    <font face="Arial" color="#000080">To learn more about the different 
    databases that you can download below please click <i><a href="db-en.htm">
    here</a></i>.</font></strong><font face="Arial" color="#000080"><strong style="font-weight: 400"> </strong></font>
        <p align="left"><font face="Arial" color="#000080"> <strong style="font-weight: 400">Please 
          click the below button to download the database in EXCEL '97 format, 
          size 486 KB, version of May 2010. You will need EXCEL 97 or higher, 
          and a program to unzip the downloaded file (like WinZip):</strong></font></blockquote>

<p align="center"><font face="Arial"><a href="Database/Paint_xls.zip">
<img src="btn-down.gif" 
alt="Download the Database for FREE"></a></font></p>

<blockquote>

<p align="left"><font face="Arial" color="#000080">
<strong style="font-weight: 400">For more
information about the Excel database you can </strong></font><small>
<strong style="font-weight: 400">
<font face="Arial" size="3"><font color="#000080">contact the webmaster by e-mail, by
</font><i> <font color="#00FF00">
<a href="mailto:&#109;&#097;&#110;&#118;&#105;&#099;&#095;&#057;&#057;&#115;&#112;&#097;&#097;&#109;&#064;&#121;&#097;&#104;&#111;&#111;&#046;&#099;&#111;&#109;?subject=Information about AOS Excel DB requested">
<font color="#000080">clicking 
on this field</font></a></font></i></font></strong><font size="3" face="Arial" color="#000080"> (then eliminate the &quot;spaam&quot; from the 
e-mail address).</font></small></p>

    <hr>

        <p align="left"><strong style="font-weight: 400"><font face="Arial" color="#000080">Please 
          click on the button found below to download the database in ACCESS 2000 
          format (<span style="background-color: #FFFFFF">size: 4.4MB)</span>. 
          You will need <span style="background-color: #FFFFFF">ACCESS 2000</span> 
          (or higher) in order to run this program. If you have a slower connection, 
          I recommend you to wait till the Internet traffic is smaller in your 
          region.</font></strong><font face="Arial" color="#000080"><strong> Note: 
          this version of the program is quite old!</strong></font>
<p align="left">
<strong style="font-weight: 400">
<font face="Arial" color="#000080">Execute 
    the downloaded file. Read attentively the copyright notice. The program will 
    install in the &quot;/Program Files/Paintings and Art on Stamps&quot; directory and will 
    put an icon on your desktop. It will take about 14 MB of disk space. The 
    program doesn't change the Registry file. It has an uninstall facility, but 
    the whole new directory can be also deleted manually.</font></strong></blockquote>

<p align="center"><a href="Database/Pasicv2.exe">
<font color="#000080" face="Arial">
<img src="btn-down.gif" 
alt="Download the Database for FREE"></font></a></p>

<blockquote>

<p align="left"><font face="Arial" color="#000080">
<strong style="font-weight: 400">For more
information about&nbsp; the Access database you should </strong></font>
<font color="#000080"><strong style="font-weight: 400"><font face="Arial">contact 
by e-mail its developer, Jose Luis Nascimento from Portugal, by </font></strong></font>
<font face="Arial">
<font color="#000080">
clicking </font>
<i><font color="#00FF00">
<a href="mailto:&#106;&#108;&#110;&#097;&#115;&#099;&#105;&#109;&#101;&#110;&#116;&#111;&#115;&#112;&#097;&#097;&#109;&#064;&#121;&#097;&#104;&#111;&#111;&#046;&#099;&#111;&#109;?subject=From the AOS Site - Database">
<font color="#000080">here</font></a></font></i><font color="#000080"> (then 
eliminate the &quot;spaam&quot; from its&nbsp; e-mail address). </font> </font></p>

<p align="left"><font face="Arial" color="#000080">
This database permits to every PASIC member to easily update it. Because it is 
easy, and because it is useful for all AOS collectors, we ask our members to help Jose Luis to update even small portions of it, 
for instance those related to their countries. <br>
Thanks a lot in advance for your 
collaboration!</font></p>

<p align="left"><font color="#000080" face="Arial">
<strong style="font-weight: 400">Note: We run a&nbsp;
permanently updated version of the McAffee Security Center and for this reason all
files are virus free.</strong></font></p>

<hr><p align="left">
<strong style="font-weight: 400"><font face="Arial" color="#000080">The stamp 
collector Pieter Broekema from The Netherlands proposes you here a download of a 
PDF file (about 10 MB) that lists and displays all Rembrandt related stamps issued till 
the year 2011.</font></strong>
        <p align="center"><a href="Database/Pasicv2.exe"> <font color="#000080" face="Arial"> 
          </font> <font color="#000080" face="Arial"> <a href="Database/Database-Rembrandt.pdf"> 
          <img src="btn-down.gif" 
alt="Download the Database for FREE"></a></p>

<p align="left"><strong style="font-weight: 400">
<font face="Arial" color="#000080">You can reach him by e-mail by clicking <i>
<a href="mailto:&#112;&#046;&#098;&#114;&#111;&#101;&#107;&#101;&#109;&#097;&#115;&#112;&#097;&#097;&#109;&#064;&#103;&#109;&#097;&#105;&#108;&#046;&#099;&#111;&#109;?subject=From the AOS site">
here</a></i> (take out &quot;spaam&quot; from the address).</font></strong></p>

</blockquote>

        <p align="center"></td>


	</tr>
</table>
<%else%>
<blockquote>

<p><font color="#000080" face="Arial">Before downloading the databases, 
please tell me what you think about the Art on Stamps Web site. I welcome all of
your comments and suggestions. If you haven't visited this site yet, you can make a 
 
trip through it and then return to this page. <br>
You can also use this form  to apply for the &quot;Paintings and
Arts Stamps Internet Club&quot; (PASIC) membership.</font></p>

<p><font face="Arial"><!--webbot bot="HTMLMarkup" startspan --><form action="db-en.asp" method="POST">
  <!--webbot bot="HTMLMarkup" endspan -->
  <font face="Arial" color="#000080">What kind of comment would you like to send? 
  </font> 
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

<p><font face="Arial" color="#000080"><small><font size="3">If you are interested, tell me how to get in touch with you. Please fill-in
at least the&nbsp; fields: <i>Full Name</i> and <i>E-mail</i>. <br>
Please fill-in all&nbsp; fields marked with </font> <b><font size="3">*</font></b><font size="3"> if 
you apply for the PASIC membership (mention this in the Comments field too, 
please).</font></small></font></p>

<pre><font color="#000080"><em><strong>Full name    	*<!--webbot bot="Validation" s-display-name="Full Name" i-minimum-length="6" i-maximum-length="30" --><input type="text" size="35" name="Name" tabindex="10" maxlength="30"> Nom, prénom
E-mail      	*<input type="text" size="35" maxlength="256" name="Email" tabindex="11" value="From-AOS-DB-download@replace.com"></strong></em> <em><strong>E-mail</strong></em>
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
type="reset" value="Reset Form"> </p>
  <!--webbot bot="HTMLMarkup" endspan --></p>
  </form>
<div align="center"><center>

<%end if%>
 <hr color="#000080">

<table border="0" cellspacing="0" width="100%" cellpadding="0">
  <tr>
    <td valign="middle" rowspan="2"><strong><font face="Arial" color="#000000"><small><small>Revised: 
      05/02/2010.<br>
      Copyright © 1997 - 2011 by Victor Manta, Switzerland</small></small><small><small>.<br>
    All rights
      reserved worldwide.</small></small></font></strong></td>
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
<hr color="#000080">						

</body>
</html>