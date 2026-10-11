#===============================================================
# PROGRAM   : Menghitung & Membandingkan Luas 2 Buah Lingkaran
# BAHASA    : MIPS Assembly (kompatibel MARS Simulator)
#
# DESKRIPSI :
#   Program menerima 2 buah bilangan bulat positif (Diameter1,
#   Diameter2), menghitung luas masing-masing lingkaran dengan
#   rumus:
#       Luas = phi x Diameter^2 / 4      (phi diambil = 3)
#   lalu membandingkan kedua luas dan menentukan kategori:
#       - Luas1 < Luas2  -> "LINGKARAN 1 LEBIH KECIL"
#       - Luas1 = Luas2  -> "KEDUA LINGKARAN SAMA"
#       - Luas1 > Luas2  -> "LINGKARAN 1 LEBIH BESAR"
#
#   Struktur program terdiri dari program utama yang memanggil
#   3 prosedur: MASUKAN, HITUNG, dan KELUARAN.
#
#   Program terus berjalan (looping) menerima input baru sampai
#   nilai Diameter1 yang dimasukkan = 5005 (sinyal keluar program).
#
# CATATAN IMPLEMENTASI:
#   - SEMUA proses perkalian (D x D, maupun phi x hasil) dilakukan
#     dengan PENJUMLAHAN BERULANG (looping), TIDAK menggunakan
#     instruksi mult/mul.
#   - Pembagian dengan 4 menggunakan instruksi div.
#   - Hasil pembagian otomatis dibulatkan ke bawah karena memakai
#     bilangan bulat (integer division di MIPS membuang sisa).
#===============================================================

.data
    # ---------- Banner / identitas kelompok ----------
    banner:         .asciiz "===================================\n  PROGRAM LUAS 2 LINGKARAN - MIPS  \n===================================\nSE-49-02 \n"
    daftar_nama:    .asciiz "Muhammad Febryan Akbar   103022500107\nDiaz Surya Ramadhan    103022500109\nDanish Raditya Rabbani   103022530004\nFauzan Nur Hafizh Y   103022500053\n"
    petunjuk:       .asciiz "\nPetunjuk program:\n- Masukkan Diameter Lingkaran 1 dan Lingkaran 2 (bilangan bulat > 0)\n- Program menghitung luas tiap lingkaran & kategorinya\n- Untuk KELUAR dari program, masukkan angka 5005 saat diminta Diameter 1\n===================================\n\n"

    # ---------- Prompt input ----------
    prompt_d1:      .asciiz "Masukkan Diameter Lingkaran 1 : "
    prompt_d2:      .asciiz "Masukkan Diameter Lingkaran 2 : "

    # ---------- Pesan error ----------
    err_negatif:    .asciiz "Bilangan tidak boleh negatif atau nol! Silakan masukkan kembali.\n"

    # ---------- Output hasil ----------
    msg_luas1:      .asciiz "Luas Lingkaran 1  = "
    msg_luas2:       .asciiz "Luas Lingkaran 2  = "
    msg_kategori:   .asciiz "Kategori          = "
    newline:        .asciiz "\n"
    garis:          .asciiz "-----------------------------------\n"

    # ---------- String kategori ----------
    kat_kecil:      .asciiz "LINGKARAN 1 LEBIH KECIL"
    kat_sama:       .asciiz "KEDUA LINGKARAN SAMA"
    kat_besar:      .asciiz "LINGKARAN 1 LEBIH BESAR"

    # ---------- Pesan keluar ----------
    msg_exit:       .asciiz "\nProgram selesai. Terima kasih!\n"

    # ---------- Variabel global (dipakai antar prosedur) ----------
    diameter1:      .word 0
    diameter2:      .word 0
    luas1:          .word 0
    luas2:          .word 0
    kategori_ptr:   .word 0     # menyimpan alamat string kategori

.text
.globl main

#===============================================================
# PROGRAM UTAMA
# Menampilkan banner identitas, lalu terus memanggil ketiga
# prosedur (MASUKAN -> HITUNG -> KELUARAN) sampai user
# memasukkan 5005 sebagai Diameter 1.
#===============================================================
main:
    li   $v0, 4
    la   $a0, banner
    syscall

    li   $v0, 4
    la   $a0, daftar_nama
    syscall

    li   $v0, 4
    la   $a0, petunjuk
    syscall

loop_utama:
    jal  MASUKAN        # panggil prosedur input (bisa keluar dari sini jika 5005)
    jal  HITUNG         # panggil prosedur hitung luas & kategori
    jal  KELUARAN       # panggil prosedur tampilkan hasil
    j    loop_utama

program_selesai:
    li   $v0, 4
    la   $a0, msg_exit
    syscall

    li   $v0, 10        # syscall exit
    syscall


#===============================================================
# PROSEDUR: MASUKAN
# Tugas   : Menerima input Diameter1 & Diameter2 dari user,
#           sekaligus memeriksa kesesuaian bilangan (harus > 0).
#           Jika Diameter1 == 5005 -> program langsung diakhiri.
# Output  : menyimpan nilai valid ke variabel global diameter1
#           dan diameter2.
#===============================================================
MASUKAN:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

