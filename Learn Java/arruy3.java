import java.util.Scanner;

public class arruy3 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int n = input.nextInt();
        int[] skor = new int[n];

        for (int i = 0; i < n; i++) {
            skor[i] = input.nextInt();
        }

        int best = skor[0];
        for (int i = 1; i < n; i++) {
            if (skor[i] > best) {
                best = skor[i];
            }
        }

        for (int i = 0; i < n; i++) {
            int nilai = skor[i];
            char grade;

            if (nilai >= best - 5) {
                grade = 'A';
            } else if (nilai >= best - 10) {
                grade = 'B';
            } else if (nilai >= best - 15) {
                grade = 'C';
            } else if (nilai >= best - 20) {
                grade = 'D';
            } else {
                grade = 'F';
            }

            System.out.println("Student " + i + " score is " + nilai + " and grade is " + grade);
        }

        input.close();
    }
}
