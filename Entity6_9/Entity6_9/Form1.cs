using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_9
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1Container())
            {
                context.Database.ExecuteSqlCommand(@"insert into Toys
             (Name, Price) values ('RagDoll',1)");
                var toy = new Toy { Name = "Fuzzy Bear", Price = 9.97M };
                var refurb = new RefurbishedToy
                {
                    Name = "Derby Car",
                    Price = 19.99M,
                    Quality = "Ok to sell"
                };
                context.Toys.Add(toy);
                context.Toys.Add(refurb);
                context.SaveChanges();
            }

            using (var context = new Model1Container())
            {
                Console.WriteLine("All Toys");
                Console.WriteLine("========");
                foreach (var toy in context.Toys)
                {
                    Console.WriteLine("{0}", toy.Name);
                }
                Console.WriteLine("\nRefurbished Toys");
                foreach (var toy in context.Toys.OfType<RefurbishedToy>())
                {
                    Console.WriteLine("{0}, Price = {1}, Quality = {2}", toy.Name,
                                       toy.Price, ((RefurbishedToy)toy).Quality);
                }
            }
        }
    }
}
