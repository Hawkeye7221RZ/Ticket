import java.util.Scanner;

public class HitungBus {

    public static int jumlahBus(int penumpang, int kapasitas) {
        return (int) Math.ceil((double) penumpang / kapasitas);
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int n = input.nextInt(); 
        int m = input.nextInt(); 

        int hasil = jumlahBus(n, m);

        System.out.println(hasil + " bus");

        input.close();
    }
}
