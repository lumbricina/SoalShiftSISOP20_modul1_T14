# SoalShiftSISOP20_modul1_T14

# Kelompok T14
- <strong>Fancista Syarif Hidayatullah    05311840000027 </strong>
- <strong>Agnes Lesmono       05311840000044 </strong>

### Soal 1 

Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

***a.*** Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

***b.*** Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

***c.*** Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.

### Soal 2

Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
tersebut cepat diselesaikan.

a. Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka.

b. Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.

c. Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan dienkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula
seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.)

d. Jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

###Pembahasan

2a dan 2b : [Source](https://github.com/lumbricina/SoalShiftSISOP20_modul1_T14/blob/master/soal2ab.sh)

Enkripsi  : [Source](https://github.com/lumbricina/SoalShiftSISOP20_modul1_T14/blob/master/soal2c.sh)

Dekripsi  : [Soorce](https://github.com/lumbricina/SoalShiftSISOP20_modul1_T14/blob/master/soal2d.sh)

``` dd if=/dev/urandom|tr -cd A-Za-z0-9|head -c 28 >> $1.txt ``` Pertama kita membuat sebuah command yang digunakan untuk men-generate random password sebanyak 28 karakter yang akan disimpan kedalam file .txt dimana file tersebut namanya telah ditulis dalam bentuk argumen.

```if [[ $1 =~ ^[a-zA-Z]+$ ]]``` Tidak lupa, kita membuat sebuah kondisi dimana input harus berupa alfabet, jika bukan maka akan ditampilkan error.

Lalu ubtuk enkripsinya, pertama kita buat 2 variabel yaitu lower (alfabet kecil) dan upper (alfabet kapital) sebagai berikut :

```
lower=abcdefghijklmnopqrstuvwxyz
lower=$lower$lower
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
upper=$upper$upper
``` 

Lalu ```name=$(echo "$1" | tr -d '.txt')``` digunakan untuk mengambil nama file (argumen) nya saja sehingga ekstensinya tidak berubah.

Untuk mengambil angka jam pada saat file dibuat, kita gunakan ```jam=$(date +"%k")```

```rename=$(echo $name | tr "${upper:0:26}${lower:0:26}" "${upper:$jam:26}${lower:$jam:26}")``` digunakan untuk melakukan Caesar Cipher pada nama file. Bagian upper untuk mengambil substring huruf kapital, bagian lower untuk mengambil subbstring huruf kecil, dan bagian jam untuk mengambil substring sesuai jam.

Lalu, perintah untuk mengubah nama file ```mv $1 $rename.txt```

Yang terakhir, untuk bagian dekripsi, sebenarnya sama dengan enkripsi. Kita tinggal membalik set pertama dan kedua sehingga pergeserannya terbalik dan nama akan kembali seperti sebelum ter-enkripsi.

``` time=$(stat -c %y $1 | grep -oP '(?<=[^ ] ).*(?=:.*:)')``` digunakan untuk mengambil data jam saat file sebelumnya diakses atau dibuat.

### Soal 3

1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing.

a. Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log". Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan

b. Setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi.

c. Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan  dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak". Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location".
*Gunakan Bash, Awk dan Crontab
