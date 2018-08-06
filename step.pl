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
my $img = "";

#########
die "<img> not found\n" if (!$img);


1;