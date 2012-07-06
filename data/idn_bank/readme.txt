# -*- Mode: org -*-

* Tentang tabel ini

Tabel ini berisi daftar bank/institusi finansial di Indonesia. Tujuan utama
tabel ini adalah menyediakan kode BIC/SWIFT, ATM Bersama, dan sejenisnya.

** Sejarah

- [2012-07-06 Fri] Sumber data awal diambil dari KlikBCA (form transfer
  antarbank dalam negeri) dan dinormalisasi sbb:
  + semua dikapitalisasi
  + tanda kurung dibuang (mis: PT. BANK TABUNGAN SYARIAH (BTPN) menjadi PT. BANK
    TABUNGAN SYARIAH)
  + record BANK INDONESIA (FINNET) dibuang
  + record duplikat (?) PT. BANK PEMBANGUNAN DAERAH JABAR dibuang
  + record yang terpotong dipulihkan (mis: PT. BANK RABOBANK INTERNATIONAL IND)
  + sebelum koma tidak ada spasi
  + sesudah PT semua pakai spasi
  + sebelum akhiran TBK tidak ada spasi, setelah TBK ada titik
  + sebelum akhiran NA ada spasi (contoh: CITIBANK, BA)
- [2012-07-06 Fri] tambah kolom nickname (belum lengkap semua). kolom ini unik,
  kriteria penamaan: semua kata disatukan kecuali sufiks "_syariah", nama
  propinsi (mis: "bpd_jateng"). umumnya "bank" tidak perlu ditambahkan lagi,
  mis: "RABOBANK" menjadi "rabo". sufiks "_syariah" selalu di belakang (mis: PT.
  BANK SYARIAH MANDIRI TBK. tetap menjadi mandiri_syariah).
- [2012-07-06 Fri] tambah BPR (baru satu, BPR KS)
- [2012-07-06 Fri] tambah data kode ATM Bersama dari blog di web

* Isu
- Data saat ini belum mendekati lengkap.
- TODO: Kode BIC/SWIFT.
* Taut
