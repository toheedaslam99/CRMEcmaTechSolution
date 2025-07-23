using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElectriCore.Models;
using static ElectriCore.Helpers.ApplicationHelper;
using System.IO;
using System.Linq.Dynamic.Core;
using ElectriCore.Helpers;

namespace ElectriCore.Controllers
{
    public class UsersController : BaseController
    {
        public void BindDropdown()
        {
            UserSession UserRecord = GetUserData(this);
            ViewBag.Roles = dbContext.Roles.Where(x => UserRecord.RoleName != EnumRole.SuperAdministrator ? !x.Name.Equals(EnumRole.SuperAdministrator) : true && !x.IsDeleted).ToList();
        }
        public IActionResult Index()
        {
            return View();
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
                var recordResult = (from x in dbContext.Users.Where(x => UserRecord.RoleName != EnumRole.SuperAdministrator ? !x.Role.Name.Equals(EnumRole.SuperAdministrator) : true && !x.IsDeleted && x.CompanyId == UserRecord.CompanyId) select x);
                if (!string.IsNullOrEmpty(sortColumn) || string.IsNullOrEmpty(sortColumnDirection))
                {
                    recordResult = recordResult.OrderBy(sortColumn + " " + sortColumnDirection);
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    recordResult = recordResult.Where(m => m.Name.Contains(searchValue)
                                                || m.Role.Name.Contains(searchValue)
                                                || m.Username.Contains(searchValue)
                                                || m.EmailAddress.Contains(searchValue)
                                                || m.Status.Contains(searchValue) && !m.IsDeleted);
                }
                recordsTotal = recordResult.Count(x => !x.IsDeleted);
                var data = recordResult.Skip(skip).Take(pageSize).ToList();
                var resultData = from x in data.Where(x => !x.IsDeleted)
                                 select new
                                 {
                                     x.Id,
                                     Role = x.Role.Name,
                                     x.Name,
                                     x.Username,
                                     x.EmailAddress,
                                     x.Status,
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
        public IActionResult Add()
        {
            ViewBag.PageType = EnumPageType.Add;
            BindDropdown();
            return View("Form", new Users());
        }
        public Users GetRecord(int Id)
        {
            var Record = dbContext.Users.FirstOrDefault(x => x.Id == Id);
            BindDropdown();
            return Record;
        }
        public IActionResult Edit(int Id)
        {
            ViewBag.PageType = EnumPageType.Edit;
            return View("Form", GetRecord(Id));
        }
        public IActionResult View(int Id)
        {
            ViewBag.PageType = EnumPageType.View;
            return View("Form", GetRecord(Id));
        }
        [HttpPost]
        public JsonResult Delete(int? Id)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
            ajaxResponse.Message = "Data not found in our records";
            try
            {
                if (Id == 0)
                {
                    ajaxResponse.Message = "ID is not in numeric format";
                }
                else
                {
                    ajaxResponse.Success = false;
                    ajaxResponse.Message = "Can't delete record";
                    //var RecordToDelete = dbContext.Cities.FirstOrDefault(o => o.Id == Id);
                    //if (RecordToDelete != null)
                    //{
                    //    if (RecordToDelete.BusinessRegistrations.Count(x => !x.IsDeleted) > 0)
                    //    {
                    //        ajaxResponse.Success = false;
                    //        ajaxResponse.Message = "Can't delete record";
                    //    }
                    //    else
                    //    {
                    //        RecordToDelete.IsDeleted = true;
                    //        RecordToDelete.DeletedDateTime = DateTime.Now;
                    //        dbContext.Cities.Update(RecordToDelete);
                    //        dbContext.SaveChanges();
                    //        ajaxResponse.Success = true;
                    //        ajaxResponse.Message = "Record Deleted Successfully";
                    //    }
                    //}
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
        public IActionResult Save(Users modelRecord)
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
                    string FilePath = "";
                    if (modelRecord.Profile != null)
                    {
                        string fileName = modelRecord.Profile.FileName;
                        string path = Path.Combine(ViewBag.WebRootPath, UserProfileFilePath, fileName);
                        if (System.IO.File.Exists(path))
                        {
                            fileName = CreateFileName(Path.GetFileNameWithoutExtension(fileName)) + Path.GetExtension(fileName).ToLower();
                            path = Path.Combine(ViewBag.WebRootPath, UserProfileFilePath, fileName);
                        }
                        using (var stream = new FileStream(path, FileMode.Create))
                        {
                            modelRecord.Profile.CopyTo(stream);
                        }
                        FilePath = UserProfileFilePath + "/" + fileName;
                        if (fileName != null)
                        {
                            modelRecord.ProfileImage = fileName;
                        }
                    }
                    if (isAbleToAddOrUpdate)
                    {
                        bool isRecordWillAdded = false;
                        modelRecord.Password = Encrypt(modelRecord.Password);
                        if (modelRecord.Id == 0)
                        {
                            isRecordWillAdded = true;
                            modelRecord.CreatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                            modelRecord.CreatedBy = UserRecord.UserId;
                            dbContext.Users.Add(modelRecord);
                        }
                        else
                        {
                            modelRecord.UpdatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                            modelRecord.UpdatedBy = UserRecord.UserId;
                            dbContext.Users.Update(modelRecord);
                        }
                        dbContext.SaveChanges();
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "users";
                        if (isRecordWillAdded)
                        {
                            ajaxResponse.Message = "User Added Successfully";
                        }
                        else
                        {
                            ajaxResponse.Message = "User Updated Successfully";
                        }
                        ajaxResponse.Success = true;
                    }
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
