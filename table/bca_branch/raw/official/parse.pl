#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Log::Any::App '$log';

BEGIN { no warnings; $main::Log_Level = 'TRACE' }

use DateTime::Format::Indonesian;
use File::Slurp;

my $fmt = DateTime::Format::Indonesian->new;

#for my $f (<*.html>) {
for my $f (<Bandung*.html>) {
    $log->info("Reading $f ...");
    my ($city) = $f =~ /(.+)-\d+\.html$/; # city name
    my $ct = read_file($f);

    my $date = "";
    if ($ct =~ /Data per (.+?)\s*[\r\n]/) {
        $date = $fmt->parse_datetime($1)->ymd;
    }

    for ($ct) {
        s!.+(<table id="branch".+?</table>).+!$1!s;
        # TODO: alamat dan no telp
        while (m!<td>([^\n]+) \((\d+)\)</td>!msg) {
            #use Data::Dump; dd [$2, $1, $city, $date];
            say qq["$2","$1","$city","$date",""];
        }
    }
}
