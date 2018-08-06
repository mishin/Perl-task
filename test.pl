#!/usr/bin/perl -X

##########
$user = 'username'; # Enter your username here
$pass = 'password'; # Enter your password here
###########

# Server settings (no need to modify)
$home = "http://website.com";
$url  = "$home/c/test.cgi?u=$user&p=$pass";

# Get HTML code
$html = `GET "$url"`;

#### Add code here:
# Grab img from HTML code
my $img = "";

#########
die "<img> not found\n" if (!$img);


# Download img to server (save as: ocr_me.img)
print "GET '$img' > ocr_me.img\n";
system "GET '$img' > ocr_me.img";


#### Add code here:
# Run OCR (using shell command tesseract) on img and save text as ocr_result.txt

###########
die "ocr_result.txt not found\n" if (!-e "ocr_result.txt");

# Check OCR results:
$txt = `cat ocr_result.txt`;
$txt =~ s/[^A-Za-z0-9\-_\.]+//sg;
$img =~ s/^.*\///;
print `echo -n "file=$img&text=$txt" | POST "$url"`;

1;
