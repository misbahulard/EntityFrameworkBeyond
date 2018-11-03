using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1())
            {
                var worker = new Worker { Name = "Jim" };
                var task = new Task { Title = "Fold Envelopes" };
                var workertask = new WorkerTask { Task = task, Worker = worker };
                context.WorkerTasks.Add(workertask);
                task = new Task { Title = "Mail Letters" };
                workertask = new WorkerTask { Task = task, Worker = worker };
                context.WorkerTasks.Add(workertask);
                worker = new Worker { Name = "Sara" };
                task = new Task { Title = "Buy Envelopes" };
                workertask = new WorkerTask { Task = task, Worker = worker };
                context.WorkerTasks.Add(workertask);
                context.SaveChanges();
            }

            using (var context = new Model1())
            {
                Console.WriteLine("Workers and Their Tasks");
                Console.WriteLine("=======================");
                foreach (var worker in context.Workers)
                {
                    Console.WriteLine("\n{0}'s tasks:", worker.Name);
                    foreach (var wt in worker.WorkerTasks)
                    {
                        Console.WriteLine("\t{0}", wt.Task.Title);
                    }
                }
            }
        }
    }
}
