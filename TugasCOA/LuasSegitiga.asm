#===============================================================
# PROGRAM   : Menghitung Luas Segi Tiga & Menentukan Kategorinya
# BAHASA    : MIPS Assembly (kompatibel MARS Simulator)
#
# DESKRIPSI :
#   Program menerima 2 buah bilangan bulat positif (Alas, Tinggi),
#   menghitung luas segi tiga = (Alas x Tinggi) / 2, lalu
#   mengelompokkan hasil ke dalam 3 kategori:
#       - Alas < Tinggi  -> "SEGI TIGA TINGGI"
#       - Alas = Tinggi  -> "SEGI TIGA SEDANG"
#       - Alas > Tinggi  -> "SEGI TIGA RENDAH"
#
#   Struktur program terdiri dari program utama yang memanggil
#   3 prosedur: MASUKAN, HITUNG, dan KELUARAN.
#
#   Program terus berjalan (looping) menerima input baru sampai
#   nilai Alas yang dimasukkan = 3003 (sinyal keluar program).
#
# CATATAN IMPLEMENTASI:
#   - Perkalian (Alas x Tinggi) dilakukan dsengan PENJUMLAHAN
#     BERULANG (looping), TIDAK menggunakan instruksi mult/mul.
#   - Pembagian dengan 2 menggunakan instruksi div.
#   - Hasil pembagian otomatis dibulatkan ke bawah karena memakai
#     bilangan bulat (integer division di MIPS membuang sisa).
#===============================================================

.data
    # ---------- Banner / identitas kelompok ----------
    banner:         .asciiz "===================================\n   PROGRAM LUAS SEGI TIGA - MIPS   \n===================================\nSE-49-02\n"
    daftar_nama:    .asciiz "Muhammad Febryan Akbar   103022500107\nDiaz Surya Ramadhan    103022500109\nDanish Raditya Rabbani   103022530004\nFauzan Nur Hafizh Y   103022500053\n"
    petunjuk:       .asciiz "\nPetunjuk program:\n- Masukkan Alas dan Tinggi segitiga (bilangan bulat positif > 0)\n- Program akan menghitung luas segitiga dan menampilkan kategorinya\n- Untuk KELUAR dari program, masukkan angka 3003 saat diminta Alas\n===================================\n\n"

    # ---------- Prompt input ----------
    prompt_alas:    .asciiz "Masukkan Alas   : "
    prompt_tinggi:  .asciiz "Masukkan Tinggi : "

    # ---------- Pesan error ----------3
    err_negatif:    .asciiz "Bilangan tidak boleh negatif atau nol! Silakan masukkan kembali.\n"

    # ---------- Output hasil ----------
    msg_luas:       .asciiz "Luas segi tiga    = "
    msg_kategori:   .asciiz "Kategori segi tiga= "
    newline:        .asciiz "\n"
    garis:          .asciiz "-----------------------------------\n"

    # ---------- String kategori ----------
    kat_tinggi:     .asciiz "SEGI TIGA TINGGI"
    kat_sedang:     .asciiz "SEGI TIGA SEDANG"
    kat_rendah:     .asciiz "SEGI TIGA RENDAH"

    # ---------- Pesan keluar ----------
    msg_exit:       .asciiz "\nProgram selesai. Terima kasih!\n"

    # ---------- Variabel global (dipakai antar prosedur) ----------
    alas:           .word 0
    tinggi:         .word 0
    luas:           .word 0
    kategori_ptr:   .word 0     # menyimpan alamat string kategori

.text
.globl main

#===============================================================
# PROGRAM UTAMA
# Menampilkan banner identitas, lalu terus memanggil ketiga
# prosedur (MASUKAN -> HITUNG -> KELUARAN) sampai user
# memasukkan 3003 sebagai Alas.
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
    jal  MASUKAN        # panggil prosedur input (bisa keluar dari sini jika 3003)
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
# Tugas   : Menerima input Alas & Tinggi dari user, sekaligus
#           memeriksa kesesuaian bilangan (harus > 0).
#           Jika Alas == 3003 -> program langsung diakhiri.
# Output  : menyimpan nilai valid ke variabel global alas & tinggi
#===============================================================
MASUKAN:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

input_alas:
    li   $v0, 4
    la   $a0, prompt_alas
    syscall

    li   $v0, 5         # baca integer
    syscall
    move $t0, $v0       # $t0 = nilai alas yang dibaca

    beq  $t0, 3003, keluar_dari_masukan   # cek sinyal keluar program

    blez $t0, alas_salah   # jika alas <= 0 -> error, input ulang
    j    simpan_alas

alas_salah:
    li   $v0, 4
    la   $a0, err_negatif
    syscall
    j    input_alas

simpan_alas:
    sw   $t0, alas

input_tinggi:
    li   $v0, 4
    la   $a0, prompt_tinggi
    syscall

    li   $v0, 5
    syscall
    move $t1, $v0       # $t1 = nilai tinggi yang dibaca

    blez $t1, tinggi_salah  # jika tinggi <= 0 -> error, input ulang
    j    simpan_tinggi

tinggi_salah:
    li   $v0, 4
    la   $a0, err_negatif
    syscall
    j    input_tinggi

simpan_tinggi:
    sw   $t1, tinggi

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

keluar_dari_masukan:
    addi $sp, $sp, 4    # bersihkan stack (tidak jadi dipakai)
    j    program_selesai


#===============================================================
# PROSEDUR: HITUNG
# Tugas   : Menghitung luas segitiga = (Alas x Tinggi) / 2
#           dan menentukan kategori segitiga.
#           Perkalian dilakukan dengan penjumlahan berulang.
# Output  : menyimpan hasil ke variabel global luas & kategori_ptr
#===============================================================
HITUNG:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    lw   $t0, alas      # $t0 = alas
    lw   $t1, tinggi    # $t1 = tinggi

    # ---- Perkalian alas x tinggi dengan penjumlahan berulang ----
    li   $t2, 0         # $t2 = akumulator hasil kali
    li   $t3, 0         # $t3 = counter looping
kali_loop:
    beq  $t3, $t1, kali_selesai
    add  $t2, $t2, $t0
    addi $t3, $t3, 1
    j    kali_loop
kali_selesai:
    # $t2 sekarang berisi (alas x tinggi)

    # ---- Pembagian dengan 2 menggunakan instruksi div ----
    li   $t4, 2
    div  $t2, $t4
    mflo $t5            # $t5 = hasil bagi (otomatis dibulatkan ke bawah)
    sw   $t5, luas

    # ---- Menentukan kategori segitiga ----
    blt  $t0, $t1, kategori_tinggi
    beq  $t0, $t1, kategori_sedang
    j    kategori_rendah

kategori_tinggi:
    la   $t6, kat_tinggi
    j    simpan_kategori
kategori_sedang:
    la   $t6, kat_sedang
    j    simpan_kategori
kategori_rendah:
    la   $t6, kat_rendah

simpan_kategori:
    sw   $t6, kategori_ptr

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


#===============================================================
# PROSEDUR: KELUARAN
# Tugas   : Menampilkan hasil luas segitiga dan kategorinya
#           ke layar (console).
#===============================================================
KELUARAN:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    li   $v0, 4
    la   $a0, garis
    syscall

    li   $v0, 4
    la   $a0, msg_luas
    syscall

    li   $v0, 1
    lw   $a0, luas
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