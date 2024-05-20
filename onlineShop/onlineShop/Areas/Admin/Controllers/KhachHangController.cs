using onlineShop.DAO;
using onlineShop.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace onlineShop.Areas.Admin.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /Admin/KhachHang/
        [HttpGet]
        public ActionResult List()
        {
            return View(new KhachHangDao().KhachHangs);
        }


        public ActionResult Details(int MaKH)
        {
            var kh = new KhachHangDao().ViewDetail(MaKH);
            return View(kh);
        }

        [HttpGet]
        public ActionResult Delete(int MaKH)
        {
            var kh = new KhachHangDao().ViewDetail(MaKH);
            return View(kh);
        }

        [HttpPost]
        public ActionResult Delete(KhachHang kh)
        {
            if (ModelState.IsValid)
            {
                var dao = new KhachHangDao();
                var result = dao.Delete(kh);
                if (result)
                {
                    return RedirectToAction("List", "KhachHang");
                }
                else
                {
                    ModelState.AddModelError("404", "Xóa sản phẩm lỗi");
                }
            }
             return View("List");
        }
    }
}