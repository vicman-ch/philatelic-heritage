#!/usr/bin/perl
###################################################################
#
#      LINK_ADD.CGI
#
# Cgi for subscribers to submit their site to the zone.
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

# UNIX PATH TO YOUR DATA FILES
$unix_dir='/users/home/eslone/cgi-bin/webzone/data';

# YOUR E-MAIL ADDRESS
$ownermail='eslone@scs-intl.com';

# YOUR E-MAIL SENDER
$mailprog = '/usr/sbin/sendmail';

# URL TO YOUR WEBZONE 
$wz_dir="http://www.scs-intl.com/online/webzone";

#URL TO LOCATION OF YOUR CGI SCRIPTS
$ws_dir="http://www.scs-intl.com/cgi-bin/webzone";


##################
# END OF USER VARIABLES - FOR UNIX SEE NOTE BELOW


# Webzone was written for use on a windows NT machine running windmail instead of sendmail
# The commands for your mail system most probably will differ from the code in this
# program. Please consult your existing scripts / or documentation if you are running
# this script in a unix environment with sendmail or an equivalent.


######################
# END OF USER MODIFICATIONS (Unless UNIX)
#
# UNIX MODIFICATIONS ARE CLEARLY MARKED


open (stuff,"$unix_dir/zoneconf.txt")||die("Can't open config File"); 
$line=<stuff>;
 ($zone_name,$zone_pic,$zone_back,$zone_text,$zone_linkc,$zone_vlinkc,$zone_alinkc)=split(/,/,$line);

close(stuff);

&parse_form;
$lnum=0;
$user = $FORM{'user'};
$maxlinkfile="$unix_dir/max.dat";
$mail = $FORM{'mail'};
$passw = $FORM{'pass'};
$linkurl = $FORM{'linkurl'};
$linkname = $FORM{'linkname'};
$tempdir = '.';
if ($mail =~ /.+\@.+\..+/ && $linkurl =~ /http:\/\/.+\..+/){
   &endit ("Invalid / Non Existant Username.") unless $user;
   &endit ("Invalid E-Mail .") unless $mail;
   &endit ("Invalid / Non Existant Password.") unless $passw;
   &endit ("Non existant a name.") unless $linkname;
   } 
else
    { &endit ("Invalid E-Mail and/or URL format.");
    }

open (dabase, "$maxlinkfile");
$maxnum=<dabase>;
$maxlink = "$maxnum";
close(dabase);
$lnum=$maxlink;
$lnum++;
open(info, ">$unix_dir/$lnum.dat");
print info"$user,$mail,$passw,$linkurl,$linkname,hold";
close(info);
open(hit, ">$unix_dir/hits/$lnum.hit");
print hit"0";
close(hit);
open(rec, ">$unix_dir/hits/$lnum.rec");
print rec"0";
close(rec);
open (max, ">$unix_dir/max.dat");
print max"$lnum";
close(max);

 open(MAIL,"|$mailprog -t")||&endit("Cannot open mail program");

    print MAIL "To: $mail\n";
   print MAIL "Cc: $ownermail\n";
    print MAIL "From: \"$zone_name\" <$ownermail>\n";
 
print MAIL "Subject: $zone_name Submission\n\n";

    print MAIL "Hi $user.\n\n";
	print MAIL "Thankyou for submitting your site to $zone_name\n\n";
    print MAIL "Should you wish to update your profile or check stats \n";
    print MAIL "you can do so from $wz_dir \n";
	print MAIL "using your Id and password as printed below\n\n";
    print MAIL "Site ID Number : $lnum\n";
    print MAIL "Password : $passw \n";
    print MAIL "site URL : $linkurl\n";
    print MAIL "Site Name : $linkname\n";
	print MAIL "\n\n THE CODE BELOW MUST BE ON THE PAGE $linkurl or on a webring page clearly indicated \n";
print MAIL "once you have the HTML in place please reply to this message indicating so\n";
    print MAIL "Please cut and paste the HTML code below into your site\n\n";
	
open (file,"$unix_dir/zonecode.txt")||die("Can't open config File"); 
@codefile=<file>;	
close(file);

