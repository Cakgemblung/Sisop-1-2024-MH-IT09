# Sisop-1-2024-MH-IT09

| Nama          | NRP          |
| ------------- | ------------ |
| Kevin Anugerah Faza | 5027231027 |
| Muhammad Hildan Adiwena | 5027231077 |
| Nayyara Ashila | 5027231083 |

## Soal 1

```
wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0' -O Sandbox.csv
```
Fungsi diatas untuk mendownload file dari link yang telah tersedia.
```
(awk -F',' 'NR>1 {penjualan[$6] += $17} END {for (customer in penjualan) print penjualan[customer], customer}' Sandbox.csv | sort -nr | head -1)
```
Fungsi diatas untuk memperlihatkan penjualan tertinggi.
```
(awk -F',' 'NR>1 {profit[$7] += $20} END {for (segment in profit) print profit[segment], segment}' Sandbox.csv | sort -t',' -k1,1n | head -1)
```
Fungsi command diatas untuk memperlihatkan total profit terendah.
```
(awk -F',' 'NR>1 {profit[$14] += $20} END {for (category in profit) print profit[category], category}' Sandbox.csv | sort -t',' -k1,1nr | head -3)
```
Fungsi command diatas untuk memperlihatkan 3 besar yang memperoleh profit tertinggi.
```
grep 'Adriaens' Sandbox.csv | awk -F ',' '{print $2, $6, $17}'
```
Fungsi command diatas untuk memperlihatkan detail pesanan Adriaens grayland.

## Soal 2
### 2A)
Pada soal ini kita diminta untuk membuat program login.sh dan register.sh

![Screenshot 2024-03-30 124531](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/7cadd862-0775-4e0e-a7a9-afd6763c119f)

Disini saya membuat sebuah folder terlebih dahulu dengan nama "sisop2" 
Kemudian menggunakan command `nano register.sh` dan `nano login.sh` untuk membuat program di dalam file tersebut

### 2B)
Pada soal ini diminta untuk membuat setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password

Sebelum ini, saya mengalami sedikit error seperti dibawah ini

![Screenshot 2024-03-30 122908](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/e0a1b99c-0eb5-44f0-94df-530997ca358a)

berikut isi filenya

![Screenshot 2024-03-30 122814(1)](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/0b905bdd-039a-413a-8ecc-e2637571cb5b)

ternyata penyebabanya karena terdapat `: "` yang belum terhapus, sehingga setelah saya perbaiki maka terbuatlah halaman registernya.

Berikut tampilan dari halaman Register kami

![Screenshot 2024-03-30 133216](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/0be2eac6-62ad-42ed-97e8-5287c0c36270)

kemudian ini code yang digunakan

```
echo "                                        "
echo "========================================"
echo "===WELCOME TO OUR SYSTEM REGISTRATION==="
echo "========================================"
echo "

#Memasukkan informasi registrasi pengguna
read -p "Enter your email                   : " email
read -p "Enter your username                : " username
read -p "Enter a security question          : " security_question
read -p "Enter the answer to security answer: " security_answer
```
Fungsi `echo` untuk menampilkan sebuah kalimat, kemudian `read -p "Enter your email: " email` berguna untuk memasukkan email pengguna ke dalam data dari email-email yang lain, begitu juga seterusnya.

### 2C)
Soal ini meminta untuk username yang dibuat bebas, namun email bersifat unique. setiap email yang mengandung kata admin akan dikategorikan menjadi admin 

![Screenshot 2024-03-30 130221](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/9f75600a-d894-4832-a81c-07ace64de73f)

pada gambar diatas terlihat bahwa jika kita login sebagai admin akan dikategorikan sebagai admin

### 2D)
Soal memnita untuk:
- Password tersebut harus di encrypt menggunakan base64
- Password yang dibuat harus lebih dari 8 karakter
- Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil
- Harus terdapat paling sedikit 1 angka
Berikut adalah code yang digunakan:

```
#Mengekripsi password 
encrypt_password() {
echo -n "$1" | base64
}
```

Fungsi `encrypt_password()` untuk mengenkripsi password menggunakan algoritma encoding Base64 seperti yang diminta soal.

