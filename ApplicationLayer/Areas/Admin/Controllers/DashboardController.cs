using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApplicationLayer.Areas.Admin.Controllers
{
    [Authorize]
    [Area("Admin")]
    public class DashboardController : Controller
    {
        public IActionResult Home()
        {
            return View();
        }
    }
}
