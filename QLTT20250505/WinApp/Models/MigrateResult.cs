using System;

namespace Models
{
    public partial class BanDoPhanBo
    {
        public int? ID { get; set; }
        public double? KinhDo { get; set; }
        public double? ViDo { get; set; }
        public int? CoSoID { get; set; }
        public int? VungTrongTrotID { get; set; }
    }
}
namespace Models
{
    public partial class CapDoHanhChinh
    {
        public int? ID { get; set; }
        public string TenCapDo { get; set; }
        public int? CapDo { get; set; }
    }
}
namespace Models
{
    public partial class MoHinhTrongTrot
    {
        public string MoHinh { get; set; }
        public int? SoLuong { get; set; }
    }
}
namespace Models
{
    public partial class DonViHanhChinh
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
    public partial class DonVi_Huyen 
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
    public partial class DonVi_Phuong
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
    public partial class DonVi_Xa
    {
        public int? ID { get; set; }
        public string TenDonVi { get; set; }
        public int? CapDoHanhChinhID { get; set; }
        public int? TrucThuocID { get; set; }
    }
}
namespace Models
{
    public partial class HoTrongTrot
    {
        public int? ID { get; set; }
        public int? VungTrongTrotID { get; set; }
        public int? SoHo { get; set; }
        public bool KQ { get; set; }
        public DateTime? NgayThongKe { get; set; }
    }

    public partial class ThongKeHoTrongTrot
    {
        public string KiemDinh { get; set; }
        public int? SL { get; set; }
    }
}
namespace Models
{
    public partial class HoSo
    {
        public int? Id { get; set; }
        public string Ten { get; set; }
        public string SDT { get; set; }
        public string Email { get; set; }
        public string Ext { get; set; }
    }
}
namespace Models
{
    public partial class LichSuTruyCap
    {
        public int? ID { get; set; }
        public string ThoiGianTruyCap { get; set; }
        public string MoTaHanhDong { get; set; }
        public int? NguoiDungID { get; set; }
    }
}
namespace Models
{
    public partial class LoaiCoSo
    {
        public int? ID { get; set; }
        public string TenLoaiCoSo { get; set; }
    }
}
namespace Models
{
    public partial class NguoiDung
    {
        public int? ID { get; set; }
        public string UserName { get; set; }
        public string Email_or_Phone { get; set; }
        public string Password { get; set; }
        public string TrangThai { get; set; }
        public int? VaiTroID { get; set; }
        public int? DonViHanhChinhID { get; set; }
    }
}
namespace Models
{
    public partial class Quyen
    {
        public int? Id { get; set; }
        public string Ten { get; set; }
        public string Ext { get; set; }
    }
}
namespace Models
{
    public partial class TaiKhoan
    {
        public string Ten { get; set; }
        public string MatKhau { get; set; }
        public int? QuyenId { get; set; }
        public int? HoSoId { get; set; }
    }
}
namespace Models
{
    public partial class ToChucChungNhan
    {
        public int? ID { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string Email_or_Phone { get; set; }
    }
}
namespace Models
{
    public partial class VaiTro
    {
        public int? ID { get; set; }
        public string TenVaiTro { get; set; }
    }
}
namespace Models
{
    public partial class VungTrongTrot
    {
        public int? ID { get; set; }
        public string TenVungTrongTrot { get; set; }
        public string MoTa { get; set; }
        public int? DonViHanhChinhID { get; set; }
    }
}
namespace Models
{
    public partial class GiongCay
    {
        public int? ID { get; set; }
        public string TenGiongCay { get; set; }

        public string LoaiCay { get; set; }
        public string MoTa { get; set; }
    }
}
namespace Models
{
    public partial class GiongCayLuuHanh
    {
        public int? ID { get; set; }
        public string TenGiongCay { get; set; }

        public string LoaiCay { get; set; }
        public string MoTa { get; set; }
    }
}

namespace Models
{
    public partial class CayDauDong
    {
        public int? ID { get; set; }
        public string TenGiongCay { get; set; }

        public string LoaiCay { get; set; }
        public string MoTa { get; set; }
    }
}

namespace Models
{
    public partial class ThuocBaoVeThucVat
    {
        public int ID { get; set; }
        public string TenThuoc { get; set; }
        public string LoaiThuoc { get; set; }
        public DateTime NgaySanXuat { get; set; }
        public DateTime NgayHetHan { get; set; }
    }
}

namespace Models
{
    public partial class ToChucCaNhanSanXuat
    {
        public int ID { get; set; }
        public int ToChuc_or_CaNhanID { get; set; }
        public int? CoSoID { get; set; } // Nullable vì CoSoID có thể NULL trong SQL
        public string GiayPhepSanXuat { get; set; } // NVARCHAR(50)
        public DateTime NgayCapGiayPhep { get; set; } // DATE
        public DateTime? NgayHetHan { get; set; } // Nullable vì NgayHetHan có thể NULL
        public string MoTa { get; set; } // NVARCHAR(250)
        public string TrangThai { get; set; } // NVARCHAR(50)

    }
}

namespace Models
{
    public partial class CoSoBuonBan
    {
        public int ID { get; set; }
        public string TenCoSo { get; set; } // NVARCHAR(100)
        public string DiaChi { get; set; } // NVARCHAR(250)
        public string SoGiayPhepKinhDoanh { get; set; } // NVARCHAR(15)

        public DateTime NgayCapGiayPhep { get; set; } // DATE
    }
}
namespace Models
{
    public partial class  PhanBon 
    {
        public int ID { get; set; }
        public string TenPhanBon { get; set; } // NVARCHAR(100)
        public string LoaiPhanBon { get; set; } // NVARCHAR(50)
        public DateTime NgaySanXuat { get; set; } // DATE
        public DateTime NgayHetHan { get; set; } // DATE
        public string MoTa { get; set; } // NVARCHAR(250)
    }
}