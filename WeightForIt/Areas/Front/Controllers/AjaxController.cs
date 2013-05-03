using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeightForIt.Models;

namespace WeightForIt.Areas.Front.Controllers
{
    public class AjaxController : Controller
    {
        private WfiEntities db = new WfiEntities();

        [HttpPost]
        public JsonResult saveProgram(int program, int[] menus)
        {
            try
            {
                foreach (int menu in menus) {
                    if (!db.Meals.Any(x => x.ProgramId == program && x.MenuId == menu))
                    {
                        Meal meal = new Meal();
                        meal.MenuId = menu;
                        meal.ProgramId = program;
                        meal.Date = DateTime.Now;

                        db.Meals.Add(meal);
                        db.SaveChanges();
                    }
                }
                return new JsonResult { Data = new { Success = true } };
            }
            catch (Exception e)
            {
                return new JsonResult { Data = new { Success = false } };
            }
        }


        [HttpPost]
        public JsonResult deleteMeal(int program, int menu)
        {
            try
            {
                if (!db.Meals.Any(x => x.ProgramId == program && x.MenuId == menu))
                {
                    return new JsonResult { Data = new { Success = false } };
                }
                else
                {
                    Meal meal = db.Meals.Where(x => x.ProgramId == program && x.MenuId == menu).Single();
                    db.Meals.Remove(meal);
                    db.SaveChanges();
                }

                return new JsonResult { Data = new { Success = true } };
            }
            catch (Exception e)
            {
                return new JsonResult { Data = new { Success = false } };
            }
        }

        [HttpPost]
        public JsonResult addObjective(int program, int objective)
        {
            try
            {
                WeightForIt.Models.Objective newObjective = new Objective();
                newObjective.calories = objective;
                newObjective.ProgramId = program;
                newObjective.date = DateTime.Now;

                db.Objectives.Add(newObjective);
                db.SaveChanges();

                return new JsonResult { Data = new { Success = true } };
            }
            catch (Exception e)
            {
                return new JsonResult { Data = new { Success = false } };
            }
        }


    }
}
