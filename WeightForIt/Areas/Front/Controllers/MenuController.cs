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
    [InitializeSimpleMembership]
    public class MenuController : Controller
    {

        private WfiEntities db = new WfiEntities();
        private int myId;
 
        //
        // GET: /Front/Menu/
          [Authorize]
        public ActionResult Index()
        {
            myId = WebSecurity.CurrentUserId;

            var mymenus = db.Menus.Where(f => f.UserId == myId).ToList();

            return View(mymenus);
        }

        //
        // GET: /Front/Menu/Create
         [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        //
         // POST: /Front/Menu/Create
         [HttpPost]
         [Authorize]
         [InitializeSimpleMembership]
         public ActionResult Create(List<String> tab, string titre,int tcal, int tpro, int tglu, int tlip )
         {
            
             try
             {
                 int intId = WebSecurity.CurrentUserId;
                 System.Diagnostics.Debug.WriteLine("titre : " + titre);

                 System.Diagnostics.Debug.WriteLine("tcal : " + tcal);
                 System.Diagnostics.Debug.WriteLine("tpro : " + tpro);
                 System.Diagnostics.Debug.WriteLine("tglu : " + tglu);
                 System.Diagnostics.Debug.WriteLine("tlip : " + tlip);


              

                 Menu menu = new Menu();
                 menu.label = titre;
                 menu.Date = DateTime.Now;
                 menu.UserId = intId;
                 menu.calories = tcal;
                 menu.proteins = tpro; 
                 menu.glucides = tglu; 
                 menu.lipids = tlip; 
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
                     c.quantity = float.Parse(idQty[1]);  
                     c.MenuId = LastMenuId;
                     db.Consumptions.Add(c);
                     db.SaveChanges();



                 }

                  return new JsonResult { Data = new { Success = true, } };
                 //return RedirectToAction("Index");
                 //return RedirectToAction("Index", "Menu");
             }
             catch (Exception e)
             {
                 System.Diagnostics.Debug.WriteLine("e : " + e);
                 return new JsonResult { Data = new { Success = false, } };
             }

         }

        [HttpPost]
        public JsonResult FindFoods(string searchText, int maxResults)
        {
       
            List<Food> foods = db.Foods.ToList();

            var result = from n in foods
                         where n.RefValue.ToLower().Contains(searchText.ToLower())
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


        // GET: /Front/Menu/Details
       [Authorize]
        public ActionResult Details(int id = 0)
        {
            
            myId = WebSecurity.CurrentUserId;
            try
            {
                var menu = db.Menus.Where(x => x.UserId == myId && x.MenuId == id).Single();
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
            catch (Exception e)
            {

                return RedirectToAction("Index");

            }

        }

       // GET: /Front/Menu/Program
       public ActionResult Program(int PId = 0, int MId =0)
       {

           myId = WebSecurity.CurrentUserId;
           try
           {


               var prog = db.Programs.Where(x => x.privacy == 1 && x.ProgramId == PId).Single();
               if (prog == null)
               {
                   return HttpNotFound();
               }


               var menu = db.Menus.Where(m=> m.MenuId == MId).Single();
               if (menu == null)
               {
                   return HttpNotFound();
               }
           




               List<Food> flist = new List<Food>();
               List<Consumption> c = (from m in db.Consumptions
                                      where m.MenuId.Equals(MId)
                                      select m).ToList();


               foreach (Consumption css in c)
               {

                   flist.Add(css.Food);


               }
               ViewData["Consumption"] = c;



               return View(menu);

           }
           catch (Exception e)
           {
               try
               {


                   var prog = db.Programs.Where(x => x.UserId == myId && x.ProgramId == PId).Single();
               if (prog == null)
               {
                   return HttpNotFound();
               }


               var menu = db.Menus.Where(m=> m.MenuId == MId).Single();
               if (menu == null)
               {
                   return HttpNotFound();
               }
           




               List<Food> flist = new List<Food>();
               List<Consumption> c = (from m in db.Consumptions
                                      where m.MenuId.Equals(MId)
                                      select m).ToList();


               foreach (Consumption css in c)
               {

                   flist.Add(css.Food);


               }
               ViewData["Consumption"] = c;



               return View(menu);


               }catch(Exception a){

                   return  RedirectToAction("Index", "Program");
               }


              

           }

       }


     

    }
}
