using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_7
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1Container())
            {
                var principal = new Principal
                {
                    Name = "Robbie Smith",
                    Bonus = 3500M,
                    Salary = 48000M
                };
                var instructor = new Instructor
                {
                    Name = "Joan Carlson",
                    Salary = 39000M
                };
                context.Staffs.Add(principal);
                context.Staffs.Add(instructor);
                context.SaveChanges();
            }

            using (var context = new Model1Container())
            {
                Console.WriteLine("Principals");
                Console.WriteLine("==========");
                foreach (var p in context.Staffs.OfType<Principal>())
                {
                    Console.WriteLine("\t{0}, Salary: {1:C}, Bonus: {2:C}",
                                       p.Name, p.Salary,
                                       p.Bonus);
                }
                Console.WriteLine("Instructors");
                Console.WriteLine("===========");
                foreach (var i in context.Staffs.OfType<Instructor>())
                {
                    Console.WriteLine("\t{0}, Salary: {1:C}", i.Name, i.Salary);
                }
            }
        }
    }
}
