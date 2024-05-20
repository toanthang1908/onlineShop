namespace onlineShop.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HoaDon()
        {
            ChiTietHDs = new HashSet<ChiTietHD>();
        }

        [Key]
        [Display(Name="Mã HĐ")]
        public int MaHD { get; set; }

        public int? MaKH { get; set; }

        [StringLength(10)]
        [Display(Name = "Mã Nhân Viên")]
        public string MaNV { get; set; }

        [Column(TypeName = "date")]
        [Display(Name = "Ngày mua")]
        public DateTime? NgayMua { get; set; }

        [StringLength(10)]
        [Display(Name = "Tình Trạng Hóa Đơn")]
        public string TinhTrangHD { get; set; }

        [Display(Name = "Tổng Tiền")]
        public decimal? TongTien { get; set; }

        [StringLength(50)]
        [Display(Name = "Ghi Chú")]
        public string GhiChu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHD> ChiTietHDs { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
