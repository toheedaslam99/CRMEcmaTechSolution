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
    public class LeadsController : BaseController
    {
        public void BindDropdown()
        {
            UserSession UserRecord = GetUserData(this);
            ViewBag.user = dbContext.Users.Where(x => x.CompanyId == UserRecord.CompanyId && x.Status ==  EnumStatus.Enable && x.Id == UserRecord.UserId).ToList();
            ViewBag.states = dbContext.State.ToList();
            ViewBag.banks = dbContext.Bank.ToList();
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
                var recordResult = (from x in dbContext.Leads.Where(x => UserRecord.CompanyId == x.CompanyId && x.LeadOwnerId == UserRecord.UserId).OrderByDescending(x => x.Id) select x);
                if (!string.IsNullOrEmpty(sortColumn) || string.IsNullOrEmpty(sortColumnDirection))
                {
                    recordResult = recordResult.OrderBy(sortColumn + " " + sortColumnDirection);
                }
                if (!string.IsNullOrEmpty(searchValue))
                {
                    recordResult = recordResult.Where(m => m.FirstName.Contains(searchValue)
                                                || m.LastName.Contains(searchValue)
                                                || m.HomePhone.Contains(searchValue)
                                                || m.MobileNo.Contains(searchValue)
                                                || m.BIN.Contains(searchValue));
                }
                recordsTotal = recordResult.Count();
                var data = recordResult.Skip(skip).Take(pageSize).ToList();
                var resultData = from x in data
                                 select new
                                 {
                                     x.Id,
                                     x.Sno,
                                     name = x.FirstName + " " + x.LastName,
                                     x.Address,
                                     x.City,
                                     state = x.StateId,
                                     x.ZipCode,
                                     x.Country,
                                     num = x.HomePhone + "/" + x.MobileNo + "/" + x.OtherPhone,
                                     x.Email,
                                     x.BIN,
                                     x.CardType
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
            return View("Form", new Leads());
        }
        public Leads GetRecord(int Id)
        {
            UserSession UserRecord = GetUserData(this);
            var Record = dbContext.Leads.FirstOrDefault(x => x.Id == Id && x.CompanyId == UserRecord.CompanyId);
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
        public IActionResult Save(Leads modelRecord)
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
                            modelRecord.CompanyId = UserRecord.CompanyId;
                            isRecordWillAdded = true;
                            dbContext.Leads.Add(modelRecord);
                        }
                        else
                        {
                            dbContext.Leads.Update(modelRecord);
                        }
                        dbContext.SaveChanges();
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "leads";
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
