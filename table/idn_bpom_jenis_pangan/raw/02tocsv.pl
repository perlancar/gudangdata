#!/bin/bash
perl -pe'm!<option value="(\d+)">(.+) \(\d+\)! or die; $_ = "$1,\"$2\"\n";' 02*txt > ../data.csv
