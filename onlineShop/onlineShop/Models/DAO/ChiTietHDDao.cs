using onlineShop.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace onlineShop.Models.DAO
{
    public class ChiTietHDDao
    {
        OnlineShopDbContext db = null;
        public ChiTietHDDao()
        {
            db = new OnlineShopDbContext();
        }
        public List<ChiTietHD> ViewDetails (int maHD){
            var list = db.ChiTietHDs.Where(x => x.MaHD == maHD).ToList();
            if (list != null)
                return list;
            return null;
        }
        public bool Insert(ChiTietHD details)
        {
            try
            {
                db.ChiTietHDs.Add(details);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}