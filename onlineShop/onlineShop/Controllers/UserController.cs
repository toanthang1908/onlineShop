using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using onlineShop.Models.EF;
using onlineShop.DAO;
using onlineShop.Security;


namespace onlineShop.Controllers
{
    public class UserController : Controller
    {
        OnlineShopDbContext db = new OnlineShopDbContext();
        // GET: /Account/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KhachHang kh)
        {
            if (ModelState.IsValid)
            {
                db.KhachHangs.Add(kh);
                db.SaveChanges();
                ViewBag.ThongBao = "Chúc mừng bạn đăng ký thành công!";
                return RedirectToAction("Index", "Home");

            }
            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(KhachHang model)
        {
            UserDao am = new UserDao();
            if (string.IsNullOrEmpty(model.TenTKK) || string.IsNullOrEmpty(model.PassK)
                || am.Login(model.TenTKK, model.PassK) == null)
            {
                ViewBag.ThongBao = "Tên tài khoản hoặc mật khẩu không đúng";
                return View();
            }
            SessesionPersister.User = am.Login(model.TenTKK, model.PassK);
            Session["UserName"] = model.TenTKK;
            string ten = Session["UserName"].ToString();
            Session["UserId"] = new UserDao().FindInfo(ten).MaKH;
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Logout()
        {
            SessesionPersister.User = null;
            Session["CartSession"] = null;
            return RedirectToAction("DangNhap", "User");

        }
    }
}