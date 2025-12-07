import java.util.Scanner;

public class mainn {
    static void kelipatanTiga(Scanner sc, int[] jumlah) {
        /* I.S: Scanner siap dengan bilangan >=0 berakhir bila bilangan <0.
           F.S: jumlah[0] berisi jumlah bilangan ganjil yang kelipatan 3. */
        jumlah[0] = 0;
        int angka = sc.nextInt();
        while(angka >= 0){
             if (angka % 2 != 0 && angka % 3 == 0) {
                jumlah[0] += angka;
             }
             angka = sc.nextInt();
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int[] jumlah = new int [1];
        kelipatanTiga(sc, jumlah);
        System.out.println(jumlah[0]);
    }
}