foreach $codeline(@codefile){
$codeline =~ s/#zonename#/$zone_name/gi;
$codeline =~ s/#sitenumb#/$lnum/gi;
$codeline =~ s/#home#/$wz_dir/gi;
$codeline =~ s/#next#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=next/gi;
$codeline =~ s/#skipnext#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=skipnext/gi;
$codeline =~ s/#prev#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=prev/gi;
$codeline =~ s/#skipprev#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=skipprev/gi;
$codeline =~ s/#list#/$ws_dir\/zone.cgi?list/gi;
$codeline =~ s/#membername#/$user/gi;
$codeline =~ s/#membermail#/$mail/gi;
$codeline =~ s/#ownermail#/$ownermail/gi;


print MAIL "$codeline";
}

#THE FOLLOWING LINES MUST NOT BE REMOVED
print MAIL "\n\n";
print MAIL "This webzone is powered by WebZone. The cgi-script collection available for FREE at\n";
print MAIL "http://webzone.simonstan.com";

close (MAIL);



print "Content-type: text/html\n\n";
print <<"OUT_HTML";
<html>
<head><title>Site submitted</title></head>
<body bgcolor="$zone_back" text="$zone_text" link="$zone_linkc" vlink="$zone_vlinkc" alink="$zone_alinkc">
<img src="$zone_pic" align="right" >

<font face="arial"><br><small>
Thank you for joining the $zone_name webring.<p>
 
Your site ( <a href=\"$linkurl\">$linkname</a> )has been submitted to the queue to join the $zone_name webring. Should you wish to update your profile or check your site statistics you can do so from our homepage using your userid and password as printed below.<p>
    Site ID Number: $lnum<br>
    Password: $passw <br>
    site URL: $linkurl<br>
    Site name: $linkname<p>

THE CODE BELOW MUST BE ON THE PAGE $linkurl or on a webzone page clearly indicated <br>
Your site will be added the the main pool once you have the following code in place . <br>
otherwise people would not be able to explore all sites in the Zone and will become stuck .\n\n
<Br>The code you require should look like<br><br></font></small>
OUT_HTML

open (file,"$unix_dir/zonecode.txt")||die("Can't open config File"); 
@codefile=<file>;	
close(file);

foreach $codeline(@codefile){
$codeline =~ s/#zonename#/$zone_name/gi;
$codeline =~ s/#sitenumb#/$lnum/gi;
$codeline =~ s/#home#/$wz_dir/gi;
$codeline =~ s/#next#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=next/gi;
$codeline =~ s/#skipnext#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=skipnext/gi;
$codeline =~ s/#prev#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=prev/gi;
$codeline =~ s/#skipprev#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=skipprev/gi;
$codeline =~ s/#list#/$ws_dir\/zone.cgi?list/gi;
$codeline =~ s/#membername#/$user/gi;
$codeline =~ s/#membermail#/$mail/gi;
$codeline =~ s/#ownermail#/$ownermail/gi;
print "$codeline";
}

print "<br>\n";
print "<textarea rows=\"14\" name=\"newcode\" cols=\"60\" >\n";
open (file,"$unix_dir/zonecode.txt")||die("Can't open config File"); 
@codefile=<file>;	
close(file);

foreach $codeline(@codefile){
$codeline =~ s/#zonename#/$zone_name/gi;
$codeline =~ s/#sitenumb#/$lnum/gi;
$codeline =~ s/#home#/$wz_dir/gi;
$codeline =~ s/#next#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=next/gi;
$codeline =~ s/#skipnext#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=skipnext/gi;
$codeline =~ s/#prev#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=prev/gi;
$codeline =~ s/#skipprev#/$ws_dir\/zone.cgi?id=$lnum&amp;dir=skipprev/gi;
$codeline =~ s/#list#/$ws_dir\/zone.cgi?list/gi;
$codeline =~ s/#membername#/$user/gi;
$codeline =~ s/#membermail#/$mail/gi;
$codeline =~ s/#ownermail#/$ownermail/gi;
print "$codeline";
}
print "</textarea>\n";
print "</xmp>\n";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
  # Output a temporary file

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
	  if ($FORM{$name} =~ /,/){
	  &endit("One of your fields contains a comma");
	  exit;}
   }
}

sub endit{
print "content-Type: text/html\n\n";
print "<HTML><HEAD><TITLE>$zone_name ERROR</title></HEAD>";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=\"right\" >\n";
print "<font face=arial size=+2>ERROR</font>\n";
print "<br>$zone_name<br><br>\n";
if ($_[0]) {
print "$_[0]\n";
}
else
{
print "An error has occured , but there was no attatched error message";
}
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>";
exit;}
