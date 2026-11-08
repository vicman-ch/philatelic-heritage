#!/usr/bin/perl
###################################################################
#
#      CHANGE.CGI
#
# Cgi to change status of ring members - hold/live
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

# UNIX PATH TO YOUR WEBZONE FILES
#
$unix_dir='/users/home/eslone/cgi-bin/webzone/data';

# REAL PATH TO YOUR ZONE_AD.CGI FILE
$sc_url='http://www.scs-intl.com/cgi-bin/webzone/zone_ad.cgi';

#################################
# NOTHING ELSE REQUIRES EDITING
# BELOW THIS POINT
#


open (stuff,"$unix_dir/zoneconf.txt")||die("Can't open config File"); 
$line=<stuff>;
 ($zone_name,$zone_pic,$zone_back,$zone_text,$zone_linkc,$zone_vlinkc,$zone_alinkc)=split(/,/,$line);

close(stuff);

$nope='hold';
$data=$ENV{'QUERY_STRING'};
$loop = 1;
@fields = split(/&/,$data);
foreach $fields(@fields){
   ($field_name,$field_val)=split(/=/,$fields);
$querydata{$field_name}=$field_val;
}

$cmmd =$querydata{cmmd};
$id=$querydata{id};
$pwrd=$querydata{password};
# get the highest value result

open (dabase, "$unix_dir/max.dat");
$maxnum=<dabase>;
$maxlink = "$maxnum";
close(dabase);

open (pfile, "$unix_dir/paword.pas");
$pass_file=<pfile>;
close(pfile);

if ($pwrd ne $pass_file){
&end("Incorrect or Missing Password");
}

if ($cmmd eq 'change'){
&end("No Id") unless $id;
open (opid, "$unix_dir/$id.dat");
while($line=<opid>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept)=split(/,/,$line);
}
close(opid);
if ($raccept eq 'hold')
{
$raccept='active';
open (wrid, ">$unix_dir/$id.dat");
print wrid"$user,$mail,$passw,$linkurl,$linkname,$raccept";
close(wrid);
}else{
$raccept='hold';
open (wrid, ">$unix_dir/$id.dat");
print wrid"$user,$mail,$passw,$linkurl,$linkname,$raccept";
close(wrid);
}
print "Content-Type: text/html\n\n";
print "<HTML><HEAD><TITLE>$zone_name File Changed</TITLE></HEAD>\n";
print "<body bgcolor=\"$FORM{'zbgc'}\" text=\"$FORM{'ztcl'}\" link=\"$FORM{'zlcl'}\" vlink=\"$FORM{'zvlc'}\" alink=\"$FORM{'alc'}\">\n";
print "<img src=\"$FORM{'zpic'}\" align=right>\n";
print "<font face=arial size=+2>Site Status Changed</font><br><br>\n";

print "The site, $linkname has been changed to $raccept<br><br><br>\n";
print "Please <a href=\"$sc_url\">Click here</a> to return to the management script\n";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
}

sub end
{
print "Content-Type: Text/html\n\n";
print "<html><HEAD><TITLE>ERROR</title></head>\n";
print "<body bgcolor=\"$FORM{'zbgc'}\" text=\"$FORM{'ztcl'}\" link=\"$FORM{'zlcl'}\" vlink=\"$FORM{'zvlc'}\" alink=\"$FORM{'alc'}\">\n";
print "<img src=\"$FORM{'zpic'}\" align=right>\n";

print "<h1><font face=arial>ERROR</h1>print $_[0]<br><br>Please press the back button on your browser and try again\n";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
exit;
}