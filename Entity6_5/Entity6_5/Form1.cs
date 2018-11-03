using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_5
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1())
            {
                var book = new Category { Name = "Books" };
                var fiction = new Category { Name = "Fiction", ParentCategory = book };
                var nonfiction = new Category { Name = "Non-Fiction", ParentCategory = book };
                var novel = new Category { Name = "Novel", ParentCategory = fiction };
                var history = new Category { Name = "History", ParentCategory = nonfiction };
                context.Categories.Add(novel);
                context.Categories.Add(history);
                context.SaveChanges();
            }

            using (var context = new Model1())
            {
                var root = context.Categories.Where(o => o.Name == "Books").First();
                Console.WriteLine("Parent category is {0}, subcategories are:", root.Name);
                foreach (var sub in context.GetSubCategories(root.CategoryId))
                {
                    Console.WriteLine("\t{0}", sub.Name);
                }
            }
        }
    }
}
