#!/usr/bin/perl
###################################################################
#
#      ZONE_AD.CGI
#
# Zone administration script.
#
###################################################################
# Simonstan WEBZone Production Version 2a
# Copyright (c) 1997-2000 Simon Collins
# Author Simon Collins
# info@simonstan.com
#
# Last Revision 23/09/2000
# This revision - skipnext fixed & link_add
# Last Revision 25/04/1998
# This revision - Prev&skipprev ,Fixed clicks count
###################################################################
# YOU MAY NOT DISTRIBUTE THIS SOFTWARE ITEM
###################################################################
# 
$loop = 1;
####################################
# USER VARIABLES
#
# Please edit the variables below to
# match up with your site
####################################
#



# UNIX STYLE PATH TO WEBZONE DATA DIR
$wz_dir='/users/home/eslone/cgi-bin/webzone/data';

# THE FULL URL FOR THIS SCRIPT
$sc_url="http://www.scs-intl.com/cgi-bin/webzone/zone_ad.cgi";

# THE FULL URL FOR CHANGE.CGI
$ch_script="http://www.scs-intl.com/cgi-bin/webzone/change.cgi";




######################################
# MAIN PROGRAM - NOTHING BELOW NEEDS EDITING

open (stuff,"$wz_dir/zoneconf.txt")||die("Can't open config File"); 
$line=<stuff>;
 ($zone_name,$zone_pic,$zone_back,$zone_text,$zone_linkc,$zone_vlinkc,$zone_alinkc)=split(/,/,$line);

close(stuff);


#
open (dabase, "$wz_dir/max.dat");
$maxnum=<dabase>;
$maxlink = "$maxnum";
close(dabase);

&parse_form;
&pass_prompt unless $FORM{'password'};
&check_pas;

