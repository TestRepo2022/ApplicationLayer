using BusinessLayer;
using CommanLayer;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ApplicationLayer.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AccountController : Controller
    {
        AdminBL adminBL = new AdminBL();

        public IActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        public async Task<IActionResult> Login(UserLogin user)
        {
            if (ModelState.IsValid)
            {
                var result=adminBL.LoginAdmin(user);
                if (result == "1")
                {
                    //do login success
                    var claims = new List<Claim>() {
                    new Claim(ClaimTypes.NameIdentifier, Convert.ToString(user.Email)),
                        new Claim(ClaimTypes.Name, user.Email),
                       // new Claim(ClaimTypes.Role, user.Role),
                        new Claim("FavoriteDrink", "Tea")
                };
                    //Initialize a new instance of the ClaimsIdentity with the claims and authentication scheme    
                    var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    //Initialize a new instance of the ClaimsPrincipal with ClaimsIdentity    
                    var principal = new ClaimsPrincipal(identity);
                    //SignInAsync is a Extension method for Sign in a principal for the specified scheme.    
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, new AuthenticationProperties()
                    {
                        IsPersistent = user.IsPersitent
                    }); ;

                    return RedirectToAction("Home", "Dashboard");
                }
                else
                {
                    //do login fail
                    ViewBag.Message = "Invalid Email or Password!";
                    return View(user);
                }
            }
            return View();
        }

        public async Task<IActionResult> SignOut() {

            await HttpContext.SignOutAsync();
            return RedirectToAction("Login");
        }


    }
}
