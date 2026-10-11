import java.util.Scanner;
public class maiin {
    public static void main(String [] args) {
        Scanner input = new Scanner(System.in);
        int[] matrixA = new int[5];

        System.out.println("Enter matrix A:");
        for (int i = 0; i < 5; i++){
                System.out.print("Gaji karyawan ke-" + (i+1) + " : ");
                matrixA[i] = input.nextInt();
        }
        int min = matrixA[0];
        for(int i =0; i <5; i++){
            if(matrixA[i] < min){
                min = matrixA[i];
            }
        }
       
        System.out.println("gaji karyawan lebih dari 5jt" + min);
        input.close();
    }
}