import java.io.*;
import java.util.*;
public class Diivide {
    public static void main(String args[])
    {
        Scanner obj=new Scanner(System.in);
        //int array1[]={3,1,3,4,5};
        System.out.println("enter array size");
        int n=obj.nextInt();
        int a[]=new int[n];
        System.out.println("enter array ");
        for(int i=0;i<n;i++)
        {   a[i]=obj.nextInt();
        }
        int s=0,f=0,count=0,o=0;
        for(int i=0;i<=n/2;i++)
        {
            s=s+a[i];
            count++;
               }
        int t=s/count;
        for(int i=n/2+1;i<n;i++)
        {
            f=f+a[i];
            o++;
        }        
        int h=f/o;   
        if(t==h)
        System.out.println("POSSIBLE");
        else
        System.out.println("NOT POSSIBLE");

        
    }
}