```
#Memeriksa apakah password memenuhi persyaratan yang diminta
 if [ ${#password} -lt 8 ] || ! grep -q [[:lower:]] <<< "$password" || ! grep -q [[:upper:]] <<< "$password" || ! grep -q [[:digit:]] <<< "$password"; then
   echo "Password must be more than eight characters, have at least one capital letter, one lowercase letter, and one number"
     else
        valid_password=true
      fi
    done
```

karena ketentuan password adalah 8 huruf, mengandung huruf kapital dan huruf kecil makan kita menggunakan code tersebut kemudian apabila password tersebut tidak memenuhi ketentuan maka pengguna diminta untuk mengisi kembali password nya. 
Berikut tampilan pada halaman register

![Screenshot 2024-03-30 134639](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/fb50cf6f-ff6e-4d05-bb9d-f33c02d17247)

### 2E)
Soal ini meminta untuk membuat folder users file users.txt. Di dalam file tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.
Untuk menampilkan folder tersebut saya memakai command `cat users.txt`
Berikut tampilannya

![Screenshot 2024-03-30 135109](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/09224302-8efc-435d-8504-4ce441d9b59d)

### 2F)
Soal ini meminta setelah register, data tersebut harus bisa login dengan menggunakan email dan password
Berikut code yang digunakan
```
echo "1. Login"
echo "2. Forgot Password"
read -p "Pilih menu: " choice

case "$choice" in
    1)
        # Meminta pengguna untuk memasukkan informasi login
        read -p "Masukkan email: " email

        # Mencari pengguna dalam file users.txt
        user_info=$(grep "^$email:" users.txt)

        if [ -z "$user_info" ]; then
            log "LOGIN FAILED" "ERROR Failed login attempt on user with email $email"
            failure_message
            exit 1
        fi

        # Meminta pengguna untuk memasukkan password
        read -sp "Masukkan password: " password
        echo

        # Memeriksa password
        stored_password=$(cut -d ':' -f 5 <<< "$user_info")
        if [[ "$(echo -n "$password" | base64)" != "$stored_password" ]]; then
            log "LOGIN FAILED" "ERROR Failed login attempt on user with email $email"
            failure_message
            exit 1
        fi

        # Memeriksa peran pengguna
        role=$(cut -d ':' -f 6 <<< "$user_info")

        # Jika pengguna adalah admin
        if [ "$role" == "admin" ]; then
            log "LOGIN SUCCESS" "Admin logged in successfully"
            echo "Login berhasil sebagai admin."
            # Panggil admin_menu di sini
            admin_menu
        else
log "LOGIN SUCCESS" "User with email $email logged in successfully"
            echo "Login berhasil sebagai user."
        fi

        success_message
        ;;
    2) 
        read -p "Masukkan email: " email
        security_question
        ;;
    *)
        echo "Pilihan tidak valid"
        ;;
esac
```

`read -p` berfungsi untuk mencetak kalimat yang diminta, kemudian `user_info=$(grep "^$email:" users.txt)` berfungsi untuk mencari informasi pengguna dalam file users.txt yang cocok dengan alamat email yang dimasukkan. Fungsi `stored_password=$(cut -d ':' -f 5 <<< "$user_info")` untuk mendapatkan kata sandi yang tersimpan dari informasi pengguna yang ditemukan dalam file users.txt.
Kemudian `role=$(cut -d ':' -f 6 <<< "$user_info")` berfungsi unntuk mencari peran (role) dari pengguna melalui informasi pengguna yang ditemukan dalam file users.txt.
Dan `if [ "$role" == "admin" ];` Memeriksa apakah pengguna adalah admin atau bukan. Jika admin, pesan log akandicatat menggunakan fungsi log(), akan dicetak pesan berhasil, dan memanggil fungsi admin_menu. Jika bukan admin, pesan log dicatat menggunakan fungsi log() dan mencetak pesan berhasil.

Berikut adalah tampilan hasil loginnya

![Screenshot 2024-03-30 140722](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/e845bc99-f24f-484e-8811-89e7bb44a208)

