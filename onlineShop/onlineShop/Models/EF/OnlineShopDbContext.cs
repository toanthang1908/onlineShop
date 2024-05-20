namespace onlineShop.Models.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class OnlineShopDbContext : DbContext
    {
        public OnlineShopDbContext()
            : base("name=OnlineShopDbContext")
        {
        }

        public virtual DbSet<ChiTietHD> ChiTietHDs { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<PhanLoai> PhanLoais { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<ChiTietHD>()
            //    .Property(e => e.MaHD)
            //    .IsFixedLength();

            modelBuilder.Entity<ChiTietHD>()
                .Property(e => e.MaSP)
                .IsFixedLength();

            modelBuilder.Entity<ChiTietHD>()
                .Property(e => e.ThanhTien)
                .HasPrecision(18, 0);

            //modelBuilder.Entity<HoaDon>()
            //    .Property(e => e.MaHD).();

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.MaNV)
                .IsFixedLength();

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TinhTrangHD)
                .IsFixedLength();

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<HoaDon>()
                .HasMany(e => e.ChiTietHDs)
                .WithRequired(e => e.HoaDon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.GioiTinhK)
                .IsFixedLength();

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaNV)
                .IsFixedLength();

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.GioiTinh)
                .IsFixedLength();

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.TinhTrang)
                .IsFixedLength();

            modelBuilder.Entity<PhanLoai>()
                .Property(e => e.MaPL)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.MaSP)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.DoiTuong)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaCu)
                .HasPrecision(12, 0);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaMoi)
                .HasPrecision(12, 0);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.MaPL)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietHDs)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);
        }
    }
}
