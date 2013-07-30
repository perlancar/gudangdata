#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Log::Any::App '$log';

BEGIN { no warnings; $main::Log_Level = 'TRACE' }

use File::Slurp;
#use Mojo::DOM;
use WWW::Mechanize;

my $url = "http://www.bca.co.id/id/network/network_landing.jsp";

my $mech = WWW::Mechanize->new;

$log->info("Getting list of cities ...");
$mech->get($url);
my $form = $mech->form_with_fields("city") or die "Can't get form";
my $select = $form->find_input("city") or die "Can't get city select field";
my @city_ids   = $select->possible_values;
my @city_names = $select->value_names;

CITY:
for my $i (0..$#city_ids) {
    my $cid = $city_ids[$i];
    next unless $cid;
    my $cname = $city_names[$i];
    $log->info("Getting items for city '$cname' ...");

    $mech->get($url);
    $mech->form_with_fields("city") or die "Can't get form";
    $mech->set_fields(network => $ENV{NETWORK} // 1, city => $cid);
    $mech->submit;

    # cari halaman terakhir itu berapa?
    my $ct = $mech->content;
    write_file("$cname-1.html", $ct);

    $ct =~ m!<a href="([^"]+)"><span class="pager">>></span>!
        or do { warn "Can't find last page link" if 0; next CITY };
    my $u = $1;
    $u =~ /-p=(\d+)/;
    my $numpages = $1;

    for my $j (2..$numpages) {
        $log->info("  Getting page $j ...");
        $u =~ s/-p=\d+/-p=$j/;
        $mech->get($u);
        write_file("$cname-$j.html", $mech->content);
    }
}

