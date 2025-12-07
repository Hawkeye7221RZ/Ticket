import java.util.Scanner;

public class arruy {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int[] scores = new int[100];
        int count = 0;

        
        while (count < 100) {
            int value = input.nextInt();
            if (value < 0) break;   
            scores[count] = value;
            count++;
        }

    
        double sum = 0;
        for (int i = 0; i < count; i++) {
            sum += scores[i];
        }
        double average = sum / count;

        
        int above = 0, equal = 0, below = 0;

        for (int i = 0; i < count; i++) {
            if (scores[i] > average)
                above++;
            else if (scores[i] == average)
                equal++;
            else
                below++;
        }

      
        System.out.println(above + " scores above the average!");
        System.out.println(equal + " scores equals the average!");
        System.out.println(below + " scores below the average!");
    }
}