if ($FORM{'admin'}){
print "Content-type: text/html\n\n";
print "<head>\n";
print "<title>Admin - Results</title>\n";
print "</head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<h3><font face=Arial><b>ADMIN RESULTS FOR $zone_name</font></b></h3>\n";
print "<hr size=4>\n";
print "<table border=0 width=\"750\" >\n";
print "  <tr>\n";
print "    <td width=18 height=13 bgcolor=#FFFFFF><strong><font color=#000000 face=Arial>Id\n";
print "    </font></strong></td>\n";
print "    <td width=263 height=13 bgcolor=#FFFFFF><strong><font color=#000000 face=Arial>Site\n";
print "    Name</font></strong></td>\n";
print "    <td width=168 height=13 bgcolor=#FFFFFF><strong><font color=#000000 face=Arial>User\n";
print "    Name </font></strong></td>\n";
print "    <td width=100 height=13 bgcolor=#FFFFFF><strong><font color=#000000 face=Arial>Password</font></strong></td>\n";
print "    <td width=51 height=13 bgcolor=#FFFFFF><strong><font color=#000000 face=Arial>Status</font></strong></td>\n";
print "    <td width=27 height=13 bgcolor=#FFFFFF><font color=#000000 face=Arial><strong>H</strong></font></td>\n";
print "    <td width=29 height=13 bgcolor=#FFFFFF><font color=#000000 face=Arial><strong>N</strong></font></td>\n";
print "    <td width=84 height=13 bgcolor=#FFFFFF><font color=#000000 face=Arial><strong>Change</strong></font></td>\n";
print "  </tr>\n";

while($loop <=$maxnum){
 open (check,"$wz_dir/$loop.dat"); 
 while($line=<check>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept)=split(/,/,$line);
}
close(check);
open(hit, "$wz_dir/hits/$loop.hit");
$dathit=<hit>;
close(hit);
open(rec, "$wz_dir/hits/$loop.rec");
$datrec=<rec>;
$dtrec="$datrec";
close(rec);
 print "<tr>\n";
 print "    <td width=18 height=10 >$loop</td>\n";
 print "    <td width=263 height=10 ><a\n";
 print "    href=\"$linkurl\">$linkname</a></td>\n";
 print "    <td width=\"168\" height=\"10\" ><a\n";
 print "    href=\"mailto:$mail\">$user</a></td>\n";
 print "    <td width=\"100\" height=\"10\" >$passw</td>\n";
 if ($raccept eq 'hold'){
 print "    <td width=\"51\" height=\"10\" ><font color=#ff0000>$raccept</font></td>\n";
 }else{
 print "    <td width=\"51\" height=\"10\" ><font color=#00ff00>$raccept</font></td>\n";
 }
 print "    <td width=\"27\" height=\"10\" >$datrec</td>\n";
 print "    <td width=\"29\" height=\"10\" >$dathit</td>\n";
 print "    <td width=\"84\" height=\"10\" ><a href=\"$ch_script?cmmd=change&id=$loop&password=$FORM{'password'}\">Change</td>\n";
 print "  </tr>\n";

print "\n";
$loop++}
print "</table></body></html>";
exit;
}
elsif ($FORM{'chp'})
{
print "Content-Type: text/html\n\n";
print "<HTML>\n<HEAD>\n<TITLE>Change User Password</title>\n</head>\n\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=arial><h1>Change Password</h1>\n";
print "<form method=\"post\" action=\"$sc_url\">";
print "<br><br>Please enter new Passord<br>\n";
print "<input type=password name=npass1 size=20>\n<br>";
print "<input type=hidden name=password value=$FORM{'password'}>\n";
print "<br><input type=submit name=chanpas value=\"Change Password\">\n";
print "</form>\n";
print "<br><br>To return to main management screen<Br><br><b><a href=\"$sc_url\">Click here</b>\n";
print "</body></html>\n";
}
elsif ($FORM{'code'})
{
print "Content-Type: text/html\n\n";
print "<HTML>\n<HEAD>\n<TITLE>Change HTML Code</title>\n</head>\n\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=arial size=+2>Change HTML Code</font>\n";
print "<form method=\"post\" action=\"$sc_url\">";
print "<font face=arial><small>Please enter new Details - If you do not wish to make changes, Click the text link at the bottom<br>\n";

print "<br>The following commands are needed for the links (see below for examples)<br><br>\n";
print "\&lt;a href=\"#next#\"&gt; - Next Site<br>\n";
print "\&lt;a href=\"#skipnext#\"&gt; - Skip Next Site<br>\n";
print "\&lt;a href=\"#prev#\"&gt; - Previous Site<br>\n";
print "\&lt;a href=\"#skipprev#\"&gt; - Skip Previous Site<br>\n";
print "\&lt;a href=\"#list#\"&gt; - List Sites<br>\n";
print "\&lt;a href=\"#home#\"&gt; - Your webzone homepage<br>\n";
print "#zonename# - WebZONE name<br>\n";
print "#sitenumb# - Site Id number<br>\n";
print "#membername# - Member name<br>\n";
print "\&lt;a href=\"mailto:#membermail#\"&gt; - Member E-mail address<br>\n";
print "\&lt;a href=\"mailto:#ownermail#\"&gt; - Owner (Your) e-mail address<br><Br><br>\n";

open (file, "$wz_dir/zonecode.txt")||die("Can't open code File"); 
@code=<file>;
close(file);
print "<textarea rows=\"14\" name=\"newcode\" cols=\"60\" >@code</textarea>";

print "<input type=hidden name=password value=$FORM{'password'}>\n";
print "<br><input type=submit name=chancode value=\"Change Values\">\n";
print "</form>\n";
print "<br><br>To return to main management screen without changes<Br><br><b><a href=\"$sc_url\">Click here</b>\n";
print "</body></html>\n";
}
elsif ($FORM{'chancode'})
{
open (file, ">$wz_dir/zonecode.txt")||die("Can't open code File"); 
print file "$FORM{'newcode'}";
close(file);
print "Content-Type: text/html\n\n";
print "<HTML>\n<HEAD>\n<TITLE>HTML Code Changed</title>\n</head>\n\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=arial size=+2>HTML Code Changed</font>\n";
print "<br><br><br><bR><br><a href=\"$sc_url\">Click Here</a> To return to admin\n";
print "</body></html>\n";
}
elsif ($FORM{'chapp'})
{
print "Content-Type: text/html\n\n";
print "<HTML>\n<HEAD>\n<TITLE>Change Appearance</title>\n</head>\n\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=arial size=+2>Change Appearance</font>\n";
print "<form method=\"post\" action=\"$sc_url\">";
print "<br><br>Please enter new Details - If you do not wish to make changes, leave fields as they are<br>please check data before pressing to submit<br>\n";
print "<input type=text name=znam size=40 value=$zone_name> Name of your webzone\n<br>";
print "<input type=text name=zpic size=40 value=$zone_pic> Url for your webzone pic (top rh conrner)\n<br>";
print "<input type=text name=zbgc size=40 value=$zone_back> Background Colour\n<br>";
print "<input type=text name=ztcl size=40 value=$zone_text> Text Colour\n<br>";
print "<input type=text name=zlcl size=40 value=$zone_linkc> Link Colour\n<br>";
print "<input type=text name=zvlc size=40 value=$zone_vlinkc> Visited Link Colour\n<br>";
print "<input type=text name=zalc size=40 value=$zone_alinkc> Active Link Colour\n<br>";
print "<input type=hidden name=password value=$FORM{'password'}>\n";
print "<br><input type=submit name=chanval value=\"Change Values\">\n";
print "</form>\n";
print "<br><br>To return to main management screen without changes<Br><br><b><a href=\"$sc_url\">Click here</b>\n";
print "</body></html>\n";
}
elsif ($FORM{'chanval'})
{
print "Content-Type: text/html\n\n";
print "<HTML>\n<HEAD>\n<TITLE>Appearance Changed</title>\n</head>\n\n";
print "<body bgcolor=\"$FORM{'zbgc'}\" text=\"$FORM{'ztcl'}\" link=\"$FORM{'zlcl'}\" vlink=\"$FORM{'zvlc'}\" alink=\"$FORM{'alc'}\">\n";
print "<img src=\"$FORM{'zpic'}\" align=right>\n";
print "<font face=arial size=+2>Appearance Changed</font>\n";
print "<form method=\"post\" action=\"$sc_url\">";
open (file,">$wz_dir/zoneconf.txt")||die("Can't open config File"); 
print file "$FORM{'znam'},$FORM{'zpic'},$FORM{'zbgc'},$FORM{'ztcl'},$FORM{'zlcl'},$FORM{'zvlc'},$FORM{'zalc'}";
close(file);
print "<br><Br>";
print "<a href=\"$sc_url\">Click here</a> to return to main admin";

print "</body></html>\n";
}
elsif ($FORM{'wzhome'}){
$url="http://webzone.simonstan.com";
print("location:$url\n\n");
}
elsif ($FORM{'chanpas'}){
if ($FORM{'npass1'} ne ''){
open (PASW,">$wz_dir/paword.pas")||die("Can't open Password File");
print PASW"$FORM{'npass1'}";
close(PASW);
print "Content-Type: text/html\n\n";
print "<HTML>\n<HEAD>\n<TITLE>Password Changed</title>\n</head>\n\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=arial><h1>Password Changed</h1>\n";
print "Click the button below to return to management";
print "<form method=\"post\" action=\"$sc_url\">";
print "<br><input type=hidden name=password value=$FORM{'npass1'}>\n";
print "<input type=submit value=return name=submit>\n";
print "</form>\n";
}else{
print "<HTML>\n<HEAD>\n<TITLE>ERROR</title>\n</head>\n\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=arial><h1>ERROR</h1>\n";
print "The two passwords you entered did NOT match .<br>";
print "<br>Please press the back button on you browser and try again";
print "</body></html>\n";
}}else{
&main_prog;
}
###################################
# MAIN SCREEN
#
sub main_prog{
print "Content-Type: text/html\n\n";
print <<HTML_OUT;

<html>
<head>
<title>$zone_name ADMIN</title>

</head>
<body bgcolor="$zone_back" text="$zone_text" link="$zone_linkc" vlink="$zone_vlinkc" alink="$zone_alinkc">
<a href="http://www.simonstan.demon.co.uk/webzone"><img src="http://www.simonstan.demon.co.uk/webzone/webzone.jpg" border=0 align=right></a>
<h2><font face="Arial">$zone_name Admin pages .</font></h2>
<form method="POST" action="$sc_url">
 <p><font face="Arial">There are currently $maxnum sites in $zone_name</font></p><input type=hidden name=password value=$FORM{'password'}> 
  <p><font face="Arial">&nbsp;</font></p>
  <div align="center"><center><table border="0" width="598" height="41">
    <tr>
      <td width="188" height="41" bgcolor="#0000FF" align="center"><input type="submit"
      value="Change Password" name="chp"></td>
      <td width="203" height="41" bgcolor="#FF0000" align="center"><input type="submit"
      value="Manage webZone" name="admin"></td>
      <td width="189" height="41" bgcolor="#00FF00" align="center"><input type="submit"
      value="Change Appearance" name="chapp"></td>
    </tr>
	<tr>
	      <td width="188" height="41" bgcolor="#ffff00" align="center"><input type="submit"
	      value="E-mail All Users" name="mail"></td>
	      <td width="203" height="41" bgcolor="#FF00ff" align="center"><input type="submit"
	      value="Change HTML Code" name="code"></td>
	      <td width="189" height="41" bgcolor="#00FFff" align="center"><input type="submit"
	      value="WebZONE Homepage" name="wzhome"></td>
    </tr>
  </table>
  </center></div><p><font face="Arial">&nbsp;</font></p>
  <div align="center"><center><p>&nbsp;</p>
  </center></div>
</form>

<p>&nbsp;</p>

<p align="right"><small><font face="Arial">&nbsp;</font></small></p>

<p align="right"><small><font face="Arial">&nbsp;</font></small></p>

<p align="right"><small><font face="Arial">This script is Part of the <a
href="http://webzone.simonstan.com"><img src="http://www.simonstan.demon.co.uk/webzone/webzone.jpg" border=0></a> collection<br>
Written by <a href="mailto:info\@simonstan.com">Simon Collins</font></small></a></p>
</body>
</html>
HTML_OUT
exit;
}
###################################
# OPEN PASSWORD FILE AND CHACK PASSWORD
#
sub check_pas{
open (PASW,"$wz_dir/paword.pas")||die("Can't open Password File");
$chp=<PASW>;
close(PASW);
if ($FORM{'password'} ne $chp)
{
print "Content-Type: text/html\n\n";
print "<html><head><title>$zone_name</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<h1>INCORRECT PASSWORD</h1>\n";
print "<p>Please enter the current Admin password for $zone_name</p>\n";
print "<br>\n";
&main_pass;
exit;
}
}
####################################
# PROMPT FOR MANAGERS PASSWORD
#

