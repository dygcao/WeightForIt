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
    [Authorize]
    [InitializeSimpleMembership]
    public class FavoriteController : Controller
    {
        private WfiEntities db = new WfiEntities();
        private int myId;
        //
        // GET: /Front/Favorite/

        public ActionResult Index()
        {
            myId = WebSecurity.CurrentUserId;

            var favoritePrograms = db.Favorites.Where(f => f.UserId == myId).ToList();
            ViewData["favoritePrograms"] = favoritePrograms;
            return View(favoritePrograms);
        }

    }
}
