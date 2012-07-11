# -*- Mode: org -*-

* Tentang tabel ini

Tabel ini berisi daftar kota/kabupaten di Indonesia.

Sumber: Master Kabupaten BPS 2003-2009 [1], [2]. Data terakhir: Agustus 2009.

Mengenai penggunaan istilah /locality/. Locality adalah istilah umum untuk
wilayah setingkat kota (/city/) atau kabupaten (/regency/).

Data yang tersedia saat ini barulah nama kota (bahasa Indonesia) beserta kode
BPS-nya. Data yang sedang berusaha dikumpulkan lagi adalah koordinat (beberapa
sumber yang bisa dipakai: Google Earth atau
http://www.fallingrain.com/world/ID/)

* Cara membuat tabel

1. Kopi paste (ya, apa boleh buat) data dari PDF BPS ke Excel lalu save sebagai
   CSV, mis: tmp.csv
2. Gunakan skrip berikut untuk posproses (buang baris provinsi, tambahkan kode
   jenis):

: $ perl -lne'next if /^\d\d00,/; s/^(\d\d)(\d\d),/$1$2,$1,/; unless (s/,"(?:KOTA|KODYA) (.+)"/,"$1",1/) {$_.=",2"}; print' tmp.csv > data.csv

3. Buang/alihkan tmp.csv

* Isu
* Taut

[1] http://www.bps.go.id/aboutus.php?mstkab=1
[2] http://www.bps.go.id/mstkab/mfkab_03_09.pdf?
