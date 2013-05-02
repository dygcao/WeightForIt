using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;
using WeightForIt.Models;

namespace WeightForIt.Areas.Front.Controllers
{
    [Authorize]
    public class FeedController : Controller
    {
        private WfiEntities db = new WfiEntities();
        //
        // GET: /Front/Feed/

        public ActionResult Index()
        {
            var programFeed = db.Programs.OrderByDescending(p => p.PublicSince).Where(p => p.privacy == 1).Take(10).ToList();
            ViewData["programfeed"] = programFeed;
            return View(programFeed);
        }


    }
}
