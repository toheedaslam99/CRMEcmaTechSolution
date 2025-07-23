using ElectriCore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using static ElectriCore.Helpers.ApplicationHelper;

namespace ElectriCore.Controllers
{
    public class HttpHandlerController : Controller
    {
        protected ElectriCoreContext dbContext;
        public HttpHandlerController()
        {
            dbContext = new ElectriCoreContext();
        }
        public IActionResult HttpUnAuthorized()
        {
            ViewBag.WebsiteURL = GetSettingContentByName(dbContext, "Website URL");
            ViewBag.WebsiteName = GetSettingContentByName(dbContext, "Website Name");
            return View();
        }
    }
}
