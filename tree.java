import java.io.*;
import java.util.*;
class Unique
{
    public static void main(String args[])
    {
        int a[]=new int[args.length];
        for(int i=0;i<args.length;i++)
        a[i]=Integer.parseInt(args[i]);
        TreeSet<Integer> t=new TreeSet<Integer>();
        for(int i=0;i<args.length;i++)
        t.add(a[i]);
        Iterator<Integer> it=t.iterator();
        while(it.hasNext())
        {
        System.out.println(it.next());
        }
        
    }
}
