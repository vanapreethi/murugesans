import java.io.*;
import java.util.*;
import java.lang.*;
public class LengthString
{
public static void main(String args[])
{
  Scanner obj=new Scanner(System.in);
  String s=obj.next();
  StringBuffer buff=new StringBuffer(s);
  for(int i=0;i<buff.length();i++)
  {   int count=0;
        for(int j=0;j<buff.length();j++)
        {
            if(i==j)
                continue;
            if(buff.charAt(i)==buff.charAt(j))
            {       
                count++;
                buff.setCharAt(j,'*'); 
           }
        }
            if(count==0)
            {
                buff.setCharAt(i,'*');
            }
}       
  for(int i=0;i<buff.length();i++)
  { 
        if(buff.charAt(i)=='*')
        {                      
            buff.deleteCharAt(i);
            i--;
               }
}
    System.out.println(buff);

}
}
