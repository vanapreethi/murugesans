import java.io.*;
import java.util.*;
public class Check
{
   public static void main(String args[]) 
{
 Scanner obj=new Scanner(System.in);
 int s=0;
 int number=obj.nextInt();
 for(int i=1;i<=number;i++)
      s=s+i;
  //for(int i=1;i<=number;i++)
System.out.println("sum of N number is"+s);
}
}
