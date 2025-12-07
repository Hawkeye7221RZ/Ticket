import java.util.Scanner;

public class math{
 public static double z(int x, int y) {
       
        return 5 * Math.sqrt(x);
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        int a = input.nextInt();
        int b = input.nextInt();
        
        double z1 = z(a, b); 
        double z2 = z(b, a); 
        

        System.out.printf("%.3f %.3f", z1, z2);
        
        input.close();
    }
}
