using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class Country
    {
        public int Id { get; set; }
        public string Status { get; set; }
        public string Name { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        public DateTime? DeletedDateTime { get; set; }
        public int CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public int? DeletedBy { get; set; }
    }
}
