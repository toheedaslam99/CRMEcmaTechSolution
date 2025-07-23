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
using Newtonsoft.Json;

namespace ElectriCore.Controllers
{
    public class ChartOfAccountsController : BaseController
    {
        public IActionResult GetRecord(int Id)
        {
            var Record = dbContext.ChartOfAccounts.FirstOrDefault(x => x.Id == Id);
            var RecordObject = new
            {
                Id = Record.Id,
                ParentId = Record.ParentId,
                Name = Record.Name,
                Status = Record.Status,
                CreatedBy = Record.CreatedBy,
                CreatedDateTime = Record.CreatedDateTime,
                Description = Record.Description,
                Code = Record.Code
            };
            return Json(RecordObject);
        }
        public IActionResult Index()
        {
            var lookup = dbContext.ChartOfAccounts.Where(x => x.Status.Equals(EnumStatus.Enable) && !x.IsDeleted).ToLookup(x => x.ParentId);
            var recursive = lookup[null].SelectRecursive(x => lookup[x.Id]).ToList();
            var JsonDataResult = recursive.Select(x => new TreeViewNode { id = x.Id.ToString(), parent = x.ParentId == null ? "#" : x.ParentId.ToString(), text = x.Code + "-" + x.Name }).ToList();
            ViewBag.Json = JsonConvert.SerializeObject(JsonDataResult);
            return View();
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
                    var RecordToDelete = dbContext.ChartOfAccounts.FirstOrDefault(o => o.Id == Id);
                    if (RecordToDelete != null)
                    {
                        RecordToDelete.IsDeleted = true;
                        RecordToDelete.DeletedDateTime = DateTime.Now;
                        dbContext.ChartOfAccounts.Update(RecordToDelete);
                        dbContext.SaveChanges();
                        ajaxResponse.Success = true;
                        ajaxResponse.Message = "Record Deleted Successfully";
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
        [HttpPost]
        public IActionResult Save(ChartOfAccounts modelRecord)
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
                            ChartOfAccounts parent = dbContext.ChartOfAccounts.FirstOrDefault(x => x.Id == modelRecord.ParentId);
                            ChartOfAccounts child = parent.InverseParent.LastOrDefault(x => x.ParentId == modelRecord.ParentId);
                            string TwoChar = child != null ? child.Name.Substring(0, 2).ToUpper() : parent.Name.Substring(0, 2).ToUpper();
                            string ParentCode = child != null ? child.Code : parent.Code;
                            ParentCode = TwoChar + ParentCode.Substring(2, 6) + 1;
                            modelRecord.Code = ParentCode;
                            modelRecord.CreatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                            modelRecord.CreatedBy = UserRecord.UserId;
                            dbContext.ChartOfAccounts.Add(modelRecord);
                        }
                        else
                        {
                            modelRecord.UpdatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                            modelRecord.UpdatedBy = UserRecord.UserId;
                            dbContext.ChartOfAccounts.Update(modelRecord);
                        }
                        dbContext.SaveChanges();
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "chartofaccounts";
                        if (isRecordWillAdded)
                        {
                            ajaxResponse.Message = "Chart Of Account Added Successfully";
                        }
                        else
                        {
                            ajaxResponse.Message = "Chart Of Account Updated Successfully";
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
public static class EnumerableExtensions
{
    public static IEnumerable<T> SelectRecursive<T>(this IEnumerable<T> source, Func<T, IEnumerable<T>> selector)
    {
        foreach (var parent in source)
        {
            yield return parent;

            var children = selector(parent);
            foreach (var child in SelectRecursive(children, selector))
                yield return child;
        }
    }
}