//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entity6_15
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ticket
    {
        public int TicketId { get; set; }
        public System.DateTime IssueDate { get; set; }
        public string Violation { get; set; }
        public int LicenseNumber { get; set; }
    
        public virtual Vehicle Vehicle { get; set; }
    }
}
