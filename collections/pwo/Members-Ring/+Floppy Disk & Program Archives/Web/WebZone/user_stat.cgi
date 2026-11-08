#!/usr/bin/perl
###################################################################
#
#      USER_STAT.CGI
#
# Cgi for subscribers to view their site stats.
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

# LOCATION OF YOUR WEBZONE DATA FILES
$wz_files="/users/home/eslone/cgi-bin/webzone/data";

# NAME OF YOUR WEBZONE
$wz_name="Feynman";

# URL FOR YOUR WEBZONE
$wz_url="http://www.scs-intl.com/cgi-bin/webzone";

##############################
# NOTHING ELSE NEEDS EDITING
#


open (stuff,"$wz_files/zoneconf.txt")||die("Can't open config File"); 
$line=<stuff>;
 ($zone_name,$zone_pic,$zone_back,$zone_text,$zone_linkc,$zone_vlinkc,$zone_alinkc)=split(/,/,$line);

close(stuff);


&parse_form;

$sid = $FORM{'id'};
$pass = $FORM{'pass'};
open (check,"$wz_files/$sid.dat"); 
 while($line=<check>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept,$banner,$baccept)=split(/,/,$line);
$pwd = $passw;
}
close(check);

if  ($pass eq $pwd){
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head><title>$zone_name user Statistics</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2>$zone_name Stats</font><br>\n";
print "Statistics for account number $sid\n";
print "<br><br><font face=arial><small>";
print "User name :$user<br>\n";
print "Password :$pwd<br>\n";
print "E-mail : $mail<br>\n";
print "Site URL : $linkurl<br>\n";
print "Site Name : $linkname<br>\n";
print "Account status : $raccept<br>\n";
open(hit, "$wz_files/hits/$sid.hit");
$dathit=<hit>;
close(hit);
open(rec, "$wz_files/hits/$sid.rec");
$datrec=<rec>;
$dtrec="$datrec";
close(rec);
print "Hits recieved from $zone_name : $dtrec<br>\n";
print "$wz_name hits : $dathit<br><br>\n";
print "<small><small>$zone_name hits is the number of times the next button is clicked on your site</small></small>";
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
print "For more information on $zone_name please visit our homepage at\n";
print "<a href=\"$wz_url\">$wz_url</a>";
print "<br><Br>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. Copyright &copy; 1997-2000 Simonstan.com\n";
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
