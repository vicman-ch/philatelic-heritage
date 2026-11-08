#!/usr/bin/perl
###################################################################
#
#      ZONE.CGI
#
# Main zone navigation script.
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
$nope='hold';



# Change this to the url for your webzone
$homeurl="http://www.scs-intl.com/cgi-bin/webzone";

# Name of Your Webzone
$wz_name="Feynman";

# UNIX style path to your DATA FILES - eg C:/wwwroot/yoursite or /usr/home/yoursite
$wz_dir='/users/home/eslone/cgi-bin/webzone/data';

# YOUR E-MAIL ADDRESS
$wz_mail='eslone@scs-intl.com';




#############################
# NOTHING ELSE REQUIRES EDITING

open (stuff,"$wz_dir/zoneconf.txt")||die("Can't open config File"); 
$line=<stuff>;
 ($zone_name,$zone_pic,$zone_back,$zone_text,$zone_linkc,$zone_vlinkc,$zone_alinkc)=split(/,/,$line);

close(stuff);

$nourl=$homeurl;

$url='';
$data=$ENV{'QUERY_STRING'};
@fields = split(/&/,$data);
foreach $fields(@fields){
   ($field_name,$field_val)=split(/=/,$fields);
$KDAT{$field_name}=$field_val;
}
# Check to see if the id number is the highest in the ring
open (dabase, "$wz_dir/max.dat");
$maxnum=<dabase>;
$maxlink = "$maxnum";
close(dabase);
if ($data eq 'list'){
print "Content-type: text/html\n\n";
print "<html><head><title>$zone_name Member List</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2>$zone_name members</font>\n";
print "<table border = 0 width = 400>\n";
print "<tr><td width = 50 bgcolor=#ff0000><font face=arial><b>Id</b></td>\n";
print "    <td width = 350 bgcolor=#ff0000><font face=arial><b>Site URL</b></td>\n";
print "</tr>\n";
$st_dat=1;
while ($st_dat <= $maxlink){

open (FDAT,"$wz_dir/$st_dat.dat"); 
 while($line=<FDAT>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept)=split(/,/,$line);
 }
close(FDAT);
if ($raccept ne 'hold'){
print "<tr>\n";
print "<td width = 50><font face=arial>$st_dat</td>\n";
print "    <td width = 350><font face=arial><a href=\"$linkurl\">$linkname</a></td>\n";
print "</tr>\n";

}
$st_dat++;
}
print "</table>\n";
exit;
}
if(!($KDAT{'id'})){
&noid;
}else{
$id_num="$KDAT{'id'}";
$id="$KDAT{'id'}";
$dir="$KDAT{'dir'}";
$route="$KDAT{'route'}";
}
$lnum = $id_num;

# Check to see if the id number is the highest in the ring
open (file, "$wz_dir/max.dat")||die("Cant open max.dat");
$maxnum=<file>;
$maxlink = $maxnum;
close(file);

#chekc to see if the id number actually exists
if ($id >$maxnum) {
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head><title>$zone_name ERROR</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2>$wz_name Error 003</font><br><Br>\n";
print "<font face=arial><small>Sorry but site id you entered was not recognised . This site has not been submitted\n";
print "<br><br>For more information on $zone_name please visit our homepage at\n";
print "<a href=\"$homeurl\">$homeurl</a>";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
}

#check to see if the site is in the ring
 open (check,"$wz_dir/$lnum.dat"); 
 while($line=<check>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept,$banurl,$baccept,$calls,$hits)=split(/,/,$line);}
