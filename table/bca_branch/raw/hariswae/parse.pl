#!/usr/bin/perl

use 5.010;
use autodie;
#use locale;
use strict;
use utf8;
use warnings;

open my($fh), "<", "raw.txt";
binmode($fh, ":utf8");
my $city;
while (<$fh>) {
    chomp;
    next unless /\S/;
    if (/^WILAYAH.*:\s*(.+)/) {
        $city = $1;
        next;
    }
    if (/^BCA (?:\s+|\s*–\s*) (KC? .+|Kantor.+)\s+014(\d+)$/x) {
        my ($name, $code) = ($1, $2);
        $code =~ s/^0//;
        say qq[$code,"$name","$city","","2013-04-25",""];
        next;
    }
    die "Unparsed line ($.): $_";
}
