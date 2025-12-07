import java.util.Scanner;

public class SyaratNonton {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
       
        System.out.print("Apakah hari kerja? (true/false): ");
        boolean hariKerja = input.nextBoolean();
        
        System.out.print("Jam nonton (format 24 jam, misal: 20): ");
        int jamNonton = input.nextInt();
        
        System.out.print("Apakah genre film aksi? (true/false): ");
        boolean genreAksi = input.nextBoolean();
        
       
        boolean mauDiajakNonton = cekSyaratNonton(hariKerja, jamNonton, genreAksi);
        
        
        System.out.println("\nHasil: " + mauDiajakNonton);
        
        if (mauDiajakNonton) {
            System.out.println("Yay! Mau diajak nonton! 🎬");
        } else {
            System.out.println("Maaf, tidak bisa diajak nonton. 😔");
        }
        
        input.close();
    }
}