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
        public string Medicare { get; set; }
        public string DOB { get; set; }
        public string LeadStatus { get; set; }
        public int CountryId { get; set; }
        public string StateId { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string Description { get; set; }
        public int CompanyId { get; set; }
        //public string Status { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        public DateTime? DeletedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public int? DeletedBy { get; set; }

        public virtual Users LeadOwner { get; set; }
        public virtual Country Country { get; set; }
    }
}
