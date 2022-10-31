1. copy-paste the html to notepad (i use windows for this, of all things,
because kde clipboard just refuses to copy paste the whole text, it's only
~1-2MB of text. tried firefox and google-chrome).

then it has extra newlines for upper/lower limit field that has values starting
with "=". fix it with: perl -pi~ -0777 -e's/\n(\t*=)/$1/g' 02-text.txt

2. add column 'id' e.g. with csv-munge-row -e 'unshift @$_, ++$i'
