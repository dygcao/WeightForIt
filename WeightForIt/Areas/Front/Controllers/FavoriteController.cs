using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;
using WeightForIt.Filters;
using WeightForIt.Models;

namespace WeightForIt.Areas.Front.Controllers
{
    [InitializeSimpleMembership]
    public class FavoriteController : Controller
    {
        private WfiEntities db = new WfiEntities();
        private int myId;
        //
        // GET: /Front/Favorite/

        public ActionResult Index()
        {
            var MyId = WebSecurity.CurrentUserId;

            var favoritePrograms = db.Favorites.Where(f => f.UserId == myId).ToList();
            //var favoritePrograms = db.Programs.Include() OrderByDescending(p => p.PublicSince).Where(p => p.ProgramId == favoriteList.ProgramId).ToList();

            ViewData["favoritePrograms"] = favoritePrograms;
            return View(favoritePrograms);
        }

    }
}
