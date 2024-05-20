using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using onlineShop.DAO;
using onlineShop.Models.EF;


namespace onlineShop.Areas.Admin.Controllers
{
    public class PhanLoaiController : Controller
    {
        //
        // GET: /Admin/PhanLoai/


        [HttpGet]
        public ActionResult List()
        {
            return View(new PhanLoaiDao().PhanLoais);
        }

        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Create(PhanLoai pl)
        {
            if (ModelState.IsValid)
            {
                var dao = new PhanLoaiDao();
                var result = dao.Insert(pl);
                if (result != null)
                {
                    return RedirectToAction("List", "PhanLoai");
                }
                else
                {
                    ModelState.AddModelError("404", "Cập nhật phân loại sản phẩm lỗi");
                }
            }
            return View("List");
        }

        public ActionResult Details(string MaPL)
        {
            var pl = new PhanLoaiDao().ViewDetail(MaPL);
            return View(pl);
        }


        public ActionResult Delete(string MaPL)
        {
            var pl = new PhanLoaiDao().ViewDetail(MaPL);
            return View(pl);
        }

        [HttpPost]
        public ActionResult Delete(PhanLoai pl)
        {
            if (ModelState.IsValid)
            {
                var dao = new PhanLoaiDao();
                var result = dao.Delete(pl);
                if (result)
                {
                    return RedirectToAction("List", "PhanLoai");
                }
                else
                {
                    ModelState.AddModelError("404", "Xóa phân loại sản phẩm lỗi");
                }
            }
            return View("List");
        }

        public ActionResult Edit(string MaPL)
        {
            var pl = new PhanLoaiDao().ViewDetail(MaPL);
            return View(pl);
        }

        [HttpPost]
        public ActionResult Edit(PhanLoai pl)
        {
            if (ModelState.IsValid)
            {
                var dao = new PhanLoaiDao();
                var result = dao.Edit(pl);
                if (result)
                {
                    return RedirectToAction("List", "PhanLoai");
                }
                else
                {
                    ModelState.AddModelError("404", "Cập nhật phân loại sản phẩm lỗi");
                }
            }
            return View("List");
        }
    }
}