using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;
using WeightForIt.Filters;
using WeightForIt.Models;

namespace WeightForIt.Areas.Front.Controllers
{
    [InitializeSimpleMembership]
    public class DashboardController : Controller
    {

        private WfiEntities db = new WfiEntities();

        //
        // GET: /Dashboard/

        public ActionResult Index()
        {
            Program program = db.Programs.Where(x => x.UserId == WebSecurity.CurrentUserId).OrderByDescending(x => x.ProgramId).FirstOrDefault();

            ViewData["program"] = program;
            return View(db.Programs.ToList());
        }

        public JsonResult GetJsonData()
        {
            List<Weight> weights = db.Weights.ToList();
            List<Menu> menus = db.Menus.ToList();
            List<Objective> objectives = db.Objectives.ToList();

            var result = from n in weights
                         where n.UserId.Equals(WebSecurity.CurrentUserId)
                         orderby n.date
                         select n;

            var result2 = from n in menus
                          join p in db.Meals on n.MenuId equals p.MenuId
                          where n.UserId.Equals(WebSecurity.CurrentUserId)
                          orderby p.Date
                          select new
                          {
                              n = n.calories,
                              p = p.Date.ToShortDateString()
                          };

            var result3 = from n in objectives
                          join p in db.Programs on n.ProgramId equals p.ProgramId
                          where p.UserId.Equals(WebSecurity.CurrentUserId)
                          orderby n.date
                          select new { n, p };

            var collectionWeight = result.Select(x => new
            {
                Poids = x.weight1,
                Date = x.date
            });

            var collectionCalorie = result2.Select(x => new
            {
                Calories = x.n,
                Date = x.p
            });

            var collectionObjective = result3.Select(x => new
            {
                Calories = x.n.calories,
                Date = x.n.date
            });

            return Json(new { collectionCalorie = collectionCalorie, collectionWeight = collectionWeight, collectionObjective = collectionObjective }, JsonRequestBehavior.AllowGet);
        }

    }
}
