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
    public class CompanyController : BaseController
    {
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
                var recordResult = (from x in dbContext.Company select x);
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
                var resultData = from x in data.Where(x => !x.IsDeleted)
                                 select new
                                 {
                                     x.Id,
                                     x.Name
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
            return View("Form", new Company());
        }
        public Company GetRecord(int Id)
        {
            UserSession UserRecord = GetUserData(this);
            var Record = dbContext.Company.FirstOrDefault(x => x.Id == Id);
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
        public IActionResult Save(Company modelRecord)
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
                    if (isAbleToAddOrUpdate)
                    {
                        bool isRecordWillAdded = false;
                        if (modelRecord.Id == 0)
                        {
                            isRecordWillAdded = true;
                            dbContext.Company.Add(modelRecord);
                            dbContext.SaveChanges();
                            var Record = dbContext.Company.OrderByDescending(c => c.Id).FirstOrDefault();
                            var User = new Users
                            {
                                RoleId = 2,
                                CompanyId = Record.Id,
                                Name = Record.Name,
                                Username = Record.Name.Substring(0, 2).ToLower() + "admin",
                                Password = "aSpsB5Aza7TJsnYXq+g6JA==",
                                EmailAddress = Record.Name.Substring(0, 2).ToLower() + "admin@gmail.com",
                                Status = EnumStatus.Enable,
                                IsDeleted = false,
                                CreatedDateTime = GetDateTime(ApplicationHelper.TimeZone),
                                CreatedBy = 1
                            };
                            dbContext.Users.Add(User);
                        }
                        else
                        {
                            dbContext.Company.Update(modelRecord);
                        }
                        dbContext.SaveChanges();
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "company";
                        if (isRecordWillAdded)
                        {
                            ajaxResponse.Message = "Record Added Successfully";
                        }
                        else
                        {
                            ajaxResponse.Message = "Record Updated Successfully";
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
