using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class Roles
    {
        public Roles()
        {
            RolePermissions = new HashSet<RolePermissions>();
            Users = new HashSet<Users>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsEditable { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        public DateTime? DeletedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public int? DeletedBy { get; set; }

        public virtual ICollection<RolePermissions> RolePermissions { get; set; }
        public virtual ICollection<Users> Users { get; set; }
    }
}
