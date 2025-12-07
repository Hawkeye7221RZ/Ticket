import java.util.Scanner;
    public class konversi_Suhu{
     public static void main(String[]args){
  Scanner scanner= new Scanner(System.in);
 int celcius = scanner.nextInt();
 double f = (9/5)* celcius + 32;
System.out.println(f);
        }
    }