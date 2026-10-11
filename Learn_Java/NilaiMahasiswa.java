import java.util.Scanner;

public class NilaiMahasiswa {

    // Method untuk menghitung rata-rata nilai
    public static double hitungRata(int[] nilai) {
        int total = 0;
        for (int i = 0; i < nilai.length; i++) {
            total += nilai[i];
        }
        return (double) total / nilai.length;
    }

    // Method untuk menampilkan data nilai
    public static void tampilkanNilai(int[][] nilai) {
        System.out.println("\nData Nilai Mahasiswa:");
        for (int i = 0; i < nilai.length; i++) {
            System.out.print("Mahasiswa ke-" + (i + 1) + ": ");
            for (int j = 0; j < nilai[i].length; j++) {
                System.out.print(nilai[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int mahasiswa = 3;
        int matkul = 3;

        // Array 2 dimensi
        int[][] nilai = new int[mahasiswa][matkul];

        // Input nilai
        for (int i = 0; i < mahasiswa; i++) {
            System.out.println("\nMasukkan nilai mahasiswa ke-" + (i + 1));
            for (int j = 0; j < matkul; j++) {
                System.out.print("Nilai mata kuliah ke-" + (j + 1) + ": ");
                nilai[i][j] = input.nextInt();
            }
        }

        // Menampilkan nilai
        tampilkanNilai(nilai);

        // Menghitung rata-rata tiap mahasiswa
        System.out.println("\nRata-rata Nilai:");
        for (int i = 0; i < mahasiswa; i++) {
            double rata = hitungRata(nilai[i]);
            System.out.println("Mahasiswa ke-" + (i + 1) + ": " + rata);
        }

        input.close();
    }
}
