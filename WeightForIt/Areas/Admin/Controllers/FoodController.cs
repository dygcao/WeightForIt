using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeightForIt.Models;

namespace WeightForIt.Areas.Admin.Controllers
{
    public class FoodController : Controller
    {
        private WfiEntities db = new WfiEntities();

        //
        // GET: /Admin/Food/

        public ActionResult Index()
        {
            return View(db.Foods.ToList());
        }

        //
        // GET: /Admin/Food/Details/5

        public ActionResult Details(int id = 0)
        {
            Food food = db.Foods.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            return View(food);
        }

        //
        // GET: /Admin/Food/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/Food/Create

        [HttpPost]
        public ActionResult Create(Food food)
        {
            if (ModelState.IsValid)
            {
                db.Foods.Add(food);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(food);
        }

        //
        // GET: /Admin/Food/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Food food = db.Foods.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            return View(food);
        }

        //
        // POST: /Admin/Food/Edit/5

        [HttpPost]
        public ActionResult Edit(Food food)
        {
            if (ModelState.IsValid)
            {
                db.Entry(food).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(food);
        }

        //
        // GET: /Admin/Food/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Food food = db.Foods.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            return View(food);
        }

        //
        // POST: /Admin/Food/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Food food = db.Foods.Find(id);
            db.Foods.Remove(food);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}