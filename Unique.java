import java.util.*;
class Unique
{
    public static void main(String args[])
    {
        int a[]=new int[args.length];
        for(int i=0;i<args.length;i++)
        a[i]=Integer.parseInt(args[i]);
        int count=0;
        for(int i=0;i<args.length;i++)
        {
            for(int j=0;j<args.length;j++)
            {   if(i==j)
                continue;
                if(a[i]==a[j])
                {
                    count++;
                }
                else count=0;
            }
            if(count==0)
            {
                System.out.println(a[i]);
            }
        }
        
    }
}
