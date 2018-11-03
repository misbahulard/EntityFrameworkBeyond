using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_10
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1Container())
            {
                var order = new WebOrder
                {
                    CustomerName = "Jim Allen",
                    OrderDate = DateTime.Parse("5/3/2012"),
                    isDeleted = false,
                    Amount = 200
                };
                context.WebOrders.Add(order);
                order = new WebOrder
                {
                    CustomerName = "John Stevens",
                    OrderDate = DateTime.Parse("1/1/2011"),
                    isDeleted = false,
                    Amount = 400
                };
                context.WebOrders.Add(order);
                order = new WebOrder
                {
                    CustomerName = "Russel Smith",
                    OrderDate = DateTime.Parse("1/3/2011"),
                    isDeleted = true,
                    Amount = 500
                };
                context.WebOrders.Add(order);
                order = new WebOrder
                {
                    CustomerName = "Mike Hammer",
                    OrderDate = DateTime.Parse("6/3/2013"),
                    isDeleted = true,
                    Amount = 1800
                };
                context.WebOrders.Add(order);
                order = new WebOrder
                {
                    CustomerName = "Steve Jones",
                    OrderDate = DateTime.Parse("1/1/2008"),
                    isDeleted = true,
                    Amount = 600
                };
                context.WebOrders.Add(order);
                context.SaveChanges();
            }

            using (var context = new Model1Container())
            {
                Console.WriteLine("Orders");
                Console.WriteLine("======");
                foreach (var order in context.WebOrders)
                {
                    Console.WriteLine("\nCustomer: {0}", order.CustomerName);
                    Console.WriteLine("OrderDate: {0}", order.OrderDate.ToShortDateString());
                    Console.WriteLine("Is Deleted: {0}", order.isDeleted.ToString());
                    Console.WriteLine("Amount: {0:C}", order.Amount);
                }
            }
        }
    }
}
