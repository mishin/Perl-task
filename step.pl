#!/usr/bin/perl -X
require HTTP::Request;
use LWP::UserAgent ();

##########
$user = 'username'; # Enter your username here
$pass = 'password'; # Enter your password here
###########

# Server settings (no need to modify)
$home = "http://website.com";
$url  = "$home/c/test.cgi?u=$user&p=$pass";

# Get HTML code
$ua = LWP::UserAgent->new;
$html = $ua->get($url);

# Grab img from HTML code
$html->decoded_content =~ m/<img src="/;
$after = "$'\n";
$after =~ m/"/;
$imgPath = "$`\n";
#########
$imgUrl = "$home$imgPath";

1;
