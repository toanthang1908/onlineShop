using onlineShop.Models;
using onlineShop.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace onlineShop.Security
{
    public static class SessesionPersister
    {
        static string UserSession = "UserSession";
        static string NhanVienSession = "NhanVienSession";
        public static KhachHang User
        {
            get
            {
                // Lấy tai khoản của người dùng
                if (HttpContext.Current.User == null){
                    return null;
                }
                var SessionVar = (KhachHang)HttpContext.Current.Session[UserSession];
                if (SessionVar != null)
                {
                    return SessionVar;
                }
                 return null;
            }
            set
            {
                HttpContext.Current.Session[UserSession] = value;
            }
        }
        public static NhanVien nhanVien
        {
            get
            {
                // Lấy tai khoản của người dùng
                if (HttpContext.Current.User == null)
                {
                    return null;
                }
                var SessionVar = (NhanVien)HttpContext.Current.Session[NhanVienSession];
                if (SessionVar != null)
                {
                    return SessionVar;
                }
                return null;
            }
            set
            {
                HttpContext.Current.Session[NhanVienSession] = value;
            }
        }
    }
}