close(check);
if ($raccept eq $nope){
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head><title>$zone_name ERROR</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2><h1>$zone_name Error 001</font><br><br>\n";
print "<font face=arial><small>Sorry, but <a href=\"$linkurl\">$linkname</a> has not yet been allowed into $wz_name<br>\n";
print "This could be because it has only recently been submitted and has not been verified by the webmaster<br><br><br>\n";
print "Please e-mail <a href=\"mailto:$wz_mail\">$wz_mail</a> and we ";
print "will activate this site as soon as possible<br><br><br>\n";
print "For more information on $zone_name please visit our homepage at\n";
print "<a href=\"$homeurl\">$homeurl</a>";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
} else { 

if ($dir eq 'next') {
if ($lnum eq $maxnum) {    
$lnum = 1;   
&readinf;       
} else {
$lnum ++;    
&readinf;    
$hitsfile="$wz_dir/hits/$id.hit";
$hitsrec="$wz_dir/hits/$lnum.rec";
open (dabase, "$hitsfile");
$hitz=<dabase>;
$hitcount = "$hitz";
close(dabase);
$hitsinc=$hitcount;
$hitsinc++;

open (dabase, "$hitsrec");
$hre=<dabase>;
$hitc = "$hre";
close(dabase);
$hitsrecinc=$hitc;
$hitsrecinc++;


open (max1, ">$hitsfile");
print max1"$hitsinc";
close(max1);

open (max2, ">$hitsrec");
print max2"$hitsrecinc";
close(max2);
}}elsif ($dir eq 'prev') {
if ($lnum == 1) {  

$lnum=$maxnum; 
$flnum=$lnum;
&backreadinf;       
} else {
$zd=$lnum;
$lnum--;
$flnum=$lnum;


   
&backreadinf;    
$hitsfile="$wz_dir/hits/$id.hit";
$hitsrec="$wz_dir/hits/$lnum.rec";
open (dabase, "$hitsfile");
$hitz=<dabase>;
$hitcount = "$hitz";
close(dabase);
$hitsinc=$hitcount;
$hitsinc++;

open (dabase, "$hitsrec");
$hre=<dabase>;
$hitc = "$hre";
close(dabase);
$hitsrecinc=$hitc;
$hitsrecinc++;


open (max1, ">$hitsfile");
print max1"$hitsinc";
close(max1);

open (max2, ">$hitsrec");
print max2"$hitsrecinc";
close(max2);
}
}elsif ($dir eq 'skipnext') {
if ($lnum eq $maxnum) { 
$lnum = 1;
$chk=0;
while ($chk <= 1){
$lnum++;
&readinf; 
$chk++;

}
   
       
} else {
$mnu=$lnum;
$chk=0;

while ($chk <= 1){
$lnum ++;
&readinf; 
$chk++;
}

$hitsfile="$wz_dir/hits/$id.hit";
$hitsrec="$wz_dir/hits/$lnum.rec";
open (dabase, "$hitsfile");
$hitz=<dabase>;
$hitcount = "$hitz";
close(dabase);
$hitsinc=$hitcount;
$hitsinc++;

open (dabase, "$hitsrec");
$hre=<dabase>;
$hitc = "$hre";
close(dabase);
$hitsrecinc=$hitc;
$hitsrecinc++;


#open (max1, ">$hitsfile");
#print max1"$hitsinc";
#close(max1);

#open (max2, ">$hitsrec");
#print max2"$hitsrecinc";
#close(max2);
}

}  elsif ($dir eq 'skipprev') {
if ($lnum == 1) { 
$lnum = $maxnum;
$chk=0;
while ($chk <= 1){
$lnum--;
&backreadinf; 
$chk++;

}
   
       
} else {
$mnu=$lnum;
$chk=0;

while ($chk <= 1){
$lnum --;
&backreadinf; 
$chk++;
}

$hitsfile="$wz_dir/hits/$id.hit";
$hitsrec="$wz_dir/hits/$lnum.rec";
open (dabase, "$hitsfile");
$hitz=<dabase>;
$hitcount = "$hitz";
close(dabase);
$hitsinc=$hitcount;
$hitsinc++;

open (dabase, "$hitsrec");
$hre=<dabase>;
$hitc = "$hre";
close(dabase);
$hitsrecinc=$hitc;
$hitsrecinc++;


#open (max1, ">$hitsfile");
#print max1"$hitsinc";
#close(max1);

#open (max2, ">$hitsrec");
#print max2"$hitsrecinc";
#close(max2);
}

} elsif ($dir eq 'home') {
$url = $homeurl;
}else {
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head><title>$zone_name ERROR</title></head>\n";
print "<body bgcolor=\"$zone_back\" text=\"$zone_text\" link=\"$zone_linkc\" vlink=\"$zone_vlinkc\" alink=\"$zone_alinkc\">\n";
print "<img src=\"$zone_pic\" align=right>\n";
print "<font face=\"arial\" size=+2>$wz_name Error 002</font><br><br>\n";
print "<font face=arial><small>Sorry but the command dir=$dir was not recognised\n";
print "<br><br>For more information on $zone_name please visit our homepage at\n";
print "<a href=\"$homeurl\">$homeurl</a>";
print "<br><Br><font face='verdana' size='1'>This zone is powered by <a href='http://webzone.simonstan.com'>WebZone</a>. <br>Copyright 1997-2000 Simonstan.com</font>\n";
print "</body></html>\n";
exit;}


print("location:$url\n\n");
}
sub noid {
print("location:$nourl\n\n");
}

sub backreadinf {
open (FILE,"<$wz_dir/$lnum.dat"); 
 while($line=<FILE>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept)=split(/,/,$line);
 }
close(FILE);
$url = $linkurl;    
&backcheckinf;
}
sub backcheckinf {
if ($raccept eq $nope){
if ($lnum == 1) {    
$lnum=$maxnum;      

&backreadinf;
} else {
$lnum--;         
&backreadinf ; 
}
}
$hitsfile="$wz_dir/hits/$id.hit";
$hitsrec="$wz_dir/hits/$lnum.rec";
open (bchi, "$hitsfile");
$hitz=<bchi>;
$hitcount = "$hitz";
close(bchi);
$hitsinc=$hitcount;
$hitsinc++;


open (hitba, "$hitsrec");
$hitrec=<hitba>;
$hitcountrec = "$hitrec";
close(hitba);
$hitrecinc=$hitcountrec;
$hitrecinc++;

open (maxba, ">$hitsfile");
print maxba"$hitsinc";
close(maxba);

open (max2ba, ">$hitsrec");
print max2ba"$hitrecinc";
close(max2ba);

}
sub readinf {
open (DBASE,"$wz_dir/$lnum.dat"); 
 while($line=<DBASE>){
 ($user,$mail,$passw,$linkurl,$linkname,$raccept)=split(/,/,$line);
 }
close(DBASE);
$url = $linkurl;    
&checkinf;
}
sub checkinf {
if ($raccept eq $nope){
if ($lnum eq $maxnum) {    
$lnum = 1;         
&readinf;
} else {
$lnum ++;         
&readinf ; 
}
}
$hitsfile="$wz_dir/hits/$id.hit";
$hitsrec="$wz_dir/hits/$lnum.rec";
open (dabase, "$hitsfile");
$hitz=<dabase>;
$hitcount = "$hitz";
close(dabase);
$hitsinc=$hitcount;
$hitsinc++;


open (hitco, "$hitsrec");
$hitrec=<hitco>;
$hitcountrec = "$hitrec";
close(hitco);
$hitrecinc=$hitcountrec;
$hitrecinc++;

open (max, ">$hitsfile");
print max"$hitsinc";
close(max);

open (max2, ">$hitsrec");
print max2"$hitrecinc";
close(max2);

}