# SoalShift_modul1_D06

1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. 	Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Hint: Base64, Hexdump

      ### Source Code :

      [Source Code](/soal1.sh)

      ### Jawab :

      1. Pembuatan Script decrypt

      proses untuk mendecrypt :
       - ekstrak file .zip
       - decode semua file dalam folder nature dengan menggunakan `base64 -d`
       - hexdump reverse semua file dalam folder nature dengan menggunakan  `xxd -r`
       - archive folder nature menjadi folder zip yang bernama nature.zip

      2. buat cronjob yang menjalankan script decrypt yang sebelumnya sudah dibuat

      14 14 *  2  5   /bin/bash /directory/to/script/soal1.sh
      14 14 14 2  *   /bin/bash /directory/to/script/soal1.sh

2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
       
   a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.

   b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.

   c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b
      
      ### Source Code :

      [Source Code](/soal2.sh)

      ### Jawab :
      
      a. menghitung jumlah quantity dari tiap negara pada tahun 2012
      
       echo "a."; awk -F ',' '{if($7=='2012') y[$1]+=$10} END {for(i in y) {print y[i]" "i}}' ~/modul1/bahan/WA_Sales_Products_2012-14.csv | sort -nr | head -1
       
      b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
      
       echo "b."; awk -F, '{if($1=="United States" && $7=="2012") y[$4]+=$10;} END {for(i in y) print y[i]","i}' ~/modul1/bahan/WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2}'
      
      c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b
       
       echo "c."; awk -F, '{if($1=="United States" && $7=="2012" && ($4=="Personal Accessories" || $4=="Camping Equipment" || $4=="Outdoor Protection")) y[$6]+=$10;} END {for(i in y) print y[i]","i}' ~/modul1/bahan/WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2}'


3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
       
   (a) Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
   
   (b) Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
   
   (c) Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
   
   (d) Password yang dihasilkan tidak boleh sama
   
   ### Source Code :

   [Source Code](/soal3.sh)

   ### Jawab :
   
   1. Mengecek dan memastikan password yang digenerate beda dengan yang sudah ada
       a. generate password
       
       b. dapatkan daftar password yang sudah dibuat sebelumnya dengan mengambil dari file 'password*.txt'.
       
       c. cek password baru apakah benar benar baru dengan semua password yang sudah ada di dalam file. jika masih ditemukan password yang sama maka kembali ke poin dan jika tidak ditemukan password yang sama maka password baru tersebut valid.
       
   2. Mencari nama file yang tepat sesuai urutan
   
   3. generate file baru yang berisi password yang valid tersebut
   

4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
   (a) Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.

   (b) Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.

   (c) setelah huruf z akan kembali ke huruf a

   (d) Backup file syslog setiap jam

   (e) dan buatkan juga bash script untuk dekripsinya.
   
   ### Source Code :

   [Source Code](/soal4.sh)

   ### Jawab :
   
   1. Proses Backup dan Enkripsi :
       a. generate nama file yang memenuhi dengan mengambil data waktu pada saat backup dilakukan dengan menggunakan `date '+%H:%M %d-%m-%Y'`
       
       b. gunakan jam sebagai patokan dalam proses enkripsi dengan menggunakan `date '+%H'`
       
       c. lakukan proses enkripsi dengan data jam sebagai patokan dan simpan dengan nama file yang sbelumnya sudah digenerate
       
       d. membuat cronjob
       
       ```    
       0 * * * * /bin/bash /directory/to/script/soal4.sh
       ```
       
   2. Proses Decrypt :
       a. gunakan data jam yang terdapat pada nama file untuk patokan dalam deskripsi
       
       b. lakukan proses decry

5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:
       
   (a) Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
   
   (b) Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
   
   (c) Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
   
   (d) Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
