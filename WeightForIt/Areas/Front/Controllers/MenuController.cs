using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeightForIt.Models;
using WeightForIt.Filters;
using WebMatrix.WebData;

namespace WeightForIt.Areas.Front.Controllers
{
    public class MenuController : Controller
    {

        private WfiEntities db = new WfiEntities();

 
        //
        // GET: /Front/Menu/
          [Authorize]
        public ActionResult Index()
        {
            return View(db.Menus.ToList());
        }

        //
        // GET: /Admin/Menu/Create
         [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/Menu/Create
         [HttpPost]
         [Authorize]
         [InitializeSimpleMembership]
         public ActionResult Create(List<String> tab, string titre)
         {

             try
             {
                 int intId = WebSecurity.CurrentUserId;
                 System.Diagnostics.Debug.WriteLine("titre : " + titre);


                 Menu menu = new Menu();
                 menu.label = titre;
                 menu.Date = DateTime.Now;
                 menu.UserId = intId;
                 db.Menus.Add(menu);
                 db.SaveChanges();
                 int LastMenuId = db.Menus.Max(item => item.MenuId);

                 foreach (var s in tab)
                 {

                     string[] idQty = s.ToString().Split('_');
                     System.Diagnostics.Debug.WriteLine("idQty[0] : " + idQty[0]);
                     System.Diagnostics.Debug.WriteLine("idQty[1] : " + idQty[1]);

                     Consumption c = new Consumption();


                     c.FoodId = int.Parse(idQty[0]);
                     c.quantity = int.Parse(idQty[1]);
                     c.MenuId = LastMenuId;
                     db.Consumptions.Add(c);
                     db.SaveChanges();
                 }

                 // return new JsonResult { Data = new { Success = true, } };
                 return RedirectToAction("Index");
             }
             catch (Exception e)
             {
                 return new JsonResult { Data = new { Success = false, } };
             }

         }

        [HttpPost]
        public JsonResult FindFoods(string searchText, int maxResults)
        {
       
            List<Food> foods = db.Foods.ToList();

            var result = from n in foods
                         where n.RefValue.ToLower().Contains(searchText)
                         select n;

            var collection = result.Select(x => new
            {
                FoodId = x.FoodId,
                RefValue = x.RefValue,
                unit = x.unit,
                calories = x.calories,
                proteins = x.proteins,
                glucides = x.glucides,
                lipids = x.lipids

            });

            return Json(collection,
            JsonRequestBehavior.AllowGet);
        }




        public ActionResult Details(int id = 0)
        {
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }

            List<Food> flist = new List<Food>();
            List<Consumption> c = (from m in db.Consumptions
                                   where m.MenuId.Equals(id)
                                   select m).ToList();

            foreach (Consumption css in c)
            {
              
                flist.Add(css.Food);
                    

            }
            ViewData["Consumption"] = c;
           


            return View(menu);
        }


     

    }
}
