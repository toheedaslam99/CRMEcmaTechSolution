using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ElectriCore.Models
{
    [ModelMetadataType(typeof(ChartOfAccountsModelMetaData))]
    public partial class ChartOfAccounts
    {

    }
    public class ChartOfAccountsModelMetaData
    {
        [Required(ErrorMessage = "Required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Required")]
        public string Status { get; set; }
    }
    public class TreeViewNode
    {
        public string id { get; set; }
        public string parent { get; set; }
        public string text { get; set; }
    }
    [ModelMetadataType(typeof(RolesModelMetaData))]
    public partial class Roles
    {

    }
    public class RolesModelMetaData
    {
        [Required(ErrorMessage = "Required")]
        public string Name { get; set; }
    }
    [ModelMetadataType(typeof(MenusModelMetaData))]
    public partial class Menus
    {

    }
    public class MenusModelMetaData
    {
        [Required(ErrorMessage = "Required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Required")]
        public string Type { get; set; }
        [Required(ErrorMessage = "Required")]
        public int SequenceOrder { get; set; }
        [Required(ErrorMessage = "Required")]
        public string AccessUrl { get; set; }
    }
    public class UserSession
    {
        public int UserId { get; set; }
        public int RoleId { get; set; }
        public int CompanyId { get; set; }
        public string RoleName { get; set; }
        public string Name { get; set; }
        public string Username { get; set; }
        public string EmailAddress { get; set; }
        public string ProfileImage { get; set; }
        public List<int> ListMenuPermissions { get; set; }
    }
    [ModelMetadataType(typeof(UsersModelMetaData))]
    public partial class Users
    {
        [NotMapped]
        [Required(ErrorMessage = "Required")]
        public string ForgetUser { get; set; }
        [NotMapped]
        [Required(ErrorMessage = "Required")]
        [StringLength(250, ErrorMessage = "Minimum 8 aplha or numeric required", MinimumLength = 8)]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }
        [NotMapped]
        [Required(ErrorMessage = "Required")]
        [StringLength(250, ErrorMessage = "Minimum 8 aplha or numeric required", MinimumLength = 8)]
        [Compare("NewPassword", ErrorMessage = "Password and Confirm Password not match")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
        [NotMapped]
        public IFormFile Profile { get; set; }
    }
    public class UsersModelMetaData
    {
        [Required(ErrorMessage = "Required")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Required")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Required")]
        [EmailAddress(ErrorMessage = "Email Address Invalid")]
        public string EmailAddress { get; set; }
        [Required(ErrorMessage = "Required")]
        public string Status { get; set; }
        [Required(ErrorMessage = "Required")]
        public int RoleId { get; set; }
    }
    public partial class AccountOpeningBalance
    {
        [NotMapped]
        public IFormFile Profile { get; set; }
    }
    public partial class Leads
    {
        [NotMapped]
        public string SnoFrom { get; set; }
        [NotMapped]
        public string snoto { get; set; }
    }
}