import java.util.Scanner;

public class Descendingg {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int N = 6; // maksimal 6 baris sesuai soal
        String[] kelompok = new String[N];
        int[] nilai = new int[N];

        for (int i = 0; i < N; i++) {
            kelompok[i] = input.next();
            nilai[i] = input.nextInt();
        }

        for (int i = 1; i < N; i++) {
            String keyKelompok = kelompok[i];
            int keyNilai = nilai[i];
            int j = i - 1;

            while (j >= 0 && nilai[j] < keyNilai) {
                nilai[j + 1] = nilai[j];
                kelompok[j + 1] = kelompok[j];
                j--;
            }

            nilai[j + 1] = keyNilai;
            kelompok[j + 1] = keyKelompok;
        }

        for (int i = 0; i < N; i++) {
            System.out.println(kelompok[i] + " " + nilai[i]);
        }
    }
}
