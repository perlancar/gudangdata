Repositori ini berisi kumpulan data referensi, terutama data tentang Indonesia
dan/atau untuk aplikasi berbahasa Indonesia, mis: daftar provinsi di Indonesia,
daftar negara dengan nama Inggris dan Indonesia, dsb. Data ini bisa dipakai
untuk mengisi tabel di database aplikasi, untuk modul/pustaka, dsb.

Sumber data dari berbagai situs, misalnya: Wikipedia Indonesia, situs-situs
pemerintah, dll.

Saya mulai mengoleksi data ini pertama-tama untuk menjadi sumber data bagi
pustaka Perl di CPAN seperti Calendar::Indonesia::Holiday, Business::ID::NOPPBB,
dll.

Data di repositori ini diusahakan akurat, terkini, lengkap, disimpan dalam
format standar, menghindari duplikasi (mis: memanfaatkan konsep foreign ID
seperti di database relasional).

Tujuan akhir adalah untuk merging ke repositori Gudang-Data-Indonesia [1] atau
effort sejenisnya.


==Pengorganisasian data==

Data ditaruh di direktori data/. Di bawah direktori ini, setiap tabel ditaruh di
subdirektori masing-masing. Data tabel umumnya disimpan dalam file data.csv
karena format CSV cukup universal dan memudahkan impor ke aplikasi spreadsheet.
Metadata disimpan dalam file meta.yaml (atau meta.json). Keterangan perubahan
ada di file bernama Changes.

===Struktur metadata===

====tabel====

Field yang ditandari dengan sufiks * sifatnya wajib:

- en_summary: Ringkasan tabel (satu baris, tanpa format), dalam bahasa Inggris

- id_summary*: idem, dalam bahasa Indonesia

- en_description: Deskripsi tentang tabel (satu s/d beberapa paragraf, dalam
  markup Org), dalam bahasa Inggris

- id_description*: idem, dalam bahasa Indonesia.

- urls:

- en_tags:

- id_tags:

- columns: Daftar kolom (mapping). Field metadata untuk kolom dijelaskan dalam
  subbab 'kolom'.

===kolom===

- en_summary
- id_summary
- en_description
- id_description
- en_tags
- id_tags
- type


==Panduan bagi editor/kontributor==

===Standar penamaan===

* Nama tabel dan kolom ditulis dalam huruf kecil, bahasa Inggris, dan bentuk
  tunggal (singular), contoh: 'name' (bukan 'nama', 'Name', 'names'). Jika kolom
  berisi array atau daftar item, boleh ditulis dalam bentuk jamak (plural),
  contoh: 'tags'. Hanya pergunakan huruf, angka, dan garis bawah ('_') saja.
  Jangan pergunakan garis bawah atau angka untuk karakter pertama.

* Jika sebuah nama terdiri dari dua kata atau lebih, pisahkan dengan garis bawah
  ('_', contoh: 'current_price') dan jangan satukan ('currentprice') atau
  menggunakan camel case ('currentPrice').

* Singkatan kata dan nama yang sudah wajar dan relatif non-ambigu dalam
  pemrograman diperbolehkan. Selain dari itu, usahakan menggunakan kata lengkap
  dan bukan singkatan. Contoh: 'id' (Indonesia), 'en' (English), 'org'
  (organization), 'struct' (structure), 'int' (untuk integer, relatif ambigu
  dalam istilah tipe data), tapi 'rq' atau 'req' lebih tidak disukai ketimbang
  'request' (karena bisa ambigu dengan 'required' misalnya). Jika ragu mengenai
  hal ini, diskusikan dengan editor.

* Untuk nama, usahakan selalu menyediakan nama Inggris maupun nama Indonesia.
  Gunakan nama kolom seperti 'en_name' (nama Inggris) dan 'id_name' (nama
  Indonesia). Contohnya, lihat tabel 'country'.

* Gunakan prefiks 'id_' untuk tabel atau kolom yang hanya berisi data yang
  spesifik untuk bahasa/wilayah Indonesia, mis: 'id_province' (tabel daftar
  provinsi di Indonesia). Bandingkan dengan tabel 'country' (daftar negara di
  dunia). Jika kita memberi nama sebuah tabel dengan 'province' maka idealnya
  isi tabel tersebut adalah daftar provinsi atau entiti subnegara di semua
  negara.

===Pesan commit===

* Boleh dalam bahasa Indonesia atau Inggris (saya memperkirakan semua
  kontributor rata-rata adalah orang Indonesia atau mereka yang kenal bahasa
  Indonesia).

* Ikuti panduan pesan commit yang 'baik' di: XXX


==Tautan==

[1] http://gdi.id-php.org/
