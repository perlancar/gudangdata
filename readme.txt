# -*- Mode: org -*-

* Tentang gudang-data-interim

Repositori ini berisi kumpulan data referensi, terutama data tentang Indonesia
dan/atau untuk keperluan aplikasi berbahasa Indonesia, mis: daftar provinsi di
Indonesia, daftar negara dengan nama Inggris dan Indonesia, dsb.

Sumber data dari berbagai situs, misalnya: Wikipedia Indonesia [1], situs-situs
pemerintah, dll.

Saya mulai mengoleksi data ini pertama-tama untuk menjadi sumber data bagi
pustaka Perl di CPAN [2] seperti ~Calendar::Indonesia::Holiday~,
~Business::ID::NOPPBB~, dll.

Data di repositori ini diusahakan akurat, terkini, lengkap, disimpan dalam
format standar, menghindari duplikasi (mis: memanfaatkan konsep foreign ID
seperti di database relasional).

Tujuan akhir saya adalah merging ke repositori Gudang-Data-Indonesia [3] atau
effort sejenisnya.

* Bagaimana menggunakan data ini? (a.k.a.: Panduan bagi pengguna)

Mayoritas data (terletak di direktori ~data/~) disimpan dalam format CSV dan
dapat dengan mudah dimuat ke program spreadsheet, diimpor ke database
relasional, diparse oleh skrip, dll. Akan disediakan juga skrip (di ~bin/~)
untuk mengimpor ke database SQL, mengupdate data di database SQL, dll.

Silakan baca dokumen ini secara keseluruhan. Jika Anda masih memiliki pertanyaan
mengenai cara pemakaian, dapat menghubungi [4]. Silakan lihat juga effort serupa
seperti [3].

* Panduan bagi kontributor

1. Baca dokumen ini hingga selesai.
2. Mendaftar ke github [6] jika belum.
3. Fork proyek ini [7].
4. Kirimkan patch (pull request) atau laporkan isu lewat github.
5. Jika Anda berminat ikut menjadi editor, silakan hubungi [4]. Tugas editor
   adalah mengecek akurasi data/perubahan data.

* Panduan bagi pengembang aplikasi

Untuk saat ini, silakan lihat [[Panduan bagi pengguna]].

* Pengorganisasian data

Data ditaruh di direktori ~data/~. Mayoritas data ada dalam bentuk tabel 2
dimensi. Di bawah direktori ~data/~, setiap tabel ditaruh di subdirektori
masing-masing. Data tabel umumnya disimpan dalam file ~data.csv~ karena format
CSV cukup universal dan memudahkan impor ke aplikasi spreadsheet atau yang
lainnya. Terdapat ~readme.txt~ di setiap subdirektori tabel yang memperkenalkan
sekilas tentang isi tabel, sejarah, isu, dll. Enkoding data adalah UTF-8,
kecuali disebutkan lainnya di file README. Metadata disimpan dalam file
~meta.yaml~ (atau ~meta.json~). Keterangan perubahan ada di file bernama
~changes.txt~.

* Struktur metadata

** Metadata untuk tabel

Catatan: field yang ditandai dengan sufiks ~*~ sifatnya wajib. Nama alias bahasa
Indonesia untuk tabel dapat dilihat di direktori ~ind_alias/~ (menggunakan
symbolic link) atau di kolom ~ind_alias~.

- eng_summary :: Ringkasan tabel (satu baris, tanpa format), dalam bahasa Inggris
- ind_summary* :: idem, dalam bahasa Indonesia
- ind_alias :: Nama alias dalam bahasa Indonesia
- eng_description :: Deskripsi tentang tabel (satu s/d beberapa paragraf, dalam
  markup Org [5]), dalam bahasa Inggris
- id_description :: idem, dalam bahasa Indonesia
- source_urls ::
- eng_tags ::
- ind_tags ::
- columns :: Daftar kolom (mapping). Field metadata untuk kolom dijelaskan dalam
  subbab [[Metadata untuk kolom]].

