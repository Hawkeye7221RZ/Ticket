import java.util.Scanner;

public class TestTubes{

    // Global Variables (Database sederhana menggunakan Array)
    static final int MAX_DATA = 100; // Kapasitas maksimal
    static String[] nikData = new String[MAX_DATA];
    static String[] namaData = new String[MAX_DATA];
    static String[] desaData = new String[MAX_DATA]; // Menyimpan nama desa untuk setiap penduduk
    static int jumlahData = 0; // Counter jumlah data saat ini

    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        inisialisasiDataAwal(); // Mengisi data dummy agar tidak kosong saat dijalankan
        menuUtama();
    }

    // --- 1. LOGIKA MENU UTAMA ---
    static void menuUtama() {
        int pilihan;
        do {
            bersihkanLayar();
            printHeader("SISTEM INFORMASI DESA");
            System.out.println("1. Informasi Desa");
            System.out.println("2. Data Penduduk (Cari & Tampil)");
            System.out.println("3. Edit Penduduk (Tambah & Hapus)");
            System.out.println("4. Keluar");
            printLine();
            System.out.print("Pilih menu (1-4): ");
            
            pilihan = validasiInputAngka();

            switch (pilihan) {
                case 1:
                    tampilkanInformasiDesa();
                    break;
                case 2:
                    subMenuDataPenduduk();
                    break;
                case 3:
                    subMenuEditPenduduk();
                    break;
                case 4:
                    System.out.println("\nTerima kasih telah menggunakan sistem ini.");
                    break;
                default:
                    System.out.println("Pilihan tidak valid!");
                    tungguEnter();
            }
        } while (pilihan != 4);
    }

    // --- 2. FITUR INFORMASI DESA ---
    static void tampilkanInformasiDesa() {
        bersihkanLayar();
        printHeader("INFORMASI DESA");
        
        // Logika sederhana untuk menghitung populasi per desa yang unik
        // Kita gunakan array sementara untuk melacak desa yang sudah dihitung
        String[] desaUnik = new String[jumlahData];
        int[] populasiUnik = new int[jumlahData];
        int counterUnik = 0;

        for (int i = 0; i < jumlahData; i++) {
            String desaSaatIni = desaData[i];
            boolean sudahAda = false;
            
            // Cek apakah desa sudah ada di list unik
            for (int j = 0; j < counterUnik; j++) {
                if (desaUnik[j].equalsIgnoreCase(desaSaatIni)) {
                    populasiUnik[j]++;
                    sudahAda = true;
                    break;
                }
            }
            
            // Jika belum ada, tambahkan ke list unik
            if (!sudahAda) {
                desaUnik[counterUnik] = desaSaatIni;
                populasiUnik[counterUnik] = 1;
                counterUnik++;
            }
        }

        System.out.println("+----------------------+-------------------+");
        System.out.printf("| %-20s | %-17s |\n", "NAMA DESA", "JUMLAH PENDUDUK");
        System.out.println("+----------------------+-------------------+");
        
        if (counterUnik == 0) {
            System.out.printf("| %-40s |\n", "Tidak ada data.");
        } else {
            for (int i = 0; i < counterUnik; i++) {
                System.out.printf("| %-20s | %-17d |\n", desaUnik[i], populasiUnik[i]);
            }
        }
        System.out.println("+----------------------+-------------------+");
        System.out.println("Total Total Penduduk Terdaftar: " + jumlahData);
        tungguEnter();
    }

    // --- 3. FITUR DATA PENDUDUK (SUB MENU) ---
    static void subMenuDataPenduduk() {
        int pilihan;
        do {
            bersihkanLayar();
            printHeader("MENU DATA PENDUDUK");
            System.out.println("1. Cari Penduduk (Nama / NIK)");
            System.out.println("2. Tampilkan Penduduk per Desa");
            System.out.println("3. Kembali ke Menu Utama");
            printLine();
            System.out.print("Pilih menu: ");
            pilihan = validasiInputAngka();

            if (pilihan == 1) {
                System.out.print("Masukkan Nama atau NIK yang dicari: ");
                String keyword = scanner.nextLine();
                cariPenduduk(keyword);
            } else if (pilihan == 2) {
                System.out.print("Masukkan Nama Desa: ");
                String desa = scanner.nextLine();
                tampilkanPendudukByDesa(desa);
            }
        } while (pilihan != 3);
    }

    static void cariPenduduk(String keyword) {
        boolean ditemukan = false;
        printTabelHeader();
        for (int i = 0; i < jumlahData; i++) {
            // Pencarian case-insensitive dan bisa parsial (contains)
            if (nikData[i].contains(keyword) || namaData[i].toLowerCase().contains(keyword.toLowerCase())) {
                printTabelBaris(i);
                ditemukan = true;
            }
        }
        printTabelFooter();
        if (!ditemukan) System.out.println("Data tidak ditemukan.");
        tungguEnter();
    }

    static void tampilkanPendudukByDesa(String desa) {
        boolean ditemukan = false;
        printTabelHeader();
        for (int i = 0; i < jumlahData; i++) {
            if (desaData[i].equalsIgnoreCase(desa)) {
                printTabelBaris(i);
                ditemukan = true;
            }
        }
        printTabelFooter();
        if (!ditemukan) System.out.println("Tidak ada penduduk di desa " + desa);
        tungguEnter();
    }

    // --- 4. FITUR EDIT PENDUDUK (SUB MENU) ---
    static void subMenuEditPenduduk() {
        int pilihan;
        do {
            bersihkanLayar();
            printHeader("MENU EDIT PENDUDUK");
            System.out.println("1. Tambah Data Penduduk");
            System.out.println("2. Hapus Data Penduduk");
            System.out.println("3. Kembali ke Menu Utama");
            printLine();
            System.out.print("Pilih menu: ");
            pilihan = validasiInputAngka();

            if (pilihan == 1) {
                tambahPenduduk();
            } else if (pilihan == 2) {
                hapusPenduduk();
            }
        } while (pilihan != 3);
    }

    static void tambahPenduduk() {
        if (jumlahData >= MAX_DATA) {
            System.out.println("Penyimpanan penuh!");
            tungguEnter();
            return;
        }

        System.out.println("\n--- Tambah Data Baru ---");
        System.out.print("Masukkan NIK  : ");
        String nik = scanner.nextLine();
        
        // Cek NIK unik sederhana
        for(int i=0; i<jumlahData; i++){
            if(nikData[i].equals(nik)){
                System.out.println("Gagal: NIK sudah terdaftar!");
                tungguEnter();
                return;
            }
        }

        System.out.print("Masukkan Nama : ");
        String nama = scanner.nextLine();
        System.out.print("Masukkan Desa : ");
        String desa = scanner.nextLine();

        // Simpan ke array
        nikData[jumlahData] = nik;
        namaData[jumlahData] = nama;
        desaData[jumlahData] = desa;
        jumlahData++;

        System.out.println("Data berhasil disimpan!");
        tungguEnter();
    }

    static void hapusPenduduk() {
        System.out.print("Masukkan NIK penduduk yang akan dihapus: ");
        String nikHapus = scanner.nextLine();
        int indexHapus = -1;

        // Cari index
        for (int i = 0; i < jumlahData; i++) {
            if (nikData[i].equals(nikHapus)) {
                indexHapus = i;
                break;
            }
        }

        if (indexHapus != -1) {
            System.out.println("Menghapus: " + namaData[indexHapus]);
            // Geser data setelah index yang dihapus ke kiri
            for (int i = indexHapus; i < jumlahData - 1; i++) {
                nikData[i] = nikData[i + 1];
                namaData[i] = namaData[i + 1];
                desaData[i] = desaData[i + 1];
            }
            // Kosongkan data terakhir (opsional, tapi rapi)
            nikData[jumlahData - 1] = null;
            namaData[jumlahData - 1] = null;
            desaData[jumlahData - 1] = null;
            
            jumlahData--;
            System.out.println("Data berhasil dihapus.");
        } else {
            System.out.println("Data dengan NIK tersebut tidak ditemukan.");
        }
        tungguEnter();
    }

    // --- UTILITIES / HELPER METHODS (Untuk Tampilan) ---
    
    // Inisialisasi data dummy agar tidak kosong saat demo
    static void inisialisasiDataAwal() {
        nikData[0] = "320101"; namaData[0] = "Budi Santoso"; desaData[0] = "Sukamaju";
        nikData[1] = "320102"; namaData[1] = "Siti Aminah"; desaData[1] = "Sukamaju";
        nikData[2] = "320103"; namaData[2] = "Ahmad Dani"; desaData[2] = "Sukasari";
        nikData[3] = "320104"; namaData[3] = "Dewi Persik"; desaData[3] = "Bojongsoang";
        jumlahData = 4;
    }

    static void printHeader(String judul) {
        printLine();
        System.out.printf("| %-56s |\n", judul.toUpperCase()); // Rata kiri
        printLine();
    }

    static void printLine() {
        System.out.println("+----------------------------------------------------------+");
    }

    static void printTabelHeader() {
        System.out.println("\n+----------------+--------------------------+----------------+");
        System.out.printf("| %-14s | %-24s | %-14s |\n", "NIK", "NAMA LENGKAP", "DESA");
        System.out.println("+----------------+--------------------------+----------------+");
    }

    static void printTabelBaris(int i) {
        System.out.printf("| %-14s | %-24s | %-14s |\n", nikData[i], namaData[i], desaData[i]);
    }
    
    static void printTabelFooter() {
         System.out.println("+----------------+--------------------------+----------------+");
    }

    static void bersihkanLayar() {
        // Trik sederhana untuk memberi jarak di konsol (bukan clear screen native OS)
        System.out.print("\033[H\033[2J");  
        System.out.flush();
    }

    static void tungguEnter() {
        System.out.print("\nTekan Enter untuk melanjutkan...");
        scanner.nextLine();
    }
    
    static int validasiInputAngka() {
        int input = 0;
        try {
            input = Integer.parseInt(scanner.nextLine());
        } catch (NumberFormatException e) {
            input = -1; // Return nilai invalid
        }
        return input;
    }
}

