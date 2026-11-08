<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit
Response.CodePage = 65001
Response.Charset = "utf-8"
Response.Buffer = True
Dim sent, errorMessage, nm, em, subj, msg, bot, startTime, objMail, cfg, f, re, valid
sent=False : errorMessage="" : nm="" : em="" : subj="" : msg=""
Function SafeText(v)
 SafeText=Server.HTMLEncode(CStr(v))
End Function
Function CleanHeader(v)
 CleanHeader=Replace(Replace(Trim(CStr(v)),vbCr,""),vbLf,"")
End Function
If Request.ServerVariables("REQUEST_METHOD")="POST" Then
 nm=Trim(Left(Request.Form("name"),120))
 em=CleanHeader(Left(Request.Form("email"),200))
 subj=CleanHeader(Left(Request.Form("subject"),180))
 msg=Trim(Left(Request.Form("message"),8000))
 bot=Trim(Request.Form("website"))
 Set re=New RegExp
 re.Pattern="^[^@\s<>]+@[^@\s<>]+\.[A-Za-z]{2,}$"
 re.IgnoreCase=True
 valid=(Len(nm)>0 And Len(em)>0 And Len(subj)>0 And Len(msg)>0 And re.Test(em) And Len(bot)=0)
 If Not valid Then
  errorMessage="Please complete all fields with a valid email address."
 Else
  On Error Resume Next
  Set objMail=Server.CreateObject("CDO.Message")
  Set cfg=objMail.Configuration
  Set f=cfg.Fields
  f.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
  f.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="mail.artonstamps.org"
  f.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
  f.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl")=False
  f.Update
  objMail.From="info@artonstamps.org"
  objMail.To="victor.manta@gmail.com"
  objMail.ReplyTo=em
  objMail.Subject="Communism on Stamps - " & subj
  objMail.TextBody="From: " & nm & vbCrLf & "Email: " & em & vbCrLf & "Subject: " & subj & vbCrLf & vbCrLf & msg
  objMail.Send
  If Err.Number=0 Then
   sent=True
  Else
   errorMessage="The message could not be sent. Please try again later."
   Err.Clear
  End If
  Set objMail=Nothing
  On Error GoTo 0
 End If
End If
%>
<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Contact &amp; Feedback — Communism on Stamps</title><link rel="stylesheet" href="assets/author-modern-v2.css"><link rel="stylesheet" href="assets/cos-controls.css"><script defer src="assets/cos-controls.js"></script><style>
.feedback-panel{max-width:720px;margin:35px auto;padding:25px;background:#fffdf7;border:1px solid #d9c9ac;border-radius:12px;color:#222}.feedback-panel h1{margin-top:0}.feedback-panel label{display:block;margin:14px 0 5px;font-weight:600}.feedback-panel input,.feedback-panel textarea{width:100%;box-sizing:border-box;padding:10px;border:1px solid #a8a8a8;border-radius:5px;font:inherit}.feedback-panel textarea{min-height:150px}.feedback-panel button{margin-top:20px;padding:11px 20px;background:#8f1b22;color:#fff;border:0;border-radius:5px;cursor:pointer}.feedback-panel .notice{padding:12px;background:#eef5e9;border:1px solid #9bbd88}.feedback-panel .error{padding:12px;background:#fff0ed;border:1px solid #c88}.trap{position:absolute;left:-9999px;opacity:0}main{padding:15px}
</style></head><body><header class="masthead"><a class="brand" href="index.html"><span class="star">★</span><span><span class="brand-name">COMMUNISM ON STAMPS</span><span class="tagline">A Philatelic Journey Through a Changing World</span></span></a></header><nav class="nav"><a href="index.html">Home</a><a href="intro.htm">Introduction</a><a href="index.html#featured">Featured</a><a href="articles-a-z.html">Articles A–Z</a><a href="Victor-Manta.htm">Author</a><a href="intro.htm">About</a></nav><main><section class="feedback-panel"><h1>Contact &amp; Feedback</h1><p>Send a message to the author of Communism on Stamps. All fields are required.</p>
<% If sent Then %><p class="notice" role="status">Your message has been submitted to the mail server. Thank you for your feedback.</p><% Else %>
<% If Len(errorMessage)>0 Then %><p class="error" role="alert"><%=SafeText(errorMessage)%></p><% End If %>
<form method="post" action="feedback.asp"><label for="name">Name</label><input id="name" name="name" maxlength="120" required value="<%=SafeText(nm)%>"><label for="email">Email</label><input id="email" name="email" type="email" maxlength="200" required value="<%=SafeText(em)%>"><label for="subject">Subject</label><input id="subject" name="subject" maxlength="180" required value="<%=SafeText(subj)%>"><label for="message">Message</label><textarea id="message" name="message" maxlength="8000" required><%=SafeText(msg)%></textarea><div class="trap" aria-hidden="true"><label for="website">Leave blank</label><input id="website" name="website" tabindex="-1" autocomplete="off"></div><button type="submit">Send Feedback</button></form>
<% End If %><p><a href="Victor-Manta.htm">Return to Author</a></p></section></main><footer class="footer">Communism on Stamps · Historical and philatelic research</footer></body></html>
