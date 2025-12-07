import java.util.Scanner;

public class Terendah {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Masukkan jumlah elemen: ");
        int n = input.nextInt();

        int[] arr = new int[n];

        System.out.print("Masukkan elemen array: ");
        for (int i = 0; i < n; i++) {
            arr[i] = input.nextInt();
        }

        int min = arr[0];
        for (int i = 1; i < n; i++) {
            if (arr[i] < min) {
                min = arr[i];
            }
        }

       
        System.out.println("Nilai minimum adalah " + min);
    }
}
