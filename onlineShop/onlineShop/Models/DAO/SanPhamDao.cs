using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using onlineShop.Models.EF;
using System.Data.Entity;
using System.Data.Entity.Internal;
using System.Data.SqlClient;

namespace onlineShop.DAO
{
    public class SanPhamDao
    {
        OnlineShopDbContext db = null;
        public SanPhamDao()
        {
            db = new OnlineShopDbContext();
        }
        public IQueryable<SanPham> SanPhams
        {
            get { return db.SanPhams; }
        }
        public IQueryable<SanPham> Search(string key)
        {
            var list = (from s in db.SanPhams
                        where s.TenSP.Contains(key)
                        select s);
            return list;
        }
        public List<SanPham> laysp(string doituong, string MaPL, int pageIndex = 1, int pageSize = 9)
        {
            // Danh sách sản phẩm 
            //  totalRecord = new SanPhamDao().SanPhams.Count();
            List<SanPham> list;
            if (MaPL == null)
                list = db.SanPhams.Where(x => x.DoiTuong == doituong).OrderByDescending(x => x.MaSP).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            else
            list = db.SanPhams.Where(x => x.DoiTuong == doituong && x.MaPL == MaPL).OrderByDescending(x => x.MaSP).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();

            return list;
        }
        public SanPham ViewDetail(string MaSP)
        {
            var sp = db.SanPhams.Find(MaSP);
            return sp;
        }
        public List<SanPham> GetByMaPL(string MaPL)
        {
            var list = db.SanPhams.Where(x => x.MaPL == MaPL).ToList();
            if (list != null)
                return list;
            return null;
        }
        public string Insert(SanPham sp)
        {
            sp.MaSP = "";
            SanPham dbEntry = db.SanPhams.Find(sp.TenSP);
            if (dbEntry != null)
            {
                return null;

            }
            db.SanPhams.Add(sp);
            db.SaveChanges();
            return sp.MaSP;
        }
        public bool Delete(SanPham sp)
        {
            SanPham dbEntry = db.SanPhams.Find(sp.MaSP);
            if (dbEntry == null)
            {
                return false;
            }
            db.SanPhams.Remove(dbEntry);
            db.SaveChanges();
            return true;
        }

        public bool Edit(SanPham sp)
        {

            SanPham dbEntry = db.SanPhams.Find(sp.MaSP);
            if (dbEntry == null)
                return false;
            dbEntry.TenSP = sp.TenSP;
            dbEntry.DoiTuong = sp.DoiTuong;
            dbEntry.GiaCu = sp.GiaCu;
            dbEntry.GiaMoi = sp.GiaMoi;
            dbEntry.GioiThieuSP = sp.GioiThieuSP;
            dbEntry.Soluong = sp.Soluong;
            dbEntry.Anh = sp.Anh;
            dbEntry.MaPL = sp.MaPL;
            db.SaveChanges();
            return true;
        }
        public object laysp(string doituong, string mapl, ref int totalRecord, int page, int pageSize)
        {
            throw new NotImplementedException();
        }

    }
}