sub pass_prompt
{
print "Content-Type: text/html\n\n";
print "<html><head><title>$zone_name</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";

print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=arial size=+2>PASSWORD REQUIRED</font><br>\n";
print "<font face=arial>Please enter the current Admin password for $zone_name\n";
print "<br><br><br><br><br><br>\n";
&main_pass;
}
sub main_pass
{
print "<center><table border=0 width=326 height=13>\n<tr>\n\n<td width=326 height=22 bgcolor=#0000FF>\n";
print "<p align=center><font face=Arial color=#FFFFFF><strong>Admin Password</strong>\n";
print "</font></td>\n";
print "  </tr>\n";
print "  <tr>\n";
print "    <td width=326 height=59 bgcolor=#FF0000><form method=POST\n";
print "    action=\"$sc_url\">\n";
print "      <div align=center><center><p><input type=password name=password size=20><input\n";
print "      type=submit value=Submit name=B1><input type=reset value=Reset name=B2></p>\n";
print "      </center></div>\n";
print "    </form>\n";
print "    </td>\n";
print "  </tr>\n";
print "</table></center>\n";

print "<br><br><br><br><br><br>\n";

print "<p><small>The $zone_name uses <a href=\"http://webzone.simonstan.com\">WebZone</a> from <a href=\"http://www.simonstan.com\">SimonStan Internet</a> . <br>\n";
print "This script is ©1997-2000 <a href=\"mailto:info\@simonstan.com\">Simon Collins</a></p>\n";
print "</body>\n";
print "</html>\n";
exit;
}
####################################
# READ AND PARSE THE FORM DATA
#

sub parse_form
{
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});


  @pairs = split(/&/, $buffer);
   foreach $pair (@pairs) {
      ($name, $value) = split(/=/, $pair);
      $value =~ tr/+/ /;
      $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
      $FORM{$name} = $value;
   }
}
