using onlineShop.DAO;
using onlineShop.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace onlineShop.Areas.Admin.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /Admin/SanPham/
        [HttpGet]
        public ActionResult List()
        {
            return View(new SanPhamDao().SanPhams);
        }
        public ActionResult SearchPL (string MaPL)
        {
            var list = new SanPhamDao().GetByMaPL(MaPL);
            return View(list);

        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(SanPham sp)
        {
            if (ModelState.IsValid)
            {
                var dao = new SanPhamDao();
                var result = dao.Insert(sp);
                if (result != null)
                {
                    return RedirectToAction("List", "SanPham");
                }
                else
                {
                    ModelState.AddModelError("404", "Cập nhật sản phẩm lỗi");
                }
            }
            return View("List");
        }

        public ActionResult Details(string MaSP)
        {
            var sp = new SanPhamDao().ViewDetail(MaSP);
            return View(sp);
        }

        [HttpGet]
        public ActionResult Delete(string MaSP)
        {
            var sp = new SanPhamDao().ViewDetail(MaSP);
            return View(sp);
        }

        [HttpPost]
        public ActionResult Delete(SanPham sp)
        {
            if (ModelState.IsValid)
            {
                var dao = new SanPhamDao();
                var result = dao.Delete(sp);
                if (result)
                {
                    return RedirectToAction("List", "SanPham");
                }
                else
                {
                    ModelState.AddModelError("404", "Xóa sản phẩm lỗi");
                }
            }
            return View("List");
        }

        public ActionResult Edit(string MaSP)
        {
            var sp = new SanPhamDao().ViewDetail(MaSP);
            return View(sp);
        }

        [HttpPost]
        public ActionResult Edit(SanPham sp)
        {
            if (ModelState.IsValid)
            {
                var dao = new SanPhamDao();
                var result = dao.Edit(sp);
                if (result)
                {
                    return RedirectToAction("List", "SanPham");
                }
                else
                {
                    ModelState.AddModelError("404", "Cập nhật sản phẩm lỗi");
                }
            }
            return View("List");
        }
    }
}