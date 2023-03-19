using AdminPanel.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using AdminPanel.BAL;
namespace AdminPanel.Controllers
{
    [CheckAccess]
    public class HomeController : Controller
    {
        public HomeController()
        {

        }

        public IActionResult Index()
        {
            
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
    }
}