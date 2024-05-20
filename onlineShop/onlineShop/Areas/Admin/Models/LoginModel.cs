using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace onlineShop.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage="Vui long nhap ten tai khoan")]
        public string tenTK { set; get; }
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string matkhau { set; get; }
    }
}