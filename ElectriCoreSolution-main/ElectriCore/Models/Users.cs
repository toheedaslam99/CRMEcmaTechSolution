using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class Users
    {
        public int Id { get; set; }
        public int RoleId { get; set; }
        public int CompanyId { get; set; }
        public string Name { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string EmailAddress { get; set; }
        public string Status { get; set; }
        public string ProfileImage { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        public DateTime? DeletedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public int? DeletedBy { get; set; }

        public virtual Roles Role { get; set; }
    }
}
