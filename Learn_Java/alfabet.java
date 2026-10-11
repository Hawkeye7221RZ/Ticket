import java.util.Scanner;
public class alfabet {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int N = input.nextInt();
         input.nextLine(); // Consum
        String[] kata = new String[N];
        for(int i = 0; i < N; i++){
            kata[i] = input.nextLine();
        }
        for(int i = 0; i < N; i++){
            int minIndex = i;
            for (int j = i + 1; j < N; j++) {
                if (kata[j].compareTo(kata[minIndex]) < 0) {
                    minIndex = j;
                }
            }
            String temp = kata[minIndex];  
            kata[minIndex] = kata[i];  
            kata[i] = temp;
        }
        for(int i = 0; i < N; i++){
            System.out.println("\n" + kata[i]);
        }
    }
}
