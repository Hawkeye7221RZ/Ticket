import java.util.Scanner;

public class Latcod10 {
    static void faktor(int n) {
        /* I.S: terdiri dari sebuah bilangan bulat positif N.
           F.S: mencetak semua bilangan d (1..N) diikuti true jika d faktor dari N, false jika bukan. */
        for(int d = 1; d <= n; d++) {
            if(n % d == 0) {
                System.out.println(d + " true");
            } else {
                System.out.println(d + " false");
            }
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        faktor(n);
    }
}