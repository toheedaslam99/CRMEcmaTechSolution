using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class Menus
    {
        public Menus()
        {
            InverseParent = new HashSet<Menus>();
            MenuPermissions = new HashSet<MenuPermissions>();
            RolePermissions = new HashSet<RolePermissions>();
        }

        public int Id { get; set; }
        public string Type { get; set; }
        public int? ParentId { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
        public string AccessUrl { get; set; }
        public int SequenceOrder { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public string MobileRoute { get; set; }
        public string MobileLabel { get; set; }

        public virtual Menus Parent { get; set; }
        public virtual ICollection<Menus> InverseParent { get; set; }
        public virtual ICollection<MenuPermissions> MenuPermissions { get; set; }
        public virtual ICollection<RolePermissions> RolePermissions { get; set; }
    }
}
