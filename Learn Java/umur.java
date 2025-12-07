import java.util.Scanner;
public class umur {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
        System.out.print("Masukkan usia : " );
		int usia = input.nextInt();
		String kategori;
		if (usia < 0) {
            kategori = "Umur tidak valid";
        } else {
                if (usia <= 12) {
                    kategori = "Anak-anak";
                } else {
                    if (usia <= 17) {
                        kategori = "Remaja";
                    } else {
                            if (usia <= 45) {
                                kategori = "Dewasa";
                            } else {
                                    kategori = "Lansia";
                                }
                            }
                        }
                    }
                        System.out.println(kategori);
                }
            }
    
