using Model.EF;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class PhanLoaiDao
    {
        OnlineShopDbContext db = null;
        public PhanLoaiDao()
        {
            db = new OnlineShopDbContext();
        }
        public IQueryable<PhanLoai> PhanLoais
        {
            get { return db.PhanLoais; }
        }
        public List<PhanLoai> LayPhanLoai(string doituong)
        {
            object [] para = {
                new SqlParameter ("@doituong", doituong) 
            };
            var result = db.Database.SqlQuery<PhanLoai>("PhanLoaidt @doituong", para).ToList();
            return result;
        }
        public PhanLoai ViewDetail(string MaPL)
        {
            var pl = db.PhanLoais.Find(MaPL);
            return pl;
        }
        public string Insert(PhanLoai pl)
        {
            pl.MaPL = "";
            PhanLoai dbEntry = db.PhanLoais.Find(pl.MaPL);
            if (dbEntry != null)
            {
                return null;

            }
            db.PhanLoais.Add(pl);
            db.SaveChanges();
            return pl.MaPL;
        }
        public bool Delete(PhanLoai pl)
        {
            PhanLoai dbEntry = db.PhanLoais.Find(pl.MaPL);
            if (dbEntry == null)
            {
                return false;
            }
            db.PhanLoais.Remove(dbEntry);
            db.SaveChanges();
            return true;
        }

        public bool Edit(PhanLoai pl)
        {

            PhanLoai dbEntry = db.PhanLoais.Find(pl.MaPL);
            if (dbEntry == null)
                return false;
            dbEntry.MaPL = pl.MaPL;
            dbEntry.TenPL = pl.TenPL;
            db.SaveChanges();
            return true;
        }




    }
}
