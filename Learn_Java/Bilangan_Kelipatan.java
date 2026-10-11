import java.util.Scanner;

public class Bilangan_Kelipatan {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Masukkan bilangan: ");
        int n = input.nextInt();

        if (n % 5 == 0 && n % 3 == 0) {
            System.out.println("true");
        } else {
            System.out.println("false");
        }
    }
}
