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

        //public string favoritesOptions(int ProgramId, int myId)
        //{
        //    Program program = db.Programs.Find(ProgramId);
        //    var favoritePrograms = db.Favorites.Where(f => f.UserId == myId).ToList();
        //    String favoriteButton = "";

        //    if (program.UserId != myId && program.privacy == 1)
        //    {
        //        if (!favoritePrograms.Any())
        //        {
        //            favoriteButton = "Add to favorites";
        //        }
        //        else
        //        {
        //            favoriteButton = "Removes from favorites";
        //        }
        //    }
        //    return favoriteButton;
        //}

        //public void favoriteManagement()
        //{
        //}

        //private void removeFavorite(int ProgramId, int myId)
        //{
        //    throw new NotImplementedException();
        //}

        //private void makeFavorite(int ProgramId, int myId)
        //{
        //    throw new NotImplementedException();
        //}

    }
}
