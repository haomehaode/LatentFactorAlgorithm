using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewArray
{
    class Program
    {
        static void Main(string[] args)
        {
            DateTime beDT = System.DateTime.Now;

            Matrix ma = new Matrix();
            ma.Test();
            DateTime afDT = System.DateTime.Now;
            TimeSpan TS = afDT.Subtract(beDT);
            Console.WriteLine("花费{0}s", TS.TotalSeconds);//计算耗时
            Console.ReadKey();


        }
    }
    
}
