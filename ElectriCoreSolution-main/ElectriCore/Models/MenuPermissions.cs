using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class MenuPermissions
    {
        public int Id { get; set; }
        public int MenuId { get; set; }
        public string Ptype { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public int SequenceOrder { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        public DateTime? DeletedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public int? DeletedBy { get; set; }

        public virtual Menus Menu { get; set; }
    }
}
