#!/usr/bin/perl
###################################################################
#
#      USER_CHD.CGI
#
# Cgi for allowing users to modify their data.
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

# UNIX DIR TO WEBZONE DATA FILES

$u_dir='/users/home/eslone/cgi-bin/webzone/data';


# HTTP ADRESS FOR YOUR WEBZONE

$z_address='http://www.scs-intl.com/cgi-bin/webzone';

# HTTP ADDRESS FOR THIS SCRIPT

$sc_url='http://www.scs-intl.com/cgi-bin/webzone/user_chd.cgi';


########################
# NO MORE EDITING REQUIRED
#

open (stuff,"$u_dir/zoneconf.txt")||die("Can't open config File"); 
$line=<stuff>;
 ($zone_name,$zone_pic,$zone_back,$zone_text,$zone_linkc,$zone_vlinkc,$zone_alinkc)=split(/,/,$line);

close(stuff);

&parse_form;
$sid = $FORM{'id'};
$pass = $FORM{'pass'};

open (check,"$u_dir/$sid.dat"); 
 while($line=<check>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept,$banner,$baccept)=split(/,/,$line);
$pwd = $passw;
}
close(check);
if  ($pass eq $pwd){
if ($FORM{'newdat'}){
open (FILE,">$u_dir/$FORM{'id'}.dat"); 
print FILE"$FORM{'nuser'},$FORM{'nemail'},$FORM{'npass'},$FORM{'nlinkurl'},$FORM{'nlinkname'},hold";
close(FILE);
print "Content-type: text/html\n\n";
print "<html>\n";

print "<head><title>$zone_name </title></head>\n";

print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2>$zone_name</font><br>\n";
print "Information Changed for account $FORM{'id'}<br>\n";
print "<br><font face=arial><small>";
print "your information stands as follows<br><br>";
print "User Name : $FORM{'nuser'}<br>\n";
print "Password  : $FORM{'npass'} . (Please take note of this)\n<br>";
print "E-mail    : $FORM{'nemail'}<br>\n";
print "Site URL  : $FORM{'nlinkurl'}<br>\n";
print "Site Name : $FORM{'nlinkname'}<br><br>\n\n";
print "Your account is now on hold until verified by the webmaster";
print "<br><br><a href=\"$z_address\">Click here</a> to return to <a href=\"$z_address\">$zone_name</a>\n";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
exit;
}
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head><title>$zone_name Change data</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2>$zone_name change data</font><br>\n";
print "Information for account number $sid\n";
print "<br><br><font face=arial><small>";
print "<form action=\"$sc_url\" method =\"POST\">\n";
print "<input type =hidden name=id value=\"$sid\">\n<input type=hidden name=pass value=\"$pass\">\n";
print "User name : <input type=text size=40 value=\"$user\" name=nuser><br>\n";
print "Password : <input type=text size=40 value=\"$pwd\" name=npass><br>\n";
print "E-mail : <input type=text size=40 value=\"$mail\" name=nemail><br>\n";
print "Site URL : <input type=text size=40 value=\"$linkurl\" name=nlinkurl><br>\n";
print "Site Name : <input type=text size=40 value=\"$linkname\" name=nlinkname><br>\n";
print "Account status : $raccept<br><br>\n";
print "<input type = submit value=Change Info name=newdat>\n";
print "<br><br>Please note - your account status will be hold until your new information is verified<br>\n";
print "(your site will NOT be linked from the $zone_name)\n";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>";
} else {

print "Content-type: text/html\n\n";
print "<html>\n";
print "<head><title>$zone_name ERROR</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2>$zone_name Error 003</font><br>\n";
print "Invalid Password<br><bR><font face=arial><small>\n";
print "The password you entered for the account $sid is invalid <br>Please press the back button on your browser and try again ";
print "For more information on The $zone_name please visit our homepage at\n";
print "<a href=\"$z_address\">$z_address</a>";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
}
sub parse_form {

   # Get the input
   read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});

   # Split the name-value pairs
   @pairs = split(/&/, $buffer);

   foreach $pair (@pairs) {
      ($name, $value) = split(/=/, $pair);

      # Un-Webify plus signs and %-encoding
      $value =~ tr/+/ /;
      $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

      $FORM{$name} = $value;
   }
}
