##################################
# WebZONE Version 2
#
# Written By Simon Collins
#
##################################
# INSTALLATION INSTRUCTIONS
#

1 to install WebZone, you will need to open each of the cgi scripts
in a text editor and fill in the required information at the top

Each CGI will require you to specify where your data files will be kept
you must not give this as http://www.yourserver.com/webzone/data - it needs to 
be the directory to the location -

ie

c:/inetpub/wwwroot/webzone/data   or   home/webzone/data 

depending on your system - if you are not sure of this, contact your system administrator

you must create your data directory, but it does not need to be in your webzone directory, it needs
to be a mod(777) directory on UNIX machines and as long as the cgi can write to it, it can be 
anywhere on your server. Inside your data directory you need to create a directory called hits 
once more if on unix you need to make it accessable / readwriteable by all.

into your data directory, you will need to copy the following files

max.dat - contains a count of how many sites are in your webZone
paword.pas - the password for your admin script (zone_ad.cgi)
zoneconf.txt - global variables on how the pages will look (set by the admin script)
zonecode.txt - HTML code for your webzone - set from admin script

Do not change the files, change the mode (if UNIX) to readable and writable by all (666?)


############################
# UNIX E-MAIL SYSTEMS
#

If you are using the script on a sendmail system or most systems, then you will have to make changes to 
the mailing code - this is clearly marked in the cgi (link_add.cgi) - consult your system admin
if you dont know what code is required.


#############################
# SETTING UP HTML FILES

each HTML file supplied needs to be modified to use webzone

open the files in a text editor or html editor and find the line <form method=post........>

there shoudl be value="scriptname*" change it to the path to the name of the script

* where script name is one of link_add.cgi user_stat.cgi user_chd.cgi etc


#############################
# Running for the first time
#

To run webzone for the first time, when you have copied all the files to their correct locations
the cgi scripts shuold be copied to anywhere you want them (provided the directory can take them)
you may be best off using your cgi-bin and chmod each cgi to 755 

Run zone_ad.cgi and enter your password (by default it is password)

change your password for security, when you have changed your password, click Change Appearance

this allows you to change the colours of all the pages displayed by WebZone, 
you may also add your own image to the top right hand corner.

From this page you should set the name of your webzone


NEXT - , once back in the main admin page, you should click change HTML Code

This will allow you to set the code as you would like it, please take note of the existing code
so you can see how the links for each site are handled the links are

<a href="#next#"> - Goto Next site in the webzone
<a href="#skipnext#"> - Skip Next site in the webzone
<a href="#prev#"> - Goto Previous site in the webzone
<a href="#skipprev#"> - skip previous site in the webzone
<a href="#list#"> - list all full sites in the webzone
<a href="#home#"> - got your webzone homepage
#zonename# - The name of your webzone
#sitenumb# - the id number of the site in your webzone

Each piece of code will be automatically customised for each user, with the above commands





#########################################
# E-MAIL ALL MEMBERS
#
# This option HAS NOT BEEN IMPLEMENTED IN THIS VERSION
# Pressing the button wont do anything

