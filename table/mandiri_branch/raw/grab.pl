#!/usr/bin/perl

use 5.010;
use autodie;
use strict;
use warnings;
use Log::Any::App '$log';
BEGIN { no warnings; $main::Log_Level = 'trace' }

use File::Slurp;
use LWP::Simple;
#use Mojo::DOM;

sub dl {
    my ($url, $fn) = @_;
    $log->info("Downloading $url ...");
    my $ct = get $url;
    $log->debugf("Saving URL %s to %s ...", $url, $fn);
    write_file($fn, $ct);
    $ct;
}

my $url = "http://www.bankmandiri.co.id/resource/jaringan-result.asp?txtnama=Seluruh+Indonesia";
my $ct = dl($url, "p001.html");
#my $dom = Mojo::DOM->new($ct);

$log->info("Getting number of pages ...");
my $num_pages;
$num_pages = $1 while $ct =~ /pageno=(\d+)/g;

for (2..$num_pages) {
    dl("$url&pageno=$_", sprintf("p%03d.html", $_));
}