** Metadata untuk kolom

Catatan: field yang ditandai dengan sufiks ~*~ sifatnya wajib:

- type :: Tipe data dalam format bahasa schema Sah [8]
- ind_alias ::
- eng_summary ::
- ind_summary* ::
- eng_description ::
- id_description ::
- eng_tags ::
- ind_tags ::

* Panduan gaya

** Penamaan file, tabel, kolom

1. Nama file, tabel, kolom menggunakan huruf kecil. Alasan: agar tidak
   bermasalah dengan filesystem yang case-insensitive, kita menghindari
   permainan huruf besar/kecil.

   Ini juga termasuk akronim, contoh ~html~ bukan ~HTML~, ~css~ bukan ~CSS~,
   ~js~ atau ~javascript~ bukan ~JavaScript~. Ini mencegah kebingungan singkatan
   yang kadang memiliki varian huruf besar/kecil (contoh: ~perl~ dan ~Perl~ dan
   ~PERL~).

2. Hanya gunakan huruf di karakter pertama dan huruf/garis bawah (~_~)/angka di
   karakter selanjutnya. Alasan: ini paling aman karena membuat nama bisa
   langsung dipakai sebagai nama kolom di database, nama variabel di bahasa
   pemrograman, dll. Catatan: metadata memuat juga nama alias bahasa Indonesia.

3. Gunakan kata penuh dan bukan singkatan (contoh: ~province~ bukan ~prov~, ~),
   kecuali jika singkatan sudah lazim/sering dipakai dan relatif tidak ambigu.
   Contoh yang bisa disingkat: ~ind~ untuk bahasa dan wilayah Indonesia, ~eng~
   untuk english (keduanya amat sering dipakai). ~org~ untuk organization (juga
   sering, amat mempersingkat). ~str~ untuk string, ~len~ untuk length, dll.

   Jika ragu mengenai penyingkatan, hubungi editor [4].

   Daftar lainnya:

     - min untuk minimum, minimal
     - max untuk maximum, maximal

4. Jika nama terdiri dari dua atau lebih kata, pisahkan tiap kata dengan garis
   bawah (~_~), contoh: ~paper_size~. Jangan menyatukan kata (~papersize~) atau
   menggunakan camel case (~paperSize~). Alasan: pemisahan dengan ~_~ membuat
   kata majemuk lebih mudah dibaca terutama untuk pembaca nonnatif.

   Ini juga termasuk kata-kata yang disingkat (contoh: ~str_len~ dan bukan
   ~strlen~), kecuali beberapa perkecualian yang amat jarang. Alasan: lebih
   konsisten.

5. Berikan prefiks ~ind_~ untuk entiti yang berisi data spesifik untuk
   bahasa/wilayah Indonesia (contoh: tabel ~ind_province~ berisi daftar provinsi
   di Indonesia, sementara ~province~ saja mencerminkan tabel berisi daftar
   provinsi di seluruh dunia; kolom ~ind_name~ menyatakan kolom berisi nama
   Indonesia). Sebaliknya, gunakan prefiks kolom ~eng_~ untuk data yang berisi
   bahasa Inggris.

   Pada nama alias bahasa Indonesia, akhiran ~_ind~ dan ~_ing~ dapat digunakan
   sebagai padanannya.

6. Nama file: selalu gunakan akhiran (ekstensi) file yang mencerminkan isi file.
   Contoh: ~changes.txt~ dan bukan ~changes~ saja. Alasan: Ini membantu skimming
   dan juga membantu saat bekerja di sistem operasi yang mengandalkan ekstensi
   file (seperti Windows). Perkecualian: dokumen berformat Org disimpan ke file
   berakhiran ~.txt~.

