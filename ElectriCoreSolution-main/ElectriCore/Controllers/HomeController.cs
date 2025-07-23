using ElectriCore.Helpers;
using ElectriCore.Models;
using ExcelDataReader;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Threading.Tasks;
using static ElectriCore.Helpers.ApplicationHelper;

namespace ElectriCore.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            UserSession UserRecord = GetUserData(this);
            ViewBag.Leads = dbContext.Leads.Where(x => x.CompanyId == UserRecord.CompanyId && x.LeadOwnerId == UserRecord.UserId && x.LeadStatus == "Call Back").OrderByDescending(x => x.Id).Take(10);
            ViewBag.L = dbContext.Leads.Where(x => x.CompanyId == UserRecord.CompanyId && x.LeadOwnerId == UserRecord.UserId && x.LeadStatus == "Call Back").Count();
            ViewBag.LCB = dbContext.Leads.Where(x => x.CompanyId == UserRecord.CompanyId && x.LeadOwnerId == UserRecord.UserId).Count();
            ViewBag.C = dbContext.Customer.Where(x => x.CompanyId == UserRecord.CompanyId).Count();
            ViewBag.Company = dbContext.Company.FirstOrDefault(x => x.Id == UserRecord.CompanyId);
            return View();
        }
        public IActionResult Profile()
        {
            UserSession UserRecord = GetUserData(this);
            Users users = dbContext.Users.FirstOrDefault(x => x.Id == UserRecord.UserId);
            return View(users);
        }
        public IActionResult UnAuthorized()
        {
            ViewBag.WebsiteName = GetSettingContentByName(dbContext, "Website Name");
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult Logout()
        {
            var userSessionData = GetUserData(this);
            userSessionData = null;
            RemoveSession(this, LoginUserSession);
            return RedirectToAction("Index", "Login");
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
                        modelRecord.Password = Encrypt(modelRecord.Password);
                        modelRecord.UpdatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                        modelRecord.UpdatedBy = UserRecord.UserId;
                        dbContext.Users.Update(modelRecord);
                        dbContext.SaveChanges();
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "home/profile";
                        ajaxResponse.Message = "Profile Updated Successfully";
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
        public IActionResult UploadFileReader()
        { return View(); }

        [HttpPost]
        public async Task<IActionResult> UploadFileReader(IFormFile file)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
            UserSession UserRecord = GetUserData(this);
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

            if (file != null && file.Length > 0)
            {
                var uploadDirectory = $"{Directory.GetCurrentDirectory()}\\wwwroot\\Uploads";

                if (!Directory.Exists(uploadDirectory))
                {
                    Directory.CreateDirectory(uploadDirectory);
                }

                var filePath = Path.Combine(uploadDirectory, file.FileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                //Read and Save Excel Data
                using (var stream = System.IO.File.Open(filePath, FileMode.Open, FileAccess.Read))
                {
                    using (var reader = ExcelReaderFactory.CreateReader(stream))
                    {
                        bool isFirstRow = true;
                        List<string> columnNames = new List<string>();
                        var Records = new List<Leads>();

                        while (reader.Read())
                        {
                            if (isFirstRow)
                            {
                                // Read headers (first row)
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    columnNames.Add(reader.GetValue(i)?.ToString() ?? $"Column{i}");
                                }

                                isFirstRow = false;
                                continue;
                            }
                            int LeadOwnerId = 0;
                            var cellValue = reader.GetValue(0)?.ToString();

                            if (int.TryParse(cellValue, out int parsedId))
                            {
                                LeadOwnerId = parsedId;
                            }
                            int CompanyId = 0;
                            var CompanyIdcellValue = reader.GetValue(19)?.ToString();

                            if (int.TryParse(CompanyIdcellValue, out int CompanyIdparsedId))
                            {
                                CompanyId = CompanyIdparsedId;
                            }
                            var lead = new Leads
                            {
                                LeadOwnerId = LeadOwnerId,
                                FirstName = reader.GetValue(1)?.ToString(),
                                LastName = reader.GetValue(2)?.ToString(),
                                HomePhone = reader.GetValue(3)?.ToString(),
                                OtherPhone = reader.GetValue(4)?.ToString(),
                                MobileNo = reader.GetValue(5)?.ToString(),
                                Email = reader.GetValue(6)?.ToString(),
                                SecondaryEmail = reader.GetValue(7)?.ToString(),
                                SSN = reader.GetValue(8)?.ToString(),
                                BIN = reader.GetValue(9)?.ToString(),
                                Bank = reader.GetValue(10)?.ToString(),
                                Medicare = reader.GetValue(11)?.ToString(),
                                DOB = reader.GetValue(12)?.ToString(),
                                LeadStatus = reader.GetValue(13)?.ToString(),
                                CountryId = 1,
                                City = reader.GetValue(15)?.ToString(),
                                Address = reader.GetValue(16)?.ToString(),
                                ZipCode = reader.GetValue(17)?.ToString(),
                                Description = reader.GetValue(18)?.ToString(),
                                CompanyId = CompanyId,
                                IsDeleted = false,
                                CreatedDateTime = DateTime.Now,
                                UpdatedDateTime = DateTime.Now,
                                DeletedDateTime = DateTime.Now,
                                CreatedBy = UserRecord.UserId,
                                UpdatedBy = UserRecord.UserId,
                                DeletedBy = UserRecord.UserId,
                                StateId = reader.GetValue(27)?.ToString(),
                                Sno = reader.GetValue(28)?.ToString()
                            };

                            Records.Add(lead);
                        }
                        dbContext.Leads.AddRange(Records);
                        await dbContext.SaveChangesAsync();

                        ViewBag.ExcelData = Records;
                        ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
                        ajaxResponse.TargetURL = ViewBag.WebsiteURL + "home/uploadfilereader";
                        ajaxResponse.Message = "Records Insert Successfully";
                        ajaxResponse.Success = true;
                    }
                }
            }
            ajaxResponse.Type = EnumJQueryResponseType.MessageAndRedirectWithDelay;
            ajaxResponse.TargetURL = ViewBag.WebsiteURL + "home/uploadfilereader";
            ajaxResponse.Message = "Profile Updated Successfully";
            ajaxResponse.Success = true;
            return View();
        }

    }
}