### 2G)
Kemudian di soal tsb diminta apabila Oppie lupa password, maka ada opsi untuk menampilkan passwordnya
Berikut adalah codenya
```
security_question() {
    user_info=$(grep "^$email:" users.txt)
    security_question=$(cut -d ':' -f 3 <<< "$user_info")
    correct_answer=$(cut -d ':' -f 4 <<< "$user_info")

    read -p "$security_question: " user_answer

    if [ "$user_answer" == "$correct_answer" ]; then
        password=$(cut -d ':' -f 5 <<< "$user_info" | base64 -d)
        echo "Your Pasword: $password"
        log "FORGOT PASSWORD SUCCESS" "User with email $email retrieved forgotten password"
    else
        echo "Your answer wrong!! Failed Login"
        log "FORGOT PASSWORD FAILED" "ERROR Failed attempt to retrieve forgotten password on user with email $email"
        exit 1
    fi
}
```
Fungsi `user_info=$(grep "^$email:" users.txt)` digunakan untuk mencari informasi pengguna yang sesuai dengan alamat email yang dimasukkan taadi, dengan menggunakan perintah grep untuk mencari baris dalam file users.txt yang dimulai dengan alamat email yang tepat.
Fungsi `security_question=$(cut -d ':' -f 3 <<< "$user_info")` adalah setelah informasi pengguna ditemukan, baris ini mengambil pertanyaan keamanan dari informasi pengguna tersebut. Informasi pengguna ini dibagi menjadi beberapa bagian terpisah oleh tanda titik dua (kolon), dan yang ketiga adalah pertanyaan keamanan.
Fungsi `correct_answer=$(cut -d ':' -f 4 <<< "$user_info")` ini mengambil jawaban yang benar dari informasi pengguna yang dimasukkan.
Kemudian fungsi `if [ "$user_answer" == "$correct_answer" ];` untuk struktur pengkondisian yang membandingkan jawaban yang dimasukkan oleh pengguna dengan jawaban yang benar yang diambil dari informasi pengguna. Jika jawaban pengguna benar maka akan dijalankan perintah selanjutnya.
Jika jawaban pengguna salah dari jawaban yang sudah diinput sebelumnya, maka bagian else akan dieksekusi `echo Your answer wrong!! Failed Login"` Pesan ini akan dicetak ke layar memberitahu pengguna bahwa jawaban mereka salah.

Berikut adalah tampilannya

![Screenshot 2024-03-30 143840](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/df6a6b92-6e22-4c57-a6ec-02e0edeb9fe4)

### 2H)
Soal meminta untuk setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login dia dapat menambah, mengedit (username, pertanyaan keamanan dan jawaban, dan password), dan menghapus user

### 2I)

### 2J)
Oppie ingin mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register. 

Berikut code yang digunakan
```
#Fungsi untuk mencatat log ke dalam file auth.log
log() {
    echo "[$(date '+%d/%m/%Y %H:%M:%S')] [$1] $2" >> auth.log
}
```
saya menggunakan `log()` Ini adalah deklarasi sebuah fungsi bernama log yang akan mencatat pesan log ke dalam file auth.log
code `echo "[$(date '+%d/%m/%Y %H:%M:%S')] [$1] $2" >> auth.log` Ini adalah perintah yang akan menampilkan pesan log ke dalam file auth.log seperti yang diminta soal

Untuk menampilkan folder tersebut saya memakai command `cat auth.log`1
Berikut adalah tampilannya

![Screenshot 2024-03-30 144939](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/80327619/ae521bc3-1cb0-45eb-a294-87a205c365ce)



