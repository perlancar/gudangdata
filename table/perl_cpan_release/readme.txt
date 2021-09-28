# -*- Mode: org -*-

* About this table

List of CPAN releases.

Raw data retrieved using (example for Sep 2021):

: list-metacpan-releases --from-date 2021-09-01T00:00:00 --to-date 2021-09-30T23:59:59 --json > 202109.json

To get the number of rows in the JSON file, you can use:

: td wc < 202109.json

To convert to CSV:

: td as-csv < 202109.json > 202109.json.csv

To concat and sort by date:

: csv-concat 2021*.json.csv | csv-sort-rows --by-field date - > 2021.csv

* Issues
