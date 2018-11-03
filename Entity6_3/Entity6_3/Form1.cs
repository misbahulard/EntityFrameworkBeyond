using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            run1();
            run2();
        }

        public static void run1()
        {
            using (var context = new Model1())
            {
                var product1 = new Product { Name = "Pole", Price = 12.97M };
                var product2 = new Product { Name = "Tent", Price = 199.95M };
                var product3 = new Product { Name = "Ground Cover", Price = 29.95M };
                product2.RelatedProducts.Add(product3);
                product1.RelatedProducts.Add(product2);
                context.Products.Add(product1);
                context.SaveChanges();
            }
            using (var context = new Model1())
            {
                var product2 = context.Products.First(p => p.Name == "Tent");
                Console.WriteLine("Product: {0} ... {1}", product2.Name,
                                   product2.Price.ToString("C"));
                Console.WriteLine("Related Products");
                foreach (var prod in product2.RelatedProducts)
                {
                    Console.WriteLine("\t{0} ... {1}", prod.Name, prod.Price.ToString("C"));
                }
                foreach (var prod in product2.OtherRelatedProducts)
                {
                    Console.WriteLine("\t{0} ... {1}", prod.Name, prod.Price.ToString("C"));
                }
            }
        }

        public static void run2()
        {
            using (var context = new Model1())
            {
                var product1 = new Product { Name = "Pole", Price = 12.97M };
                var product2 = new Product { Name = "Tent", Price = 199.95M };
                var product3 = new Product { Name = "Ground Cover", Price = 29.95M };
                product2.RelatedProducts.Add(product3);
                product1.RelatedProducts.Add(product2);
                context.Products.Add(product1);
                context.SaveChanges();
            }

            using (var context = new Model1())
            {
                var product1 = context.Products.First(p => p.Name == "Pole");
                Dictionary<int, Product> t = new Dictionary<int, Product>();
                GetRelated(context, product1, t);
                Console.WriteLine("Products related to {0}", product1.Name);
                foreach (var key in t.Keys)
                {
                    Console.WriteLine("\t{0}", t[key].Name);
                }
            }
        }

        static void GetRelated(DbContext context, Product p, Dictionary<int, Product> t)
        {
            context.Entry(p).Collection(ep => ep.RelatedProducts).Load();
            foreach (var relatedProduct in p.RelatedProducts)
            {
                if (!t.ContainsKey(relatedProduct.ProductId))
                {
                    t.Add(relatedProduct.ProductId, relatedProduct);
                    GetRelated(context, relatedProduct, t);
                }
            }
            context.Entry(p).Collection(ep => ep.OtherRelatedProducts).Load();
            foreach (var otherRelated in p.OtherRelatedProducts)
            {
                if (!t.ContainsKey(otherRelated.ProductId))
                {
                    t.Add(otherRelated.ProductId, otherRelated);
                    GetRelated(context, otherRelated, t);
                }
            }
        }
    }
}
