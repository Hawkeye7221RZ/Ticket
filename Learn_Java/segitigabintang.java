public class segitigabintang {
    public static void main(String[] args) 
    {
        int tinggi = 5; // Tinggi segitiga bintang

        for (int i = 1; i <= tinggi; i++) 
        {
            // Mencetak spasi sebelum bintang
            for (int j = tinggi; j > i; j--) 
            {
                System.out.print(" ");
            }
            // Mencetak bintang
            for (int k = 1; k <= (2 * i - 1); k++) 
            {
                System.out.print("*");
            }
            // Pindah ke baris berikutnya
            System.out.println();
        }
    }
}