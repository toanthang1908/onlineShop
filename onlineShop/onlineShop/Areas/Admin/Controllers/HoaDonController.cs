using onlineShop.Models.DAO;
using onlineShop.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace onlineShop.Areas.Admin.Controllers
{
    public class HoaDonController : Controller
    {
        //
        // GET: /Admin/HoaDon/
        public ActionResult List(int maKH)
        {
            HoaDonDao hd = new HoaDonDao();
            var listHD = hd.GetByKH(maKH);
            return View(listHD);
        }
        public ActionResult Details(int maHD)
        {
            ViewBag.MaKH = new HoaDonDao().GetByID(maHD).MaKH;
            ChiTietHDDao ct = new ChiTietHDDao();
            var list = ct.ViewDetails(maHD);
            return View(list);
        }
	}
}