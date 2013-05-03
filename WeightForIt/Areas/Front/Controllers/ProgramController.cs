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
    [Authorize]
    [InitializeSimpleMembership]
    public class ProgramController : Controller
    {
        private WfiEntities db = new WfiEntities();

        //
        // GET: /Front/Program/

        public ActionResult Index()
        {
            var programs = db.Programs.Where(x => x.UserId == WebSecurity.CurrentUserId );
            return View(programs.ToList());
        }

        //
        // GET: /Front/Program/Details/5

        public ActionResult Details(int id = 0)
        {
            Program program = db.Programs.Find(id);
            if (program == null)
            {
                return HttpNotFound();
            }
            return View(program);
        }

        //
        // GET: /Front/Program/Create

        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName");
            return View();
        }

        //
        // POST: /Front/Program/Create

        [HttpPost]
        public ActionResult Create(Program program)
        {
            if (ModelState.IsValid)
            {
                program.StartDate = DateTime.Now;
                program.privacy = 1;
                program.UserId = WebSecurity.CurrentUserId;

                db.Programs.Add(program);
                db.SaveChanges();
   
                return RedirectToAction("Edit/"+ program.ProgramId);
            }

            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName", program.UserId);
            return View(program);
        }

        //
        // GET: /Front/Program/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Program program = db.Programs.Find(id);

            if (program == null)
            {
                return HttpNotFound();
            }

            TimeSpan ts = DateTime.Now - program.StartDate.Value;
            int day = ts.Days;
            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName", program.UserId);

            List<Menu> menus = (from m in db.Menus
                                where m.UserId.Equals(WebSecurity.CurrentUserId)
                                select m).ToList();

            List<Meal> meals = (from m in db.Meals
                                where m.ProgramId.Equals(id) && m.Date.Year.Equals(DateTime.Now.Year) && m.Date.Month.Equals(DateTime.Now.Month) && m.Date.Day.Equals(DateTime.Now.Day) 
                                select m).ToList();

            /*Set view var*/
            ViewData["menus"] = menus;
            ViewData["meals"] = meals;
            ViewData["day"] = day + 1;
            return View(program);
        }

        //
        // POST: /Front/Program/Edit/5

        [HttpPost]
        public ActionResult Edit(Program program)
        {
            if (ModelState.IsValid)
            {
                db.Entry(program).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName", program.UserId);
            return View(program);
        }

        //
        // GET: /Front/Program/Meals/5

        public ActionResult Meals(int id = 0)
        {
            Program program = db.Programs.Find(id);

            if (program == null)
            {
                return HttpNotFound();
            }

            IQueryable<IGrouping<int, Meal>> meals = db.Meals
                        .Where(m => m.ProgramId == id)
                        .OrderByDescending(m => m.Date)
                        .GroupBy(m => m.Date.Day);

            ViewData["meals"] = meals;

            return View(program);
        }

        //
        // GET: /Front/Program/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Program program = db.Programs.Find(id);
            if (program == null)
            {
                return HttpNotFound();
            }
            return View(program);
        }

        //
        // POST: /Front/Program/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Program program = db.Programs.Find(id);
            db.Programs.Remove(program);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // GET: /Front/Program/Weight/5

        public ActionResult Weight(int id = 0)
        {
            Program program = db.Programs.Find(id);
            if (program == null)
            {
                return HttpNotFound();
            }

            var weights = program.Weights.OrderByDescending(w => w.date).Take(15);
            var vm = new WeightViewModel();
            vm.Program = program;
            vm.Weights = weights.ToList();
            vm.UserId = program.UserId;
            vm.ProgramId = program.ProgramId;
            vm.date = DateTime.Now;
            
            return View(vm);
        }

        //
        // POST: /Front/Program/Weight/1

        [HttpPost]
        public ActionResult Weight(Weight weight, int id = 0)
        {
            if (ModelState.IsValid)
            {
                db.Weights.Add(weight);
                db.SaveChanges();
                return RedirectToAction("Weight");
            }

            Program program = db.Programs.Find(id);
            var weights = program.Weights.OrderByDescending(w => w.date).Take(15);
            var vm = new WeightViewModel();
            vm.Program = program;
            vm.Weights = weights.ToList();
            vm.UserId = program.UserId;
            vm.ProgramId = program.ProgramId;
            vm.date = DateTime.Now;

            return View(vm);
        }

        //
        // GET: /Front/Program/DeleteWeight/5

        public ActionResult DeleteWeight(int id, int weightId)
        {
            Program program = db.Programs.Find(id);
            Weight weight = db.Weights.Find(weightId);
            if (program != null && weight.ProgramId == program.ProgramId)
            {
                db.Weights.Remove(weight);
                db.SaveChanges();
                return RedirectToAction("Weight", new { id = program.ProgramId });
            }
            else
            {
                return HttpNotFound();
            }
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}