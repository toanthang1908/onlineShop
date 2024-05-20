using onlineShop.DAO;
using onlineShop.Models.EF;
using onlineShop.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace onlineShop.Areas.Admin.Controllers
{
    public class NhanVienController : Controller
    {
        //
        // GET: /Admin/SanPham/
        [HttpGet]
        public ActionResult List()
        {
            return View(new NhanVienDao().NhanViens);
        }

        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Create(NhanVien nv)
        {
            if (ModelState.IsValid)
            {
                var dao = new NhanVienDao();
                var result = dao.Insert(nv);
                if (result != null)
                {
                    return RedirectToAction("List", "NhanVien");
                }
                else
                {
                    ModelState.AddModelError("404", "Cập nhật sản phẩm lỗi");
                }
            }
            return View("List");
        }

        public ActionResult Details(string MaNV)
        {
            var nv = new NhanVienDao().ViewDetail(MaNV);
            return View(nv);
        }

        [HttpGet]
        public ActionResult Delete(string MaNV)
        {
            var nv = new NhanVienDao().ViewDetail(MaNV);
            return View(nv);
        }

        [HttpPost]
        public ActionResult Delete(NhanVien nv)
        {
            if (ModelState.IsValid)
            {
                var dao = new NhanVienDao();
                var result = dao.Delete(nv);
                if (result)
                {
                    return RedirectToAction("List", "NhanVien");
                }
                else
                {
                    ModelState.AddModelError("404", "Xóa nhân viên lỗi");
                }
            }
            return View("List");
        }

        public ActionResult Edit(string MaNV)
        {
            var nv = new NhanVienDao().ViewDetail(MaNV);
            return View(nv);
        }

        [HttpPost]
        public ActionResult Edit(NhanVien nv)
        {
            if (ModelState.IsValid)
            {
                var dao = new NhanVienDao();
                var result = dao.Edit(nv);
                if (result)
                {
                    return RedirectToAction("List", "NhanVien");
                }
                else
                {
                    ModelState.AddModelError("404", "Cập nhật nhân viên lỗi");
                }
            }
            return View("List");
        }

        public ActionResult NhanVien()
        {
            return View();
        }
    }
}