7. Gunakan bahasa Inggris (contoh: ~name~ bukan ~nama~). Ejaan American english
   lebih disukai daripada British (contoh: ~color~ bukan ~colour~, ~center~
   bukan ~centre~, ~organization~ bukan ~organisation~). Alasan: Di bahasa
   pemrograman bahasa Inggris (terutama dialek American) sangat dominan, tidak
   perduli apakah program tersebut dikembangkan oleh orang Indonesia atau luar.
   Ini memudahkan nama yang kita pilih dipakai langsung sebagai nama variabel,
   modul, dsb di bahasa pemrograman.

8. Gunakan bentuk kata tunggal (singular) dan bukan jamak (plural). Alasan:
   lebih sederhana dan menghindari aturan penjamakan bahasa Inggris (mis: apple
   -> apples tapi leaf -> leaves, sheep -> sheep, dsb). Perkecualian: kolom yang
   selalu berisi array/list, contoh ~eng_tags~.

9. Untuk tabel yang berisi nama (mis: tabel ~country~ berisi data nama negara),
   usahakan selalu memberikan nama Inggris maupun nama Indonesia, dan jika
   applicable, nama natif. Ini berguna bagi aplikasi-aplikasi bilingual.

10. Hindari pemberian nama tabel ~..._list~ atau ~list_of_...~ (atau aliasnya
    ~daftar_~) karena redundan. Contoh: ~country~ dan ~negara~, tidak perlu
    ~country_list~ atau ~daftar_negara~; ~ind_district~ dan ~kecamatan_ind~,
    tidak perlu ~list_of_ind_district~ atau ~daftar_kecamatan_ind~.

    Sekali lagi, jika ragu tentang penamaan, harap hubungi editor. Konsistensi
    penamaan amat penting bagi saya.

** Dokumen ~readme.txt~

1. Gunakan format Org [5] untuk dokumen readme. Untuk memudahkan, Anda dapat
   menyunting file menggunakan Emacs (org-mode) atau vim (menggunakan salah satu
   plugin untuk TODO)

2. Gunakan marjin kanan 80 kolom. Alasan: 80 kolom adalah marjin umum yang aman
   di semua terminal.

3. Gunakan ~TODO~ untuk menandai bagian TODO (yang akan ditulis nanti).

** File ~changes.txt~

1. Gunakan format Org.

2. Satu item list untuk satu perubahan. Berikan tanggal.

3. Entri perubahan dapat ditulis dalam bahasa Indonesia atau Inggris.

** Pesan commit

1. Boleh dalam bahasa Indonesia atau Inggris (saya memperkirakan semua
  kontributor rata-rata adalah orang Indonesia atau mereka yang kenal bahasa
  Indonesia).

2. Ikuti panduan pesan commit git yang baik di: TODO

* Jawaban pertanyaan (FAQ)

** Kenapa format Org?

Karena saya penggemar Emacs :-) Org mudah dibaca secara verbatim. Selain markup
teks, Org juga mendukung tabel, formula, struktur hirarkis. Cocok untuk membuat
dokumen terstruktur. Jika Anda mengalami kesulitan memahami format ini, jangan
ragu menghubungi penulis [4].

** Kapan merge dengan proyek Gudang-Data-Indonesia (GDI)?

Saat ini saya merasakan data di proyek GDI belum bisa langsung saya pakai untuk
menjadi sumber bagi modul-modul Perl, misalnya karena belum ada standardisasi
format, beberapa kolom yang saya perlukan belum ada, dll. Tujuan ke depan memang
merge ke GDI (jika bisa), agar tidak ada duplicated efforts.

* Tautan

[1] http://id.wikipedia.org/
[2] http://www.cpan.org/
[3] http://gdi.id-php.org/
[4] mailto:stevenharyanto@gmail.com
[5] http://orgmode.org/
[6] https://github.com/
[7] https://github.com/sharyanto/gudang-data-interim
[8] http://metacpan.org/module/Data::Sah