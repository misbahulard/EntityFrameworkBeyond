using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_13
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1Container())
            {
                context.Invoices.Add(new Invoice
                {
                    Amount = 19.95M,
                    Description = "Oil Change",
                    Date = DateTime.Parse("4/11/13")
                });
                context.Invoices.Add(new Invoice
                {
                    Amount = 129.95M,
                    Description = "Wheel Alignment",
                    Date = DateTime.Parse("4/01/13")
                });
                context.Invoices.Add(new DeletedInvoice
                {
                    Amount = 39.95M,
                    Description = "Engine Diagnosis",
                    Date = DateTime.Parse("4/01/13")
                });
                context.SaveChanges();
            }

            using (var context = new Model1Container())
            {
                foreach (var invoice in context.Invoices)
                {
                    var isDeleted = invoice as DeletedInvoice;
                    Console.WriteLine("{0} Invoice",
                                      isDeleted == null ? "Active" : "Deleted");
                    Console.WriteLine("Description: {0}", invoice.Description);
                    Console.WriteLine("Amount: {0:C}", invoice.Amount);
                    Console.WriteLine("Date: {0}", invoice.Date.ToShortDateString());
                    Console.WriteLine();
                }
            }
        }
    }
}
