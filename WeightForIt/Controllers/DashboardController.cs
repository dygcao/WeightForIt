using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeightForIt.Models;

namespace WeightForIt.Controllers
{
    public class DashboardController : Controller
    {
        private WfiEntities db = new WfiEntities();

        //
        // GET: /Dashboard/

        public ActionResult Index()
        {
            var weights = db.Weights.Include(w => w.Program).Include(w => w.UserProfile);
            return View(weights.ToList());
        }

        public JsonResult GetJsonData()
        {
            List<Weight> weights = db.Weights.ToList();
            List<Menu> menus = db.Menus.ToList();
            //List<Consumption> consumptions = db.Consumptions.ToList();

            var result = from n in weights
                         orderby n.date
                         select n;

            var result2 = from n in menus
                         orderby n.Date
                         select n;

            /*var result2 = from n in consumptions
                          join p in db.Foods on n.FoodId equals p.FoodId
                          select new {n, p};*/

            var collectionWeight = result.Select(x => new
            {
                Poids   = x.weight1,
                Date    = x.date
            });

            var collectionCalorie = result2.Select(x => new
            {
                Calories = x.label,
                Date = x.Date
            });

            /*var collectionCalorie = result2.Select(x => new
            {
                Calories   = x.p.calories,
                Date    = x.date
            });*/

            return Json(new {collectionCalorie = collectionCalorie, collectionWeight = collectionWeight}, JsonRequestBehavior.AllowGet);
        }

    }
}
