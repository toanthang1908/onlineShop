using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class KhachHangDao
    {
         OnlineShopDbContext db = null;
        public KhachHangDao()
        {
            db = new OnlineShopDbContext();
        }
        public IQueryable<KhachHang> KhachHangs
        {
            get { return db.KhachHangs; }
        }
        public int SetMaKH()
        {
            int count = new KhachHangDao().KhachHangs.Count();
            return count+1;
        }
        public KhachHang ViewDetail(int MaKH)
        {
            var kh = db.KhachHangs.Find(MaKH);
            return kh;
        }
        public int Insert(KhachHang kh)
        {
            kh.MaKH = SetMaKH();
            KhachHang dbEntry = db.KhachHangs.Find(kh.MaKH);
            if (dbEntry != null)
            {
                return -1;

            }
            db.KhachHangs.Add(kh);
            db.SaveChanges();
            return kh.MaKH;
        }
        public bool Delete(KhachHang kh)
        {
            KhachHang dbEntry = db.KhachHangs.Find(kh.MaKH);
            if (dbEntry == null)
            {
                return false; 
            }
            db.KhachHangs.Remove(dbEntry);
            db.SaveChanges();
            return true;
        }

        public bool Edit(KhachHang kh)
        {

            KhachHang dbEntry = db.KhachHangs.Find(kh.MaKH);
            if (dbEntry == null)
                return false;
            dbEntry.MaKH = kh.MaKH;
            dbEntry.HoTenK = kh.HoTenK;
            dbEntry.TenTKK = kh.TenTKK;
            dbEntry.NgaySinhK = kh.NgaySinhK;
            dbEntry.GioiTinhK = kh.GioiTinhK;
            dbEntry.SDTK = kh.SDTK;
            db.SaveChanges();
            return true;
        }

        public object ViewDetail(string MaKH)
        {
            throw new NotImplementedException();
        }
    }
        
}
