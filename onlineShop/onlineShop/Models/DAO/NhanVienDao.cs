using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using onlineShop.Models.EF;

namespace onlineShop.DAO
{
    public class NhanVienDao
    {
        OnlineShopDbContext db = null;
        public NhanVienDao()
        {
            db = new OnlineShopDbContext();
        }
        public IQueryable<NhanVien> NhanViens
        {
            get { return db.NhanViens; }
        }

        public NhanVien ViewDetail(string MaNV)
        {
            var nv = db.NhanViens.Find(MaNV);
            return nv;
        }
      
        public string Insert(NhanVien nv)
        {
         
            NhanVien dbEntry = db.NhanViens.Find(nv.MaNV);
            if (dbEntry != null)
            {
                return null;

            }
            db.NhanViens.Add(nv);
            db.SaveChanges();
            return nv.MaNV;
        }
        public bool Delete(NhanVien nv)
        {
            NhanVien dbEntry = db.NhanViens.Find(nv.MaNV);
            if (dbEntry == null)
            {
                return false;
            }
            db.NhanViens.Remove(dbEntry);
            db.SaveChanges();
            return true;
        }

        public bool Edit(NhanVien nv)
        {

            NhanVien dbEntry = db.NhanViens.Find(nv.MaNV);
            if (dbEntry == null)
                return false;
            dbEntry.MaNV = nv.MaNV;
            dbEntry.HoTen = nv.HoTen;
            dbEntry.GioiTinh = nv.GioiTinh;
            dbEntry.NgaySinh = nv.NgaySinh;
            dbEntry.DiaChi = nv.DiaChi;
            dbEntry.TinhTrang = dbEntry.TinhTrang;
            dbEntry.TenTK = nv.TenTK;
            dbEntry.SDT = nv.SDT;
            db.SaveChanges();
            return true;
        }
        public NhanVien LoginNV(string username, string pass)
        {
            var result = db.NhanViens.Where(a => a.TenTK.Equals(username) && a.Pass.Equals(pass)).FirstOrDefault();
            NhanVien k = null;
            if (result != null)
            {
                k = new NhanVien();
                k.TenTK = result.TenTK;
                k.Pass = result.Pass;
            }
            return k;
        }
    }
}
