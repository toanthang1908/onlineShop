using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using onlineShop.Models.EF;

namespace onlineShop.Models.DAO
{
    public class HoaDonDao
    {
        OnlineShopDbContext db = null;
        public HoaDonDao()
        {
            db = new OnlineShopDbContext();
        }
        public IQueryable<HoaDon> HoaDons
        {
            get { return db.HoaDons; }
        }
        public int Insert(HoaDon order)
        {
            db.HoaDons.Add(order);
            db.SaveChanges();
            return order.MaHD;
        }
        public HoaDon GetByID(int maHD)
        {
            HoaDon hd = db.HoaDons.Find(maHD);
            if (hd != null)
                return hd;
            return null;
        }
        public List<HoaDon> GetByKH(int maKH)
        {
            var list = db.HoaDons.Where(x => x.MaKH == maKH).ToList();
            return list;
        }
        public int SetMHD()
        {
            int count = new HoaDonDao().HoaDons.Count();
            return count + 1;
        }
    }
}