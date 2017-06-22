import java.io.*;
import java.util.*;
class Alphabets
{
    public static void main(String args[])
    {
        Scanner sc=new Scanner(System.in);
        char c=sc.next().charAt(0);
        if((c>='a' && c<='z')||(c>='A' && c<='Z'))
        System.out.println("alphabet");
        else
                System.out.println(" Not alphabet");

    }
}
