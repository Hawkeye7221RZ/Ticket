import java.util.Scanner;
public class Descending {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int J = input.nextInt();
         input.nextLine(); 
        String[] kata = new String[J];
        int [] angka = new int[J];

         for(int i = 0; i < J; i++){
            
            System.out.print("Kelompok_"+ (i+1));
            angka[i] = input.nextInt();
        }
        for (int i = 0; i < J - 1; i++) {
            int minIndex = i;

            for (int j = i + 1; j < J; j++) {
                if (angka[j] > angka[minIndex]) {
                    minIndex = j;
                }
            }
            int tempAngka = angka[minIndex];  
            angka[minIndex] = angka[i];
            angka[i] = tempAngka;
        }
        for(int i = 0; i < J; i++){
            System.out.println("Kelompok_ " + (i+1) + " " + angka[i]);
        }
    }
}