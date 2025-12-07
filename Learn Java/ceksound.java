
public class ceksound {

	public static void main(String[] args) {
		int x = 10;
		int y = 5;
		int z = 15;
		int result = 0;
	
		if (x > 5) {
			if (y < 10) {
				result = x + y;
			} else {
				result = x - y;
			}
		}

		if (z > 10 && x == 10) {
			result += z;
		} else {
			result = z - x;
		}
	
		if (x == 10 || y > 10) {
			result += 5;
		} else if (y == 5 && z > 10) {
			result -= 5;
		} else {
			result *= 2;
		}
	
		if (!(x < 15 && y < 10)) {
			result += 10;
		} else {
			result -= 10;
		}
	
		System.out.println("Nilai akhir result :" + result);
	}
}
	
