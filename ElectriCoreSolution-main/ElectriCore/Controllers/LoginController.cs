using System;
using System.Linq;
using ElectriCore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.IO;
using static ElectriCore.Helpers.ApplicationHelper;
using System.Net;
using ElectriCore.Helpers;

namespace ElectriCore.Controllers
{
    public class LoginController : Controller
    {
        ElectriCoreContext dbContext;
        public LoginController()
        {
            dbContext = new ElectriCoreContext();
        }
        public IActionResult Index()
        {
            if (IsUserLogin(this))
            {
                return RedirectToAction("index", "home");
            }
            else
            {
                ViewBag.WebsiteName = GetSettingContentByName(dbContext, "Website Name");
                string loginCookieValue = ParseString(Request.Cookies[LoginUserCookie]);
                if (!string.IsNullOrWhiteSpace(loginCookieValue))
                {
                    ViewBag.IsRememberMe = "on";
                }
                else
                {
                    ViewBag.IsRememberMe = "";
                    Response.Cookies.Delete(LoginUserCookie);
                }
                return View();
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(Users user, string RememberMe)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            try
            {
                user.Password = Encrypt(user.Password);
                var userRecord = dbContext.Users.FirstOrDefault(x => x.Username.ToLower().Equals(user.Username.ToLower()) && x.Password.Equals(user.Password) && x.IsDeleted == false);
                if (userRecord == null)
                {
                    throw new Exception("Email Address or Password incorrect");
                }
                else
                {
                    if (userRecord.Status.Equals(EnumStatus.Enable))
                    {
                        if (RememberMe == "on")
                        {
                            string cookieGUIDValue = Guid.NewGuid().ToString();
                            var cookieOption = new CookieOptions();
                            cookieOption.Expires = GetUtcDateTime().AddDays(7);
                            Response.Cookies.Append(LoginUserCookie, cookieGUIDValue, cookieOption);
                        }
                        else
                        {
                            Response.Cookies.Delete(LoginUserCookie);
                        }
                        var userSessionData = new UserSession();
                        userSessionData.UserId = userRecord.Id;
                        userSessionData.Username = userRecord.Username;
                        userSessionData.EmailAddress = userRecord.EmailAddress;
                        userSessionData.Name = userRecord.Name;
                        userSessionData.ProfileImage = userRecord.ProfileImage;
                        userSessionData.RoleId = userRecord.RoleId;
                        userSessionData.RoleName = userRecord.Role.Name;
                        userSessionData.CompanyId = userRecord.CompanyId;
                        var MenuId = userRecord.Role.RolePermissions.Where(x => x.RoleId == userSessionData.RoleId).Select(x => x.MenuId).ToList();
                        userSessionData.ListMenuPermissions = MenuId;
                        AddSession(this, LoginUserSession, JsonConvert.SerializeObject(userSessionData));
                        ajaxResponse.Success = true;
                        ajaxResponse.Type = EnumJQueryResponseType.RedirectOnly;
                        ajaxResponse.TargetURL = ConvertToWebURL(dbContext, "home");
                    }
                    else
                    {
                        throw new Exception("Your Account has been Blocked! Please Contact Admin Thank You..");
                    }
                }
            }
            catch (Exception e)
            {
                ajaxResponse.Success = false;
                ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
                ajaxResponse.Message = e.Message;
            }
            return Json(ajaxResponse);
        }
        public IActionResult Forget(Users users)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Message = string.Empty;
            try
            {
                var userRecord = dbContext.Users.FirstOrDefault(x => (x.Username.Trim().ToLower().Equals(users.ForgetUser.Trim().ToLower()) || x.EmailAddress.Trim().ToLower().Equals(users.ForgetUser.Trim().ToLower())) && x.Status.Equals(EnumStatus.Enable) && !x.IsDeleted);
                if (userRecord != null)
                {
                    ajaxResponse.Data = userRecord.Id.ToString();
                    ajaxResponse.Success = true;
                }
                else
                {
                    ajaxResponse.Message = "Username or Email Address Not Found!";
                    ajaxResponse.Success = false;
                }
            }
            catch (Exception ex)
            {
                ajaxResponse.Success = false;
                ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
                ajaxResponse.Message = ex.Message;
            }
            return Json(ajaxResponse);
        }
        public IActionResult ForgetPassword(Users users)
        {
            AjaxResponse ajaxResponse = new AjaxResponse();
            ajaxResponse.Success = false;
            ajaxResponse.Message = string.Empty;
            try
            {
                var userRecord = dbContext.Users.FirstOrDefault(x => x.Id == users.Id && !x.IsDeleted);
                if (userRecord != null)
                {
                    userRecord.Password = Encrypt(users.NewPassword);
                    userRecord.UpdatedBy = users.Id;
                    userRecord.UpdatedDateTime = GetDateTime(ApplicationHelper.TimeZone);
                    dbContext.Users.Update(userRecord);
                    dbContext.SaveChanges();
                    ajaxResponse.Success = true;
                    ajaxResponse.Message = "Password Changed Successfully";
                    ajaxResponse.TargetURL = ConvertToWebURL(dbContext, "login");
                }
                else
                {
                    ajaxResponse.Message = "Username or Email Address Not Found!";
                    ajaxResponse.Success = false;
                }
            }
            catch (Exception ex)
            {
                ajaxResponse.Success = false;
                ajaxResponse.Type = EnumJQueryResponseType.MessageOnly;
                ajaxResponse.Message = ex.Message;
            }
            return Json(ajaxResponse);
        }
    }
}