## Soal 3
### - 3a)
#### awal.sh
Untuk menjawab soal pada poin 3a, berikut ini adalah code yang kami gunakan.
```
firstcontact() {
    wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN" -O genshin.zip
    unzip genshin.zip
    unzip genshin_character.zip
}
```
Fungsi `firstcontact` diatas digunakan untuk melakukan download dan ekstrak dari link yang telah disediakan. `wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN" -O genshin.zip`
digunakan untuk melakukan download dari link yang disediakan dan menyimpannya dalam file zip bernama genshin. Sedangkan `unzip genshin.zip` dan `unzip genshin_character.zip` digunakan untuk melakukan ekstraksi pada file yang telah didownload sebelumnya.
```
decmove() {
    sourcepath="genshin_character"
    csv_source="list_character.csv"
    
    for file in "$sourcepath"/*; do
        if [ -f "$file" ]; then
            raw_name=$(basename -- "$file")
            decrypt=$(echo -n "$raw_name" | xxd -r -p)
            extension="${file##*.}"
            mv "$file" "$sourcepath/$decrypt.${extension}"
        fi
    done
    # Baca data csv
    IFS=$'\n' read -d '' -a csvname < <(tail -n +2 "$csv_source")

    for row in "${csvname[@]}"; do
        name=$(echo "$row" | awk -F, '{print $1}')
        region=$(echo "$row" | awk -F, '{print $2}')
        element=$(echo "$row" | awk -F, '{print $3}')
        weapons=$(echo "$row" | awk -F, '{print $4}')
        
        # Mencocokkan data decrypt dan csv
        file=$(find "$sourcepath" -type f -name "${name}.jpg")

        if [ -n "$file" ]; then
            # Ubah name
            new_name="${region} - ${name} - ${element} - ${weapons}.jpg"
            cleaned_name=$(echo "${new_name}" | tr -d '\r')
            mv "$file" "$sourcepath/$cleaned_name"

            # Buat folder region (double check)
            regdir="${sourcepath}/${region}"
            if [ ! -d "$regdir" ]; then
                mkdir -p "$regdir"
            fi

            # Pindah file
            mv "$sourcepath/$cleaned_name" "$regdir/${cleaned_name}"
        fi
    done
}
```
Pada fungsi `decmove` diatas saya gunakan untuk menjawab bagian selanjutnya dari soal. Awalnya saya membuat variabel `sourcepath` dan `csv_source` yang merujuk pada folder genshin_character dan file list_character.csv. Kemudian saya menggunakan `for`  untuk iterasi setiap file dalam folder sourcepath. `if [ -f "$file" ]; then` digunakan untuk memeriksa apakah file yang sedang diiterasi adalah file/direktori. `raw_name=$(basename -- "$file")` digunakan untuk mengambil nama file tanpa mengikutkan ekstensinya. Selanjutnya saya melakukan decrypt dari hex menggunakan `decrypt=$(echo -n "$raw_name" | xxd -r -p)`. Saya gunakan `extension="${file##*.}"` untuk mengambil ekstensinya saja.  `mv "$file" "$sourcepath/$decrypt.${extension}"` digunakan untuk memindah file ke direktori sourcepath dengan nama yangtelah didecrypt dengan ekstensi yang telah diambil.

Berikutnya digunakan `IFS=$'\n' read -d '' -a csvname < <(tail -n +2 "$csv_source")` untuk membaca data dari file csv ke dalam `csvfile`. Pada loop berikutnya saya gunakan untuk mengiterasi dalam array csvname dan melakukan pengambilan `name,region,element, dan weapons` menggunakan`awk`. `file=$(find "$sourcepath" -type f -name "${name}.jpg")` digunakan untuk mencari file dan langkah berikutnya akan mengubah nama file, membuat region folder jika belum ada dan memindahkan file ke folder region tersebut.
### - 3b)
#### awal.sh
Untuk menjawab soal pada poin ini saya membuat fungsi tambahan yakni `weaponbearer` yang nantinya akan memberikan output berupa jumlah senjata yang dibawa oleh setiap karakter dan juga `remove` untuk membersihkan file yang tidak digunakan.
```
weaponbearer() {
    sourcepath="genshin_character"
    weaponkind="Bow Claymore Catalyst Polearm Sword"
    for weapon in $weaponkind; do
        count=$(find "$sourcepath" -name "*$weapon*"*".jpg" | wc -l)
        echo "$weapon : $count"
    done
}
remove() {
    rm list_character.csv genshin.zip genshin_character.zip
}
```
Pembuatan fungsi yang berisi fungsi-fungsi yang telah dibuat tadi untuk kemudian dijalankan ketika program dieksekusi.
```
# Fungsi utama
projectsherlock() {
    firstcontact
    decmove
    weaponbearer
    remove
}

# Call fungsi
projectsherlock
```
Berikut ini adalah contoh hasil output dari code yang dijalankan
![Screenshot 2024-03-30 190250](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/b2b4e6c0-2e86-4f7b-ab15-9adfb0558d74)
![Screenshot 2024-03-30 190307](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/358d2ffa-7deb-40a4-8b55-e694100b4a6b)
![Screenshot 2024-03-30 190236](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/e796ba19-772f-4d91-a6cf-db338471d8ef)

