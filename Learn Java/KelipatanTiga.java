import java.util.Scanner;

public class KelipatanTiga {
    static void kelipatanTiga(Scanner sc, int[] jumlah) {
        /* I.S: Scanner siap dengan bilangan >=0 berakhir bila bilangan <0.
           F.S: jumlah[0] berisi jumlah bilangan ganjil yang kelipatan 3. */
      jumlah[0] = 0;
        for(int i = 1; i <= i; i++){
            if(i % 3 == 0 && i % 2 != 0){
            jumlah[0] += i;
        }
    }
}
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int[] jumlah = {0};
        kelipatanTiga(sc, jumlah);
        System.out.println(jumlah[0]);
    }
}
