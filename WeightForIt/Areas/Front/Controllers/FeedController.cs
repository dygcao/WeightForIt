using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeightForIt.Models;

namespace WeightForIt.Areas.Front.Controllers
{
    public class FeedController : Controller
    {
        private WfiEntities db = new WfiEntities();
        //
        // GET: /Front/Feed/

        public ActionResult Index()
        {
            var programFeed = db.Programs.OrderByDescending(p => p.PublicSince).Where(p => p.privacy == 0).Take(10);
          // Hook up or initialize _db here however you normally are doing it

          return PartialView(programFeed);
        }


    }
}
