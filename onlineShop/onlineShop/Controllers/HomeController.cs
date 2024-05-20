using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using onlineShop.Models.EF;
using onlineShop.DAO;

namespace onlineShop.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            ViewBag.phanLoaiNu = new PhanLoaiDao().LayPhanLoai("Nữ");
            ViewBag.phanLoaiNam = new PhanLoaiDao().LayPhanLoai("Nam");
            return View();
        }
        // lấy các sản phẩm nam
        public PartialViewResult topProductMen()
        {
            List<SanPham> listMen = new SanPhamDao().SanPhams.Where(n => n.DoiTuong == "Nam").Take(8).ToList();
            return PartialView(listMen);
        }
        // lấy các sản phẩm nữ
        public PartialViewResult topProductWomen()
        {
            var listWomen = new SanPhamDao().SanPhams.Where(n => n.DoiTuong == "Nữ").Take(8).ToList();
            return PartialView(listWomen);
        }
        
    }
}