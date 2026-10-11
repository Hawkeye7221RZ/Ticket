import java.util.Scanner;

public class Terbesar{
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Masukkan jumlah elemen: ");
        int n = input.nextInt();

        int[] arr = new int[n];

        System.out.print("Masukkan elemen array: ");
        for (int i = 0; i < n; i++) {
            arr[i] = input.nextInt();
        }

        int max = arr[0];
        int indexMax = 0;
        for (int i = 1; i < n; i++) {
            if (arr[i] > max) {
                max = arr[i];
                indexMax = i;
            }
        }

       
        System.out.println("Nilai maksimum terletak pada posisi indeks ke-" + (indexMax + 1));
        input.close();
    }
}
