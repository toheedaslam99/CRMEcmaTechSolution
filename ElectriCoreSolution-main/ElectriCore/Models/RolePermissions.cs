using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class RolePermissions
    {
        public int Id { get; set; }
        public int RoleId { get; set; }
        public int MenuId { get; set; }
        public string Permissions { get; set; }
        public int SequenceOrder { get; set; }
        public string Type { get; set; }

        public virtual Menus Menu { get; set; }
        public virtual Roles Role { get; set; }
    }
}
