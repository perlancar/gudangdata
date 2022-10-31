1. copy-paste the html to kedit (if fail, try loading the saved html first, then
copy-paste from that). save as tsv.

2. add column 'id' e.g. with csv-munge-row -e 'unshift @$_, ++$i'
