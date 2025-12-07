import java.util.Scanner;

public class arruy2 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int[] angka = new int[11];

        
        for (int i = 0; i < 11; i++) {
            angka[i] = input.nextInt();
        }

        int pembanding = angka[10]; 

        
        for (int i = 0; i < 10; i++) {
            if (angka[i] < pembanding) {
                System.out.println(angka[i] + " is smaller than " + pembanding);
            } else if (angka[i] > pembanding) {
                System.out.println(angka[i] + " is greater than " + pembanding);
            } else {
                System.out.println(angka[i] + " is equal to " + pembanding);
            }
        }

        input.close();
    }
}