### - 3c,d,e)
#### search.sh
Pada 3 poin ini dapat dilakukan dengan membuat file search.sh yang digunakan untuk melakukan ekstraksi steghide yang terenkripsi. Namun perlu diketahui lebih lanjut bahwa ketika saya menggunakan enkripsi hex seperti yang diminta soal maka hasil yang diinginkan maka program tidak berhasil. Kemudian setelah melakukan analisa lebih lanjut, decrypt data dapat dilakukan dengan penggunaan base64 dan bukan hex. 
```
finalblow() {
    regions=("Mondstat" "Liyue" "Sumeru" "Fontaine" "Inazuma")
    touch image.log
    logfile="image.log"
}

sherlock() {
    local region="$1"
    for pict in "genshin_character/$region"/*jpg; do
        if [ -f "$pict" ]; then
            img_rn=$(basename "$pict")
            steghide extract -sf "$pict" -p "" -xf "${img_rn%.jpg}.txt"
            decrypted=$(cat "${img_rn%.jpg}.txt" | base64 --decode)
            curtime=$(date '+%d/%m/%y %H:%M:%S')

            if [[ "$decrypted" == *http* ]]; then
                wget --no-check-certificate "$decrypted"
                echo "[$curtime] [FOUND] $pict" >> "$logfile"
                exit 0
            else
                echo "[$curtime] [NOT FOUND] $pict" >> "$logfile"
                rm "${img_rn%.jpg}.txt"
            fi
        fi
    done
}

finalblow

for region in "${regions[@]}"; do
    sherlock "$region"
done
```
Pada code diatas saya menggunakan cara yang mirip yaitu menggunakan `for` loop untuk melakukan iterasi pada file dalam folder region untuk kemudian dilakukan decrypt dan proses lebih lanjut.

Berikut ini adalah hasil dari code yang dijalankan
![Screenshot 2024-03-30 190326](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/cd762bb9-686d-4b06-be8a-2827c39deed5)
![Screenshot 2024-03-30 190344](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/274c1f94-1851-49a5-a3d4-b0650272cf56)
![Screenshot 2024-03-30 190416](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/fc0a83c3-9d53-4150-ab57-96226b336226)

## Soal 4
Pada soal ini kita diminta untuk membuat monitoring resources dari suatu directory. Menggunakan command `free -m` untuk memeriksa ram dan `du -sh <target_path>` untuk memeriksa disk. Path directory yang akan dimonitor adalah `/home/{user}`

### - 4a)
#### minute_log.sh
Pada soal ini kita diminta untuk memasukkan semua metrics yang diperiksa ke dalam suatu file log dengan format `metrics_{YmdHms}.log`. Berikut ini adalah code yang digunakan untuk menyelesaikannya
```
directorypath="/home/azrael"
time=$(date +"%Y%m%d%H%M%S")

metrics(){
    rammet=$(free -m | sed -n '2{s/ \+/ /gp}' | cut -d ' ' -f 2-)
    swapmet=$(free -m | sed -n '3{s/ \+/ /gp}' | cut -d ' ' -f 2-)
    sizemet=$(du -sh "/home/azrael" | sed 's/\t.*//')
}

metrics

echo "$rammet","$swapmet","/home/azrael","$sizemet" | tr ' ' ',' >> "/home/azrael/log/metrics_${time}.log"
```
Code diawali dengan inisiasi `directorypath` dan juga `time` sesuai dengan yang diminta oleh soal. Kemudian fungsi `metrics` digunakan untuk mengumpulkan dan memilah data untuk nantinya akan ditampilkan dan disimpan ke dalam file bernama `metrics_${time}.log`. Fungsi metrics dipanggil dan nantinya akan disimpan sesuai pada direktori `/home/{user}/log`.
### - 4b)
#### crontab
Untuk menjawab soal ini saya menggunakan `crontab` agar script diatas dapat berjalan setiap menit.
```
*/1 * * * * /home/azrael/sisop/modul1/soal4/minute_log.sh
```
Berikut ini adalah hasil dari code tersebut
![Screenshot 2024-03-30 114259](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/6d794092-38a8-445a-a074-f11978ac6d84)

