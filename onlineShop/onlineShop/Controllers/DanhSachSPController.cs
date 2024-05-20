using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using onlineShop.DAO;

namespace onlineShop.Controllers
{
    public class DanhSachSPController : Controller
    {
        //
        // GET: /DanhSachSP/
        
        public ViewResult DanhSachSanPham(string doituong, string MaPL, int page = 1, int pageSize = 9)
        {

            int totalRecord = new SanPhamDao().SanPhams.Count();
            ViewBag.phanLoaiNu = new PhanLoaiDao().LayPhanLoai("Nữ");
            ViewBag.phanLoaiNam = new PhanLoaiDao().LayPhanLoai("Nam");
            var model = new SanPhamDao().laysp(doituong, MaPL, page, pageSize);
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;
            ViewBag.doituong = doituong;

            return View(model);
        }

        public ActionResult Search(string key)
        {
            var list = new SanPhamDao().Search(key);
            return View(list);
        }

	}
}