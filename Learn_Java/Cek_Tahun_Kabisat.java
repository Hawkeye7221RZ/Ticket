import java.util.Scanner;

public class Cek_Tahun_Kabisat {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Masukkan tahun: ");
        int tahun = in.nextInt();
       if ((tahun % 400 == 0) || (tahun % 4 == 0 && tahun % 100 != 0)){
            System.out.println("true");
       }else{
                System.out.println("false");
            }
       }

    }
