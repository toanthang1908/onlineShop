using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using onlineShop.Models.EF;

namespace onlineShop.Models.EF
{
    [Serializable]
    public class CartItem
    {
        public SanPham sp { set; get; }
        public int SoLuong { set; get; }
    }
}