### - 4c)
#### aggregate_minutes_to_hourly_log.sh
Pada soal ini kami diminta untuk membuat sebuah script agregasi file log ke satuan jam dimana nantinya script ini akan memiliki info dari file log yang tergenerate setiap menitnya. Pada script ini juga harus terdapat nilai minimum, maximum, dan rata-rata tiap metrics.
Berikut ini adalah code yang telah kami buat
```
#!/bin/bash

timestamp=$(date +"%Y%m%d%H")
logfiles="/home/azrael/log/metrics_agg_${timestamp}.log"

declare -A min_values
declare -A max_values
declare -A total_values

metrics=("mem_total" "mem_used" "mem_free" "mem_shared" "mem_buff" "mem_available" "swap_total" "swap_used" "swap_free")

for metric in "${metrics[@]}"; do
    min_values["$metric"]=99999999
    max_values["$metric"]=0
    total_values["$metric"]=0
done

count=0
path="/home/azrael"
path_size="6.2G"

for logfile in /home/azrael/log/metrics_*.log; do
    while IFS=',' read -r mem_total mem_used mem_free mem_shared mem_buff mem_available swap_total swap_used swap_free _ _; do
        ((count++))

        for i in "${!metrics[@]}"; do
            metric=${metrics[$i]}
            value=${!metric}

            ((value < min_values["$metric"])) && min_values["$metric"]=$value
            ((value > max_values["$metric"])) && max_values["$metric"]=$value

            total_values["$metric"]=$((total_values["$metric"] + value))
        done
    done < "$logfile"
done

echo -e "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "$logfiles"
echo -n "minimum," >> "$logfiles"
for metric in "${metrics[@]}"; do
    echo -n "${min_values["$metric"]}," >> "$logfiles"
done
echo "$path,$path_size" >> "$logfiles"

echo -n "maximum," >> "$logfiles"
for metric in "${metrics[@]}"; do
    echo -n "${max_values["$metric"]}," >> "$logfiles"
done
echo "$path,$path_size" >> "$logfiles"

echo -n "average," >> "$logfiles"
for metric in "${metrics[@]}"; do
    avg_value=$((total_values["$metric"] / count))
    echo -n "$avg_value," >> "$logfiles"
done
echo "$path,$path_size" >> "$logfiles"
```
Code diawali dengan deklarasi `timestamp` dan juga `logfiles`. Kemudian dilakukan deklarasi array asosiatif untuk menyimpan nilai max. min, dan total. Daftar metrik yang akan diproses didaftarkan dengan `metrics=()` untuk kemudian diinisialisasi nilai minimum, maksimum, dan totalnya. Kemudian dilakukan `for` loop untuk menyelesaikan langkah langkah lebih lanjut. Saya menggunakan angka statis untuk `path_size` karena pada beberapa percobaan hasil yang dikeluarkan selalu sama.

Agar code dapat dijalankan setiap jamnya maka menambahkan konfigurasi berikut pada `crontab`
```
0 * * * * /home/azrael/soal_4/aggregate_minutes_to_hourly_log.sh
```
### -4d)
#### aggregate_minutes_to_hourly_log.sh
Agar izin hanya bisa dibaca oleh user pemilik file menggunakan command berikut
```
chmod 600 "$logfiles"
```
Berikut ini adalah hasil dari code tersebut
![Screenshot 2024-03-30 114215](https://github.com/Cakgemblung/Sisop-1-2024-MH-IT09/assets/144968322/1e693f69-3637-4227-8db3-6c1b29f931ae)
