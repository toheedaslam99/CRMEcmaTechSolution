using ElectriCore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static ElectriCore.Helpers.ApplicationHelper;

namespace ElectriCore.Controllers
{
    public class BaseController : Controller
    {
        protected ElectriCoreContext dbContext;
        public BaseController()
        {
            dbContext = new ElectriCoreContext();
        }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var host = Request.Host.Host.Split(".").FirstOrDefault();
            Controller controllerContext = (Controller)filterContext.Controller;
            UserSession UserRecord = GetUserData(controllerContext);
            if (UserRecord != null)
            {
                ViewBag.WebRootPath = Startup.CurrentHostingEnvironment.WebRootPath;
                ViewBag.contentRootPath = Startup.CurrentHostingEnvironment.ContentRootPath;
                ViewBag.WebsiteName = GetSettingContentByName(dbContext, "Website Name");
                ViewBag.WebsiteURL = GetSettingContentByName(dbContext, "Website URL");
                ViewBag.UserName = UserRecord.Name;
                ViewBag.Profile = UserRecord.ProfileImage;
                bool isAjaxCall = filterContext.HttpContext.Request.Headers["x-requested-with"] == "XMLHttpRequest";
                if (!isAjaxCall)
                {
                    string[] requestURL = filterContext.HttpContext.Request.Path.ToString().Split('/');
                    string controllerURL = requestURL[1].ToLower();
                    if (!IsUserLogin(controllerContext))
                    {
                        filterContext.Result = new RedirectResult("/login");
                    }
                    else
                    {
                        ViewBag.ControllerName = UpperCaseWords(controllerURL);
                        ViewBag.ControllerURL = controllerURL;
                        string menuURL = controllerURL;
                        string actionURL = string.Empty;
                        if (requestURL.Length > 2)
                        {
                            actionURL = requestURL[2].ToLower();
                            if (actionURL != "add" && actionURL != "edit" && actionURL != "view")
                            {
                                menuURL += "/" + actionURL;
                            }
                        }
                        var UserRolePermissionRecords = dbContext.RolePermissions.Where(o => o.RoleId == UserRecord.RoleId && (o.Role.Name.Equals(EnumRole.SuperAdministrator) || (UserRecord.ListMenuPermissions.Contains(o.MenuId) || o.Menu.Parent == null))).ToList();
                        if (!AllowedLink().Contains(menuURL))
                        {
                            filterContext.Result = new RedirectResult("/home/unauthorized");
                            if (UserRolePermissionRecords.Count > 0)
                            {
                                var UserRolePermissionRecord = UserRolePermissionRecords.FirstOrDefault(o => o.Menu.AccessUrl.ToLower().Equals(menuURL));
                                if (UserRolePermissionRecord != null)
                                {
                                    if (UserRolePermissionRecord.Permissions.ToLower().Equals("all"))
                                    {
                                        filterContext.Result = null;
                                        if (UserRolePermissionRecord.Menu.MenuPermissions.Where(x => !x.IsDeleted).Any(o => o.Name.ToLower().Equals("add")))
                                        {
                                            ViewBag.AllowAdding = true;
                                        }
                                        if (UserRolePermissionRecord.Menu.MenuPermissions.Where(x => !x.IsDeleted).Any(o => o.Name.ToLower().Equals("edit")))
                                        {
                                            ViewBag.AllowEditing = true;
                                        }
                                        if (UserRolePermissionRecord.Menu.MenuPermissions.Where(x => !x.IsDeleted).Any(o => o.Name.ToLower().Equals("delete")))
                                        {
                                            ViewBag.AllowDeleting = true;
                                        }
                                        if (UserRolePermissionRecord.Menu.MenuPermissions.Where(x => !x.IsDeleted).Any(o => o.Name.ToLower().Equals("view")))
                                        {
                                            ViewBag.AllowViewing = true;
                                        }
                                    }
                                    else
                                    {
                                        string[] UserPermissionArray = UserRolePermissionRecord.Permissions.ToLower().Split('|');
                                        if (string.IsNullOrWhiteSpace(actionURL) || UserPermissionArray.Contains(actionURL))
                                        {
                                            filterContext.Result = null;
                                        }
                                        if (filterContext.Result == null)
                                        {
                                            if (UserPermissionArray.Contains("add"))
                                            {
                                                ViewBag.AllowAdding = true;
                                            }
                                            if (UserPermissionArray.Contains("edit"))
                                            {
                                                ViewBag.AllowEditing = true;
                                            }
                                            if (UserPermissionArray.Contains("delete"))
                                            {
                                                ViewBag.AllowDeleting = true;
                                            }
                                            if (UserPermissionArray.Contains("view"))
                                            {
                                                ViewBag.AllowViewing = true;
                                            }
                                        }
                                    }
                                    if (filterContext.Result == null)
                                    {
                                        ViewBag.ControllerName = UserRolePermissionRecord.Menu.Name;
                                    }
                                }
                            }
                        }
                        if (filterContext.Result == null)
                        {
                            ViewBag.UserRecord = UserRecord;
                            if (UserRolePermissionRecords.Count > 0)
                            {
                                ViewBag.UserRolePermissionRecords = UserRolePermissionRecords;
                            }
                            if (ViewBag.UserRolePermissionRecords != null)
                            {
                                string Menu = string.Empty;
                                string MenuId = string.Empty;
                                Menu += "<div class='side-content-wrap'>";
                                Menu += "<div class='sidebar-left open rtl-ps-none' data-perfect-scrollbar='' data-suppress-scroll-x='true'>";
                                Menu += "<ul class='navigation-left'>";
                                List<RolePermissions> RolePremissionRecords = (List<RolePermissions>)ViewBag.UserRolePermissionRecords;
                                List<Menus> ParentMenuRecords = RolePremissionRecords.Where(o => o.Menu.Parent == null).OrderBy(o => o.SequenceOrder).Select(s => s.Menu).ToList();
                                foreach (var ParentMenuRecord in ParentMenuRecords)
                                {
                                    Menu += "<li class='nav-item' data-item='" + ParentMenuRecord.Id + "'>";
                                    Menu += "<a class='nav-item-hold' href='#'><i class='nav-icon " + ParentMenuRecord.Icon + "'></i><span class='nav-text'>" + ParentMenuRecord.Name + "</span></a>";
                                    Menu += "<div class='triangle'></div>";
                                    Menu += "</li>";
                                    MenuId += ParentMenuRecord.Id + ",";
                                }
                                Menu += "</ul>";
                                Menu += "</div>";
                                Menu += "<div class='sidebar-left-secondary rtl-ps-none' data-perfect-scrollbar='' data-suppress-scroll-x='true'>";
                                var Menus = MenuId.Split(",");
                                foreach (var item in Menus.ToList())
                                {
                                    if (!string.IsNullOrWhiteSpace(item))
                                    {
                                        var ChildMenuRecords = RolePremissionRecords.Where(o => o.Menu.ParentId == Convert.ToInt32(item)).OrderBy(o => o.SequenceOrder).ToList();
                                        foreach (var ChildMenuRecord in ChildMenuRecords)
                                        {
                                            string _menuUrl = ViewBag.WebsiteURL + ChildMenuRecord.Menu.AccessUrl;
                                            Menu += "<ul class='childNav' data-parent='" + item + "'>";
                                            Menu += "<li class='nav-item'><a href='" + _menuUrl + "'><i class='nav-icon " + ChildMenuRecord.Menu.Icon + "'></i><span class='item-name'>" + ChildMenuRecord.Menu.Name + "</span></a></li>";
                                            Menu += "</ul>";
                                        }
                                    }
                                }
                                Menu += "</div>";
                                Menu += "<div class='sidebar-overlay'></div>";
                                Menu += "</div>";
                                ViewBag.Menu = Menu;
                            }
                            if (!AllowedLink().Contains(menuURL))
                            {
                                string BreadCrumbHtml = "<div class='breadcrumb'>";
                                BreadCrumbHtml += "<h1 class='mr-2'>" + dbContext.Menus.Where(o => o.AccessUrl.ToLower().Equals(menuURL)).Select(o => o.Parent).FirstOrDefault().Name + "</h1>";
                                BreadCrumbHtml += "<ul>";
                                BreadCrumbHtml += "<li><a href='" + ConvertToWebURL(dbContext, "home") + "'>Dashboard</a></li>";
                                var MenuPermissionList = dbContext.MenuPermissions.Select(o => o.Name.ToLower()).Distinct().ToList();
                                if (MenuPermissionList.Contains(actionURL))
                                {
                                    BreadCrumbHtml += "<li><a href='" + ConvertToWebURL(dbContext, controllerURL) + "'>" + ViewBag.ControllerName + "</a></li>";
                                    BreadCrumbHtml += "<li>" + UpperCaseFirstLetter(actionURL) + "</li>";
                                }
                                else
                                {
                                    BreadCrumbHtml += "<li>" + ViewBag.ControllerName + "</li>";
                                }
                                BreadCrumbHtml += "</ul>";
                                BreadCrumbHtml += "</div>";
                                BreadCrumbHtml += "<div class='separator-breadcrumb border-top'></div>";
                                ViewBag.BreadCrumbHTML = BreadCrumbHtml;
                            }
                            else
                            {
                                if (!string.IsNullOrWhiteSpace(actionURL) && ViewBag.ControllerName != "Dashboard")
                                {
                                    ViewBag.ControllerURL = actionURL;
                                    ViewBag.ControllerName = UpperCaseFirstLetter(actionURL);
                                }
                                else if (ViewBag.ControllerName == "home")
                                {
                                }
                            }
                        }
                    }
                    ViewBag.PageURL = ViewBag.WebsiteURL + controllerURL;
                }
            }
            else
            {
                filterContext.Result = new RedirectResult("/login/index");
            }
            base.OnActionExecuting(filterContext);
        }
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            base.OnActionExecuted(filterContext);
        }
        protected override void Dispose(bool disposing)
        {
            dbContext.Dispose();
            base.Dispose(disposing);
        }
    }
}