input_d1:
    li   $v0, 4
    la   $a0, prompt_d1
    syscall

    li   $v0, 5         # baca integer
    syscall
    move $t0, $v0       # $t0 = nilai diameter1 yang dibaca

    beq  $t0, 5005, keluar_dari_masukan   # cek sinyal keluar program

    blez $t0, d1_salah    # jika diameter1 <= 0 -> error, input ulang
    j    simpan_d1

d1_salah:
    li   $v0, 4
    la   $a0, err_negatif
    syscall
    j    input_d1

simpan_d1:
    sw   $t0, diameter1

input_d2:
    li   $v0, 4
    la   $a0, prompt_d2
    syscall

    li   $v0, 5
    syscall
    move $t1, $v0       # $t1 = nilai diameter2 yang dibaca

    blez $t1, d2_salah    # jika diameter2 <= 0 -> error, input ulang
    j    simpan_d2

d2_salah:
    li   $v0, 4
    la   $a0, err_negatif
    syscall
    j    input_d2

simpan_d2:
    sw   $t1, diameter2

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

keluar_dari_masukan:
    addi $sp, $sp, 4    # bersihkan stack (tidak jadi dipakai)
    j    program_selesai


#===============================================================
# PROSEDUR: HITUNG
# Tugas   : Menghitung luas tiap lingkaran = phi x D^2 / 4
#           (phi = 3) dan menentukan kategori perbandingan.
#           Seluruh perkalian dilakukan dengan penjumlahan
#           berulang (looping), bukan instruksi mult.
# Output  : menyimpan hasil ke variabel global luas1, luas2,
#           dan kategori_ptr.
#===============================================================
HITUNG:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    lw   $t0, diameter1     # $t0 = D1
    lw   $t1, diameter2     # $t1 = D2

    # ---------- Hitung luas lingkaran 1 = 3 x D1 x D1 / 4 ----------
    move $t2, $t0           # nilai yang dijumlahkan berulang
    move $t3, $t0           # counter perulangan (sebanyak D1 kali)
    li   $t4, 0             # akumulator hasil D1 x D1
kuadrat_d1:
    beq  $t3, $zero, selesai_kuadrat_d1
    add  $t4, $t4, $t2
    addi $t3, $t3, -1
    j    kuadrat_d1
selesai_kuadrat_d1:
    # $t4 = D1^2 ; sekarang kalikan dengan phi (=3) via penjumlahan berulang
    li   $t5, 0             # akumulator phi x D1^2
    li   $t6, 3             # counter perulangan sebanyak phi (3) kali
kali_phi_d1:
    beq  $t6, $zero, selesai_kali_phi_d1
    add  $t5, $t5, $t4
    addi $t6, $t6, -1
    j    kali_phi_d1
selesai_kali_phi_d1:
    li   $t7, 4
    div  $t5, $t7
    mflo $t8                # $t8 = luas1 (hasil bagi, otomatis dibulatkan ke bawah)
    sw   $t8, luas1

    # ---------- Hitung luas lingkaran 2 = 3 x D2 x D2 / 4 ----------
    move $t2, $t1
    move $t3, $t1
    li   $t4, 0
kuadrat_d2:
    beq  $t3, $zero, selesai_kuadrat_d2
    add  $t4, $t4, $t2
    addi $t3, $t3, -1
    j    kuadrat_d2
selesai_kuadrat_d2:
    li   $t5, 0
    li   $t6, 3
kali_phi_d2:
    beq  $t6, $zero, selesai_kali_phi_d2
    add  $t5, $t5, $t4
    addi $t6, $t6, -1
    j    kali_phi_d2
selesai_kali_phi_d2:
    li   $t7, 4
    div  $t5, $t7
    mflo $t9                # $t9 = luas2
    sw   $t9, luas2

    # ---------- Tentukan kategori perbandingan ----------
    blt  $t8, $t9, kategori_kecil
    beq  $t8, $t9, kategori_sama
    j    kategori_besar

kategori_kecil:
    la   $t0, kat_kecil
    j    simpan_kategori
kategori_sama:
    la   $t0, kat_sama
    j    simpan_kategori
kategori_besar:
    la   $t0, kat_besar

simpan_kategori:
    sw   $t0, kategori_ptr

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


#===============================================================
# PROSEDUR: KELUARAN
# Tugas   : Menampilkan luas lingkaran 1, luas lingkaran 2,
#           dan kategori perbandingan keduanya ke layar (console).
#===============================================================
KELUARAN:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    li   $v0, 4
    la   $a0, garis
    syscall

    li   $v0, 4
    la   $a0, msg_luas1
    syscall

    li   $v0, 1
    lw   $a0, luas1
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 4
    la   $a0, msg_luas2
    syscall

    li   $v0, 1
    lw   $a0, luas2
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 4
    la   $a0, msg_kategori
    syscall

    li   $v0, 4
    lw   $a0, kategori_ptr
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 4
    la   $a0, garis
    syscall

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra