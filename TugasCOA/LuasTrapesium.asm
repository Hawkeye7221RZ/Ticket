#===============================================================
# PROGRAM   : Menghitung Luas Trapesium & Menentukan Kategorinya
# BAHASA    : MIPS Assembly (kompatibel MARS Simulator)
#
# DESKRIPSI :
#   Program menerima 3 buah bilangan bulat positif (Sisi1, Sisi2,
#   Tinggi), menghitung luas trapesium dengan rumus:
#       Luas = ((Sisi1 + Sisi2) / 2) x Tinggi
#   lalu mengelompokkan hasil ke dalam 3 kategori:
#       - Luas < 200            -> "TRAPESIUM KECIL"
#       - 200 <= Luas < 700     -> "TRAPESIUM SEDANG"
#       - Luas >= 700           -> "TRAPESIUM BESAR"
#
#   Struktur program terdiri dari program utama yang memanggil
#   3 prosedur: MASUKAN, HITUNG, dan KELUARAN.
#
#   Program terus berjalan (looping) menerima input baru sampai
#   nilai Sisi1 yang dimasukkan = 4004 (sinyal keluar program).
#
# CATATAN IMPLEMENTASI:
#   - Sisi1 dan Sisi2 TIDAK BOLEH bernilai sama (sesuai ketentuan
#     soal); jika sama, program menampilkan error dan meminta
#     input ulang dari awal (Sisi1).
#   - Proses perkalian rata-rata sisi dengan Tinggi dilakukan
#     dengan PENJUMLAHAN BERULANG (looping), TIDAK menggunakan
#     instruksi mult/mul.
#   - Pembagian dengan 2 menggunakan instruksi div.
#   - Hasil pembagian otomatis dibulatkan ke bawah karena memakai
#     bilangan bulat (integer division di MIPS membuang sisa).
#
#===============================================================

.data
    # ---------- Banner / identitas kelompok ----------
    banner:         .asciiz "===================================\n   PROGRAM LUAS TRAPESIUM - MIPS   \n===================================\nSE-49-02\n"
    daftar_nama:    .asciiz "Muhammad Febryan Akbar   103022500107\nDiaz Surya Ramadhan    103022500109\nDanish Raditya Rabbani   103022530004\nFauzan Nur Hafizh Y   103022500053\n"
    petunjuk:       .asciiz "\nPetunjuk program:\n- Masukkan Sisi 1, Sisi 2, dan Tinggi trapesium (bilangan bulat > 0)\n- Sisi 1 dan Sisi 2 TIDAK BOLEH sama\n- Program menghitung luas trapesium & menampilkan kategorinya\n- Untuk KELUAR dari program, masukkan angka 4004 saat diminta Sisi 1\n===================================\n\n"

    # ---------- Prompt input ----------
    prompt_s1:      .asciiz "Masukkan Sisi 1 : "
    prompt_s2:      .asciiz "Masukkan Sisi 2 : "
    prompt_tinggi:  .asciiz "Masukkan Tinggi : "

    # ---------- Pesan error ----------
    err_negatif:    .asciiz "Bilangan tidak boleh negatif atau nol! Silakan masukkan kembali.\n"
    err_sama:       .asciiz "Sisi 1 dan Sisi 2 tidak boleh sama! Silakan masukkan kembali.\n"

    # ---------- Output hasil ----------
    msg_luas:       .asciiz "Luas trapesium   = "
    msg_kategori:   .asciiz "Kategori         = "
    newline:        .asciiz "\n"
    garis:          .asciiz "-----------------------------------\n"

    # ---------- String kategori ----------
    kat_kecil:      .asciiz "TRAPESIUM KECIL"
    kat_sedang:     .asciiz "TRAPESIUM SEDANG"
    kat_besar:      .asciiz "TRAPESIUM BESAR"

    # ---------- Pesan keluar ----------
    msg_exit:       .asciiz "\nProgram selesai. Terima kasih!\n"

    # ---------- Variabel global (dipakai antar prosedur) ----------
    sisi1:          .word 0
    sisi2:          .word 0
    tinggi:         .word 0
    luas:           .word 0
    kategori_ptr:   .word 0     # menyimpan alamat string kategori

.text
.globl main

