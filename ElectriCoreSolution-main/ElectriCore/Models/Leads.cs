using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class Leads
    {
        public int Id { get; set; }
        public int LeadOwnerId { get; set; }
        public string Sno { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string HomePhone { get; set; }
        public string OtherPhone { get; set; }
        public string MobileNo { get; set; }
        public string Email { get; set; }
        public string SecondaryEmail { get; set; }
        public string SSN { get; set; }
        public string BIN { get; set; }
        public string Bank { get; set; }
        public string DOB { get; set; }
        public string StateId { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string Description { get; set; }
        public string Country { get; set; }
        public string CardType { get; set; }
        public int CompanyId { get; set; }

        public virtual Users LeadOwner { get; set; }
    }
}
