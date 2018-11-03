﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_12
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1Container())
            {
                var d1 = new Dealer { Name = "All Cities Toyota" };
                var d2 = new Dealer { Name = "Southtown Toyota" };
                var d3 = new Dealer { Name = "Luxury Auto World" };
                var c1 = new Toyota
                {
                    Model = "Camry",
                    Color = "Green",
                    Year = 2014,
                    Dealer = d1
                };
                var c2 = new BMW
                {
                    Model = "310i",
                    Color = "Blue",
                    CollisionAvoidance = true,
                    Year = 2014,
                    Dealer = d3
                };
                var c3 = new Toyota
                {
                    Model = "Tundra",
                    Color = "Blue",
                    Year = 2014,
                    Dealer = d2
                };
                context.Dealers.Add(d1);
                context.Dealers.Add(d2);
                context.Dealers.Add(d3);
                context.SaveChanges();
            }

            using (var context = new Model1Container())
            {
                Console.WriteLine("Dealers and Their Cars");
                Console.WriteLine("======================");
                foreach (var dealer in context.Dealers)
                {
                    Console.WriteLine("\nDealer: {0}", dealer.Name);
                    foreach (var car in dealer.Cars)
                    {
                        string make = string.Empty;
                        if (car is Toyota)
                            make = "Toyota";
                        else if (car is BMW)
                            make = "BMW";
                        Console.WriteLine("\t{0} {1} {2} {3}", car.Year,
                                           car.Color, make, car.Model);
                    }
                }
            }
        }
    }
}
