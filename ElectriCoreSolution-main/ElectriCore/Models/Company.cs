using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class Company
    {
        public int Id { get; set; }
        public string Status { get; set; }
        public string Name { get; set; }
        public string Logo { get; set; }
        public bool IsDeleted { get; set; }
    }
}
