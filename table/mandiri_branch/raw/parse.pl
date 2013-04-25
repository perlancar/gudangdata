#!/usr/bin/perl

use 5.010;
use autodie;
use strict;
use warnings;

use File::Slurp;

for my $f (<p*.html>) {
    my $ct = read_file($f);
    while ($ct =~ m!<a id="gmaps" .+point=(\d+).+" >(.+?)</a>!g) {
        say qq[$1,"$2","","","2013-04-25",""];
    }
}
