#!/bin/bash
perl -pe'BEGIN { print "code,summary\n" } m!<option value="(\d+)">(.+) \(\d+\)! or die; $_ = "$1,\"$2\"\n";' 02*txt > ../data.csv
