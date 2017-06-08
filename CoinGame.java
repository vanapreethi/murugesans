import java.io.*;
import java.util.*;
public class CoinGame {
    public static void main(String args[])
    {
        Scanner obj=new Scanner(System.in);
        System.out.println("enter Coin size");
        int n=obj.nextInt();
        int p1=0,p2=0;
        int a[]=new int[n];
        System.out.println("enter Coin array ");
        for(int i=0;i<n;i++)
        {   a[i]=obj.nextInt();
        }
        for(int i=0;i<n;i++)
        {   if(i%2==0)
            p1=p1+a[i];
        else
            p2=p2+a[i];
        }
        System.out.println(p1+" "+p2);
        if(p1>p2)
        System.out.println("Player1 winner");
        else
        System.out.println("Player2 winner");


    }
}
