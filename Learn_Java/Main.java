import java.util.Scanner;

public class Main {
    static void sumBuah(int jumBuah, Scanner sc, int[] jumApel, int[] jumJeruk, int[] jumMangga) {
        /* I.S: Terdefinisi jumBuah, dan ketiga penghitung bernilai awal 0.
           F.S: Setelah membaca jumBuah buah, jumApel/jumJeruk/jumMangga terisi sesuai. */
        Scanner input = new Scanner(System.in);
        jumApel[0] = 0;
        jumJeruk[0] = 0;
        jumMangga[0] = 0;
        
        for(int i = 1; i <= jumBuah; i++){
            System.out.print(i);
            String jenis = input.next();
            nBuah(jenis, jumApel, jumJeruk, jumMangga);
        }
    }
    static void nBuah(String jenisBuah, int[] jumApel, int[] jumJeruk, int[] jumMangga) {
        /* I.S: jenisBuah terdefinisi.
           F.S: Menambah salah satu penghitung sesuai jenis. */
       if(jenisBuah.equalsIgnoreCase("apel")) {
            jumApel[0]++;
        } else if(jenisBuah.equalsIgnoreCase("jeruk")) {
            jumJeruk[0]++;
        } else if(jenisBuah.equalsIgnoreCase("mangga")) {
            jumMangga[0]++;
        }
    
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int jumBuah = sc.nextInt();
        int[] jumApel = new int[1];
        int[] jumJeruk = new int[1];
        int[] jumMangga = new int[1];
        sumBuah(jumBuah, sc, jumApel, jumJeruk, jumMangga);
        System.out.println(jumApel[0] + " " + jumJeruk[0] + " " + jumMangga[0]);
    }
}