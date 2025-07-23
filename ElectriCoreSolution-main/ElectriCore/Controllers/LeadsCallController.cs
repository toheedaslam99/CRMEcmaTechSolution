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
    public class LeadsCallController : BaseController
    {
        public void BindDropdown()
        {
            UserSession UserRecord = GetUserData(this);
            ViewBag.user = dbContext.Users.Where(x => x.CompanyId == UserRecord.CompanyId && x.Status ==  EnumStatus.Enable).ToList();
            ViewBag.country = dbContext.Country.ToList();
            ViewBag.states = dbContext.State.ToList();
            ViewBag.banks = dbContext.Bank.ToList();
        }
        public IActionResult Index()
        {
            BindDropdown();
            return View();
        }
        public Leads GetRecord(int Id)
        {
            var Record = dbContext.Leads.FirstOrDefault(x => x.Id == Id);
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
                        int SerialTo = Convert.ToInt32(modelRecord.snoto);
                        int SerialFrom = Convert.ToInt32(modelRecord.SnoFrom);
                        int from = Math.Min(SerialFrom, SerialTo);
                        int to = Math.Max(SerialFrom, SerialTo);

                        var Records = dbContext.Leads.Where(x => x.CompanyId == UserRecord.CompanyId && Convert.ToInt32(x.Sno) >= from && Convert.ToInt32(x.Sno) <= to).ToList();
                        foreach (var item in Records)
                        {
                            item.LeadOwnerId = modelRecord.LeadOwnerId;
                            dbContext.Leads.Update(item);
                        }
                        dbContext.SaveChanges();
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "leadscall";
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