#===============================================================
# PROGRAM UTAMA
# Menampilkan banner identitas, lalu terus memanggil ketiga
# prosedur (MASUKAN -> HITUNG -> KELUARAN) sampai user
# memasukkan 4004 sebagai Sisi 1.
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
    jal  MASUKAN        # panggil prosedur input (bisa keluar dari sini jika 4004)
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
# Tugas   : Menerima input Sisi1, Sisi2, dan Tinggi dari user,
#           sekaligus memeriksa kesesuaian bilangan (harus > 0
#           dan Sisi1 tidak boleh sama dengan Sisi2).
#           Jika Sisi1 == 4004 -> program langsung diakhiri.
# Output  : menyimpan nilai valid ke variabel global sisi1,
#           sisi2, dan tinggi.
#===============================================================
MASUKAN:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

input_s1:
    li   $v0, 4
    la   $a0, prompt_s1
    syscall

    li   $v0, 5         # baca integer
    syscall
    move $t0, $v0       # $t0 = nilai sisi1 yang dibaca

    beq  $t0, 4004, keluar_dari_masukan   # cek sinyal keluar program

    blez $t0, s1_salah    # jika sisi1 <= 0 -> error, input ulang
    j    input_s2

s1_salah:
    li   $v0, 4
    la   $a0, err_negatif
    syscall
    j    input_s1

input_s2:
    li   $v0, 4
    la   $a0, prompt_s2
    syscall

    li   $v0, 5
    syscall
    move $t1, $v0       # $t1 = nilai sisi2 yang dibaca

    blez $t1, s2_salah    # jika sisi2 <= 0 -> error, input ulang
    j    cek_sisi_sama

s2_salah:
    li   $v0, 4
    la   $a0, err_negatif
    syscall
    j    input_s2

cek_sisi_sama:
    beq  $t0, $t1, sisi_sama_salah   # jika sisi1 == sisi2 -> error
    j    simpan_sisi

sisi_sama_salah:
    li   $v0, 4
    la   $a0, err_sama
    syscall
    j    input_s1        # ulang dari awal (sisi1)

simpan_sisi:
    sw   $t0, sisi1
    sw   $t1, sisi2

input_tinggi:
    li   $v0, 4
    la   $a0, prompt_tinggi
    syscall

    li   $v0, 5
    syscall
    move $t2, $v0       # $t2 = nilai tinggi yang dibaca

    blez $t2, tinggi_salah  # jika tinggi <= 0 -> error, input ulang
    j    simpan_tinggi

tinggi_salah:
    li   $v0, 4
    la   $a0, err_negatif
    syscall
    j    input_tinggi

simpan_tinggi:
    sw   $t2, tinggi

    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra

keluar_dari_masukan:
    addi $sp, $sp, 4    # bersihkan stack (tidak jadi dipakai)
    j    program_selesai


#===============================================================
# PROSEDUR: HITUNG
# Tugas   : Menghitung luas trapesium = ((Sisi1+Sisi2)/2) x Tinggi
#           dan menentukan kategori berdasarkan rentang luas.
#           Perkalian rata-rata sisi dengan Tinggi dilakukan
#           dengan penjumlahan berulang.
# Output  : menyimpan hasil ke variabel global luas & kategori_ptr
#===============================================================
HITUNG:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    lw   $t0, sisi1     # $t0 = sisi1
    lw   $t1, sisi2     # $t1 = sisi2
    lw   $t2, tinggi    # $t2 = tinggi

    # ---- Hitung rata-rata sisi = (sisi1 + sisi2) / 2 ----
    add  $t3, $t0, $t1
    li   $t4, 2
    div  $t3, $t4
    mflo $t5            # $t5 = rata-rata sisi

    # ---- Kalikan rata-rata sisi dengan tinggi via penjumlahan berulang ----
    move $t6, $t5       # nilai yang dijumlahkan berulang
    move $t7, $t2       # counter perulangan (sebanyak tinggi kali)
    li   $t8, 0         # akumulator hasil luas
kali_loop:
    beq  $t7, $zero, kali_selesai
    add  $t8, $t8, $t6
    addi $t7, $t7, -1
    j    kali_loop
kali_selesai:
    sw   $t8, luas

    # ---- Tentukan kategori berdasarkan rentang nilai luas ----
    blt  $t8, 200, kategori_kecil
    blt  $t8, 700, kategori_sedang
    j    kategori_besar

kategori_kecil:
    la   $t0, kat_kecil
    j    simpan_kategori
kategori_sedang:
    la   $t0, kat_sedang
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
# Tugas   : Menampilkan hasil luas trapesium dan kategorinya
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
