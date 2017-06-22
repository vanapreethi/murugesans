

import java.io.BufferedReader;
import java.io.InputStreamReader;

class TestClass {
    public static void main(String args[] ) throws Exception {
        //     Read input from stdin and provide input before running

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line = br.readLine();
        int N = Integer.parseInt(line);
        if(N<0)
        {
                    System.out.println("Given number is negative");

        }else

                    System.out.println("Given number is positive");
    }
}
