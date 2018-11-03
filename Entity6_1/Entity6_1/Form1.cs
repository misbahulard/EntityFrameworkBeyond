using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Entity6_1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            using (var context = new Model1Container())
            {
                var org = new Organizer { Name = "Community Charity" };
                var evt = new Event { Name = "Fundraiser" };
                org.Events.Add(evt);
                context.Organizers.Add(org);
                org = new Organizer { Name = "Boy Scouts" };
                evt = new Event { Name = "Eagle Scout Dinner" };
                org.Events.Add(evt);
                context.Organizers.Add(org);
                context.SaveChanges();
            }

            using (var context = new Model1Container())
            {
                var evsorg1 = from ev in context.Events
                              from organizer in ev.Organizers
                              select new { ev.EventId, organizer.OrganizerId };
                Console.WriteLine("Using nested from clauses...");
                foreach (var pair in evsorg1)
                {
                    Console.WriteLine("EventId {0}, OrganizerId {1}",
                                       pair.EventId,
                                       pair.OrganizerId);
                }

                var evsorg2 = context.Events
                                     .SelectMany(e => e.Organizers,
                                        (ev, org) => new { ev.EventId, org.OrganizerId });
                Console.WriteLine("\nUsing SelectMany()");
                foreach (var pair in evsorg2)
                {
                    Console.WriteLine("EventId {0}, OrganizerId {1}",
                                       pair.EventId, pair.OrganizerId);
                }
            }
        }
    }
}
