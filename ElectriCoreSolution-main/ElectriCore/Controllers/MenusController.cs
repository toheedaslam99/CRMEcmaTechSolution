using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using ElectriCore.Models;
using System.Linq.Dynamic.Core;
using Microsoft.AspNetCore.Http;
using System.IO;
using static ElectriCore.Helpers.ApplicationHelper;
using ElectriCore.Helpers;
using System.Threading.Tasks;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace ElectriCore.Controllers
{
    public class MenusController : BaseController
    {
        [HttpPost]
        public IActionResult Listener()
        {
            try
            {
                var draw = Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                var recordResult = (from x in dbContext.Menus select x);
                if (!string.IsNullOrEmpty(sortColumn) || string.IsNullOrEmpty(sortColumnDirection))
                {
                    recordResult = recordResult.OrderBy(sortColumn + " " + sortColumnDirection);
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    recordResult = recordResult.Where(m => m.Parent.Name.Contains(searchValue)
                                                || m.Name.Contains(searchValue)
                                                || m.Type.Contains(searchValue)
                                                || m.Icon.Contains(searchValue)
                                                || m.CreatedDateTime.ToString().Contains(searchValue)
                                                || m.CreatedDateTime.ToString().Contains(searchValue));
                }
                recordsTotal = recordResult.Count();
                var data = recordResult.Skip(skip).Take(pageSize).ToList();
                var resultData = from x in data
                                 select new
                                 {
                                     x.Id,
                                     Parent = x.Parent != null ? x.Parent.Name : "#",
                                     x.Name,
                                     x.Type,
                                     x.Icon,
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
        public void GetRecords()
        {
            UserSession UserRecord = GetUserData(this);
            ViewBag.Menus = dbContext.Menus.Where(o =>  o.ParentId == null).ToList();
        }
        public IActionResult Index()
        {
            //ViewBag.AllowAdding = true;
            //ViewBag.AllowEditing = true;
            //ViewBag.AllowViewing = null;
            //ViewBag.AllowDeleting = null;
            return View();
        }
        public IActionResult Add()
        {
            GetRecords();
            ViewBag.PageType = EnumPageType.Add;
            return View("Form", new Menus());
        }
        public Menus GetRecord(int? id)
        {
            UserSession UserRecord = GetUserData(this);
            var Record = dbContext.Menus.FirstOrDefault(o => o.Id == id);
            if (Record != null)
            {
                GetRecords();
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
                return Redirect(ViewBag.WebsiteURL + "menus/add");
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
                return Redirect(ViewBag.WebsiteURL + "menus/add");
            }
        }
        //[HttpPost]
        //public JsonResult Delete(int? id)
        //{
        //    AjaxResponse ajaxResponse = new AjaxResponse();
        //    ajaxResponse.Success = false;
        //    ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
        //    ajaxResponse.Message = "Data not found in our records";
        //    try
        //    {
        //        if (IsUserLogin(this))
        //        {
        //            if (id == 0)
        //            {
        //                ajaxResponse.Message = "ID is not in numeric format";
        //            }
        //            else
        //            {
        //                UserSessionData UserRecord = GetUserData(this);
        //                var RecordToDelete = dbContext.Candidates.FirstOrDefault(o => o.SubscriptionId == UserRecord.SubscriptionId && o.Id == id);
        //                if (RecordToDelete != null)
        //                {
        //                    RecordToDelete.IsDeleted = true;
        //                    RecordToDelete.DeletedBy = UserRecord.UserId;
        //                    RecordToDelete.UtcdeletedDateTime = GetUtcDateTime();
        //                    RecordToDelete.DeletedDateTime = GetDateTime(UserRecord.SubscriptionTimeZone);
        //                    dbContext.Candidates.Update(RecordToDelete);
        //                    dbContext.SaveChanges();
        //                    ajaxResponse.Success = true;
        //                    ajaxResponse.Message = "Record Deleted Successfully";
        //                }
        //            }
        //        }
        //        else
        //        {
        //            ajaxResponse.Type = EnumJQueryResponseType.RedirectWithDelay;
        //            ajaxResponse.Message = "Session Expired";
        //            ajaxResponse.TargetURL = ViewBag.WebsiteURL;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        string _catchMessage = ex.Message;
        //        if (ex.InnerException != null)
        //        {
        //            _catchMessage += "<br/>" + ex.InnerException.Message;
        //        }
        //        ajaxResponse.Message = _catchMessage;
        //    }
        //    return Json(ajaxResponse);
        //}
        [HttpPost]
        public JsonResult Save(Menus modelRecord)
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
                    List<MenuPermissions> menuPermissions = modelRecord.MenuPermissions.ToList();
                    modelRecord.MenuPermissions = null;
                    Menus Record = dbContext.Menus.FirstOrDefault(o => o.Id != modelRecord.Id && o.Name.ToLower().Equals(modelRecord.Name.ToLower()));
                    if (Record != null)
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
                            dbContext.Menus.Add(modelRecord);
                        }
                        else
                        {
                            modelRecord.UpdatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                            modelRecord.UpdatedBy = UserRecord.UserId;
                            dbContext.Menus.Update(modelRecord);
                        }
                        dbContext.MenuPermissions.RemoveRange(dbContext.MenuPermissions.Where(x => x.MenuId == modelRecord.Id).ToList());
                        dbContext.SaveChanges();
                        if (menuPermissions.Count > 0)
                        {
                            foreach (var item in menuPermissions)
                            {
                                MenuPermissions permissions = new MenuPermissions()
                                {
                                    MenuId = modelRecord.Id,
                                    Name = item.Name,
                                    Ptype = "Both",
                                    Type = item.Type,
                                    SequenceOrder = item.SequenceOrder,
                                    IsDeleted = false,
                                    CreatedBy = UserRecord.UserId,
                                    CreatedDateTime = DateTime.Now
                                };
                                dbContext.MenuPermissions.Add(permissions);
                                dbContext.SaveChanges();
                            }
                        }
                        if(modelRecord.ParentId != null)
                        {
                            if ((modelRecord.MenuPermissions == null || modelRecord.MenuPermissions.Count == 0))
                            {
                                int Sequence = 0;
                                foreach (var item in ListMenuPermissions())
                                {
                                    string Type = string.Empty;
                                    switch (item)
                                    {
                                        case "None":
                                            Type = "R";
                                            break;
                                        case "All":
                                            Type = "R";
                                            break;
                                        default:
                                            Type = "C";
                                            break;
                                    }
                                    MenuPermissions permissions = new MenuPermissions()
                                    {
                                        MenuId = modelRecord.Id,
                                        Name = item,
                                        Ptype = "Both",
                                        Type = Type,
                                        SequenceOrder = Sequence,
                                        IsDeleted = false,
                                        CreatedBy = UserRecord.UserId,
                                        CreatedDateTime = DateTime.Now
                                    };
                                    dbContext.MenuPermissions.Add(permissions);
                                    dbContext.SaveChanges();
                                    Sequence ++;
                                }
                            }
                        }
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "menus";
                        if (isRecordWillAdded)
                        {
                            ajaxResponse.Message = "Menus Added Successfully";
                        }
                        else
                        {
                            ajaxResponse.Message = "Menus Updated Successfully";
                        }
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
    }
}