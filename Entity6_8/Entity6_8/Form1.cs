using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_8
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1())
            {
                var hourly = new HourlyEmployee
                {
                    Name = "Will Smith",
                    Hours = (decimal)39,
                    Rate = 7.75M
                };
                var salaried = new SalariedEmployee
                {
                    Name = "JoAnn Woodland",
                    Salary = 65400M
                };
                var commissioned = new CommissionedEmployee
                {
                    Name = "Joel Clark",
                    Salary = 32500M,
                    Commission = 20M
                };
                context.Employees.Add(hourly);
                context.Employees.Add(salaried);
                context.Employees.Add(commissioned);
                context.SaveChanges();
            }

            using (var context = new Model1())
            {
                Console.WriteLine("All Employees");
                Console.WriteLine("=============");
                foreach (var emp in context.Employees)
                {
                    if (emp is HourlyEmployee)
                        Console.WriteLine("{0} Hours = {1}, Rate = {2}/hour",
                                           emp.Name,
                                           ((HourlyEmployee)emp).Hours.Value.ToString(),
                                           ((HourlyEmployee)emp).Rate.Value.ToString("C"));
                    else if (emp is CommissionedEmployee)
                        Console.WriteLine("{0} Salary = {1}, Commission = {2}%",
                                    emp.Name,
                                    ((CommissionedEmployee)emp).Salary.Value.ToString("C"),
                                    ((CommissionedEmployee)emp).Commission.ToString());
                    else if (emp is SalariedEmployee)
                        Console.WriteLine("{0} Salary = {1}", emp.Name,
                                    ((SalariedEmployee)emp).Salary.Value.ToString("C"));
                }
            }
        }
    }
}
