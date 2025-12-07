import java.util.Scanner;
public class masukkanIPK {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        System.out.print("Masukkan nama mahasiswa :");
        String namaa = input.nextLine();
        System.out.print("Masukkan IPK :");
        double IPK = input.nextDouble();
        if(IPK >= 3.50 && IPK <= 4.00){
            System.out.print(namaa + " layak mendapatkan beasiswa penuh");
        }else{ 
            if(IPK >= 3.00 && IPK <= 3.49){
                System.out.print(namaa + " layak mendapatkan beasiswa parsial");
        }else{       
            }if(IPK < 3.00 && IPK >= 0.00){
         System.out.print(namaa + " Belum memenuhi syarat beasiswa");
    }else{
        System.out.print("Inputan tidak valid");
    }
}
}
}
