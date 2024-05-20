using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class UserDao
    {
        OnlineShopDbContext db = null;
        public UserDao()
        {
            db = new OnlineShopDbContext();
        }
        public string Insert(NhanVien entity)
        {
            db.NhanViens.Add(entity);
            db.SaveChanges();
            return entity.MaNV;
        }
        public KhachHang Login(string username, string pass)
        {
            var result = db.KhachHangs.Where(a => a.TenTKK.Equals(username) && a.PassK.Equals(pass)).FirstOrDefault();
            KhachHang k = null;
            if (result != null)
            {
                k = new KhachHang();
                k.TenTKK = result.TenTKK;
                k.PassK = result.PassK;
                //k.Roles = (from a in context.Roles
                //           join b in context.UserInRoles
                //           on a.IDRole equals b.IDRole
                //           where (a.RoleName != null && b.UserName.Equals(username))
                //           select a.RoleName).ToList();
            }
            return k;
        }
    }
}
