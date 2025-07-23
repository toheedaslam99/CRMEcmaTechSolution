using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using ElectriCore.Models;
using System.Linq.Dynamic.Core;
using System.Collections.Generic;
using Newtonsoft.Json;
using static ElectriCore.Helpers.ApplicationHelper;
using ElectriCore.Helpers;
using System.Threading.Tasks;

namespace ElectriCore.Controllers
{
    public class RolesController : BaseController
    {
        [HttpPost]
        public JsonResult GetMenuRecords(int id)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
            ajaxResponse.Message = "No Record Found";
            UserSession UserRecord = GetUserData(this);
            List<Menus> SubscriptionMenuRecords = dbContext.Menus.ToList();
            IEnumerable<Menus> menuRecords;
            menuRecords = SubscriptionMenuRecords.Where(x => x.Parent != null).Select(o => o.Parent).Distinct();
            menuRecords = menuRecords.OrderBy(o => o.SequenceOrder);
            if (menuRecords.Count() > 0)
            {
                List<object> menuList = new List<object>();
                foreach(var parentMenu in menuRecords)
                {
                    Dictionary<string, object> menuDictionary = new Dictionary<string, object>();
                    menuDictionary.Add("ID", parentMenu.Id);
                    menuDictionary.Add("Name", parentMenu.Name);
                    IEnumerable<Menus> childMenuRecords;
                    childMenuRecords = SubscriptionMenuRecords.Where(o => o.ParentId == parentMenu.Id);
                    childMenuRecords = childMenuRecords.OrderBy(o => o.SequenceOrder);
                    if(childMenuRecords.Count() > 0)
                    {
                        List<object> childMenuList = new List<object>();
                        foreach (var childMenu in childMenuRecords)
                        {
                            Dictionary<string, object> childMenuDictionary = new Dictionary<string, object>();
                            childMenuDictionary.Add("ID", childMenu.Id);
                            childMenuDictionary.Add("Name", childMenu.Name);
                          //  List<MenuPermissions> menuPermissionRecords;
                            var menuPermissionRecords = childMenu.MenuPermissions.Where(o => o.Ptype.Equals("Both")).OrderBy(o => o.SequenceOrder).ToList();
                            List<object> childMenuPermissionList = new List<object>();
                            foreach (var _MenuPermission in menuPermissionRecords)
                            {
                                Dictionary<string, object> menuPermissionDictionary = new Dictionary<string, object>();
                                menuPermissionDictionary.Add("ID", _MenuPermission.Id);
                                menuPermissionDictionary.Add("Name", _MenuPermission.Name);
                                menuPermissionDictionary.Add("Type", _MenuPermission.Type);
                                bool isSelected = false;
                                var rolePermissionRecord = dbContext.RolePermissions.FirstOrDefault(o => o.RoleId == id && o.MenuId == childMenu.Id);
                                if (rolePermissionRecord != null)
                                {
                                    string[] assignPermission = rolePermissionRecord.Permissions.Split('|');
                                    if (assignPermission.Contains(_MenuPermission.Name))
                                    {
                                        isSelected = true;
                                    }
                                }
                                menuPermissionDictionary.Add("Selected", isSelected);
                                childMenuPermissionList.Add(menuPermissionDictionary);
                            }
                            childMenuDictionary.Add("Permissions", childMenuPermissionList);
                            childMenuList.Add(childMenuDictionary);
                        }
                        menuDictionary.Add("Menus", childMenuList);
                        menuList.Add(menuDictionary);
                    }
                }
                ajaxResponse.Success = true;
                ajaxResponse.Message = null;
                ajaxResponse.Type = EnumJQueryResponseType.DataOnly;
                ajaxResponse.Data = JsonConvert.SerializeObject(menuList);
            }
            return Json(ajaxResponse);
        }
        [HttpPost]
        public IActionResult Listener()
        {
            try
            {
                UserSession UserRecord = GetUserData(this);
                var draw = Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                var recordResult = (from x in dbContext.Roles select x);
                if (!string.IsNullOrEmpty(sortColumn) || string.IsNullOrEmpty(sortColumnDirection))
                {
                    recordResult = recordResult.OrderBy(sortColumn + " " + sortColumnDirection);
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    recordResult = recordResult.Where(m => m.Name.Contains(searchValue) && !m.IsDeleted);
                }
                recordsTotal = recordResult.Count(x => !x.IsDeleted);
                var data = recordResult.Skip(skip).Take(pageSize).ToList();
                var resultData = from x in data.Where(x => UserRecord.RoleName != EnumRole.SuperAdministrator ? !x.Name.Equals(EnumRole.SuperAdministrator) : true && !x.IsDeleted)
                                 select new
                                 {
                                     x.Id,
                                     x.Name,
                                     CreatedDateTime = Convert.ToDateTime(x.CreatedDateTime).ToString("dd-MMM-yyyy : hh:mm:ss"),
                                     UpdatedDateTime = x.UpdatedDateTime == null ? "" : Convert.ToDateTime(x.UpdatedDateTime).ToString("dd-MMM-yyyy : hh:mm:ss")
                                 };
                var jsonData = new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = resultData };
                return Ok(jsonData);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IActionResult Index()
        {
            ViewBag.PageType = EnumPageType.Index;
            return View();
        }
        public IActionResult Add()
        {
            UserSession UserRecord = GetUserData(this);
            ViewBag.PageType = EnumPageType.Add;
            return View("Form",new Roles());
        }
        public Roles GetRecord(int? id)
        {
            UserSession UserRecord = GetUserData(this);
            var Record = dbContext.Roles.FirstOrDefault(o => o.Name != EnumRole.Administrator && o.Id == id && o.IsDeleted == false);
            if (Record != null)
            {         
                var RolePermissionRecords = Record.RolePermissions.Where(x => x.Type== EnumMenuType.Children).OrderBy(o => o.SequenceOrder).ToList();
                if (RolePermissionRecords.Count > 0)
                {
                    string rolePermission = string.Empty;
                    foreach (RolePermissions RP in RolePermissionRecords)
                    {
                        rolePermission += RP.MenuId + "," + RP.Permissions + "||";
                    }
                    if (!string.IsNullOrWhiteSpace(rolePermission))
                    {
                        rolePermission = rolePermission.Remove(rolePermission.Length - 2, 2);
                        ViewBag.RolePermission = rolePermission;
                    }
                }
            }
            return Record;
        }
        public IActionResult Edit(int? id)
        {
            var Record = GetRecord(id);
            if (Record != null)
            {
                ViewBag.PageType = EnumPageType.Edit;
                return View("Form", Record);
            }
            else
            {
                return Redirect(ViewBag.WebsiteURL + "roles/add");
            }
        }
        public IActionResult View(int? id)
        {
            var Record = GetRecord(id);
            if (Record != null)
            {
                ViewBag.PageType = EnumPageType.View;
                return View("Form", Record);
            }
            else
            {
                return Redirect(ViewBag.WebsiteURL + "roles/add");
            }
        }
        public IActionResult Sorting(int? id)
        {
            var Record = GetRecord(id);
            if (Record != null)
            {
                ViewBag.PageType = EnumPageType.Sorting;
                ViewBag.ParentPermissions = Record.RolePermissions.Select(o => o.Menu.Parent).Distinct().ToList();
                ViewBag.ChildPermissions = Record.RolePermissions.Select(o => o.Menu).Distinct().ToList();
                return View("Form", Record);
            }
            else
            {
                return Redirect(ViewBag.WebsiteURL + "roles/add");
            }
        }
        [HttpPost]
        public JsonResult Delete(int? id)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
            ajaxResponse.Message = "Data not found in our records";
            try
            {
                if (IsUserLogin(this))
                {
                    if (id == 0)
                    {
                        ajaxResponse.Message = "ID is not in numeric format";
                    }
                    else
                    {
                        UserSession UserRecord = GetUserData(this);
                        var RecordToDelete = dbContext.Roles.FirstOrDefault(o => o.Id == id);
                        if (RecordToDelete != null)
                        {
                            if (RecordToDelete.IsEditable == true)
                            {
                                ajaxResponse.Message = "Unable to delete this record because of some reference data";
                            }
                            else
                            {
                                RecordToDelete.IsDeleted = true;
                                RecordToDelete.DeletedBy = UserRecord.UserId;
                                RecordToDelete.DeletedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                                dbContext.Roles.Update(RecordToDelete);
                                dbContext.SaveChanges();
                                ajaxResponse.Success = true;
                                ajaxResponse.Message = "Record Deleted Successfully";
                            }
                        }
                    }
                }
                else
                {
                    ajaxResponse.Type = EnumJQueryResponseType.RedirectWithDelay;
                    ajaxResponse.Message = "Session Expired";
                    ajaxResponse.TargetURL = ViewBag.WebsiteURL;
                }
            }
            catch(Exception ex)
            {
                string _catchMessage = ex.Message;
                if (ex.InnerException != null)
                {
                    _catchMessage += "<br/>" + ex.InnerException.Message;
                }
                ajaxResponse.Message = _catchMessage;
            }            
            return Json(ajaxResponse);
        }
        [HttpPost]
        public JsonResult Save(Roles modelRecord, string RolePermission)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
            ajaxResponse.Message = "Post Data Not Found";
            try
            {
                if (IsUserLogin(this))
                {
                    UserSession UserRecord = GetUserData(this);
                    bool isAbleToAddOrUpdate = true;
                    bool isRecordEditable = true;
                    Roles Record = dbContext.Roles.FirstOrDefault(o => o.Id != modelRecord.Id && o.Name.ToLower().Equals(modelRecord.Name.ToLower()) && o.IsDeleted == false);
                    if (Record != null && modelRecord.Id==0)
                    {
                        ajaxResponse.Message = "Name already exist in our records";
                        isAbleToAddOrUpdate = false;
                    }
                    if (isAbleToAddOrUpdate)
                    {
                        bool isRecordWillAdded = false;
                        if (modelRecord.Id == 0)
                        {
                            isRecordWillAdded = true;
                            modelRecord.CreatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                            modelRecord.CreatedBy = UserRecord.UserId;
                            dbContext.Roles.Add(modelRecord);
                        }
                        else
                        {
                            Roles roleRecord = dbContext.Roles.FirstOrDefault(r => r.Id == modelRecord.Id);
                            if (roleRecord.Name != modelRecord.Name && roleRecord.IsEditable)
                            {
                                modelRecord.Name = roleRecord.Name;
                                isRecordEditable = false;
                            }

                            dbContext.Entry(roleRecord).State = Microsoft.EntityFrameworkCore.EntityState.Detached;
                            modelRecord.UpdatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                            modelRecord.UpdatedBy = UserRecord.UserId;
                            dbContext.Roles.Update(modelRecord);

                            var RemoveExistingPermissions = dbContext.RolePermissions.Where(x => x.RoleId == modelRecord.Id).ToList();
                            dbContext.RolePermissions.RemoveRange(RemoveExistingPermissions);
                        }
                        dbContext.SaveChanges();
                        if (!string.IsNullOrWhiteSpace(RolePermission))
                        {
                            List<int> MenuIds = new List<int>();
                            string[] RecordRolePermissionArray = RolePermission.Split(new string[] { "||" }, StringSplitOptions.None);
                            if (RecordRolePermissionArray.Length > 0)
                            {
                                int SequenceOrder = 0;
                                foreach (string RolePermission1 in RecordRolePermissionArray)
                                {
                                    string[] RolePermissionArray = RolePermission1.Split(',');
                                    if (RolePermissionArray.Length == 2)
                                    {
                                        int MenuID = ParseInt(RolePermissionArray[0]);
                                        string MenuPermission = ParseString(RolePermissionArray[1]);
                                        if (MenuID != 0 && !string.IsNullOrWhiteSpace(MenuPermission))
                                        {
                                            if (MenuPermission.Equals("None"))
                                            {
                                                var RecordToDelete = dbContext.RolePermissions.FirstOrDefault(o => o.MenuId == MenuID && o.RoleId == modelRecord.Id);
                                                if (RecordToDelete != null)
                                                {
                                                    dbContext.RolePermissions.Remove(RecordToDelete);
                                                    dbContext.SaveChanges();
                                                }
                                            }
                                            else
                                            {
                                                bool isPermissionAdd = false;
                                                var RolePermissionRecord = dbContext.RolePermissions.FirstOrDefault(o => o.MenuId == MenuID && o.RoleId == modelRecord.Id);
                                                if (RolePermissionRecord == null)
                                                {
                                                    isPermissionAdd = true;
                                                    RolePermissionRecord = new RolePermissions();
                                                }
                                                MenuIds.Add(MenuID);
                                                RolePermissionRecord.RoleId = modelRecord.Id;
                                                RolePermissionRecord.MenuId = MenuID;
                                                RolePermissionRecord.Permissions = MenuPermission;
                                                RolePermissionRecord.Type = EnumMenuType.Children;
                                                if (isPermissionAdd)
                                                {
                                                    RolePermissionRecord.SequenceOrder = SequenceOrder;
                                                    dbContext.RolePermissions.Add(RolePermissionRecord);
                                                    SequenceOrder += 1;
                                                }
                                                else
                                                {
                                                    dbContext.RolePermissions.Update(RolePermissionRecord);
                                                }
                                                dbContext.SaveChanges(); 
                                            }
                                        }
                                    }
                                }
                            }
                            if(MenuIds.Count > 0)
                            {
                                var ParentRecords = dbContext.RolePermissions.Where(o => o.RoleId == modelRecord.Id && o.Type == EnumMenuType.Parent).ToList();
                                if (ParentRecords.Count > 0)
                                {
                                    dbContext.RolePermissions.RemoveRange(ParentRecords);
                                    dbContext.SaveChanges();
                                }
                                var ParentMenuRecords = dbContext.Menus.Where(o => MenuIds.Contains(o.Id)).Select(s => s.Parent).Distinct().ToList();
                                int SequenceOrder = 0;
                                foreach (var rec in ParentMenuRecords)
                                {
                                    var RolePermissionRecord = new RolePermissions();
                                    RolePermissionRecord.RoleId = modelRecord.Id;
                                    RolePermissionRecord.MenuId = rec.Id;
                                    RolePermissionRecord.Permissions = "All";
                                    RolePermissionRecord.Type = EnumMenuType.Parent;
                                    RolePermissionRecord.SequenceOrder = SequenceOrder;
                                    dbContext.RolePermissions.Add(RolePermissionRecord);
                                    SequenceOrder += 1;
                                    dbContext.SaveChanges();
                                }
                            }
                        }
                        if (isRecordWillAdded)
                        {
                            ajaxResponse.Message = "Role Added Successfully";
                        }
                        else
                        {
                            if (!isRecordEditable)
                            {
                                ajaxResponse.Message = "Role Updated Successfully But Name Of This Record Cannot Be Modified";
                            }
                            else
                            {
                                ajaxResponse.Message = "Role Updated Successfully";
                            }
                        }
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "roles";
                        ajaxResponse.Success = true;
                    }
                }
                else
                {
                    ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                    ajaxResponse.Message = "Session Expired";
                    ajaxResponse.TargetURL = ViewBag.WebsiteURL;
                }  
            }
            catch (Exception ex)
            {
                string _catchMessage = ex.Message;
                if (ex.InnerException != null)
                {
                    _catchMessage += "<br/>" + ex.InnerException.Message;
                }
                ajaxResponse.Message = _catchMessage;
            }
            return Json(ajaxResponse);
        }
        [HttpPost]
        public IActionResult SortingSave(string menus, int id)
        {
            List<Menus> modelRecord = JsonConvert.DeserializeObject<List<Menus>>(menus);
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
            ajaxResponse.Message = "Post Data Not Found";
            try
            {
                if (IsUserLogin(this))
                {
                    foreach (var menu in modelRecord)
                    {
                        var permissionRecord = dbContext.RolePermissions.FirstOrDefault(x => x.RoleId == id && x.MenuId == menu.Id);
                        permissionRecord.SequenceOrder = menu.SequenceOrder;
                        dbContext.RolePermissions.Update(permissionRecord);
                    }
                    dbContext.SaveChanges();
                    ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                    ajaxResponse.Message = "Sorting Updated Successfully";
                    ajaxResponse.TargetURL = ViewBag.WebsiteURL + "roles";
                    ajaxResponse.Success = true;
                }
                else
                {
                    ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                    ajaxResponse.Message = "Session Expired";
                    ajaxResponse.TargetURL = ViewBag.WebsiteURL;
                }
            }
            catch (Exception ex)
            {
                string _catchMessage = ex.Message;
                if (ex.InnerException != null)
                {
                    _catchMessage += "<br/>" + ex.InnerException.Message;
                }
                ajaxResponse.Message = _catchMessage;
            }
            return Json(ajaxResponse);
        }
    }
}