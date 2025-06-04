using System;

namespace WinApp.Views.ToChucCaNhanSanXuatPhanBon
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var thuoc = item as ToChucCaNhanSanXuatPhanBon;
                searchKey = searchKey.ToLower();
                return (thuoc.TenCoSo != null && thuoc.TenCoSo.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Thống kê tổ chức, cá nhân sản xuất phân bón";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "GiayPhepSanXuat", Caption = "Giấy phép sản xuất", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép sản xuất", Width = 200, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày hết hạn", Width = 300, },
                new TableColumn { Name = "MoTa",Caption = "Mô tả", Width = 300, },
                new TableColumn { Name = "TrangThai",Caption = "Trạng thái", Width = 300, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Thuốc Bảo Vệ Thực Vật";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenCoSo", Caption = "Tên cơ sở", Layout = 12, },
                new EditorInfo { Name = "GiayPhepSanXuat", Caption = "Giấy phép sản xuất", Layout = 12, },
                new EditorInfo { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép sản xuất", Layout = 12, },
                new EditorInfo { Name = "NgaySanXuat", Caption = "Ngày sản xuất", Layout = 12, },
                new EditorInfo { Name = "NgayHetHan", Caption = "Ngày hết hạn", Layout = 12, },
                new EditorInfo { Name = "MoTa",Caption = "Mô tả", Layout = 12,},
                new EditorInfo { Name = "TrangThai",Caption = "Trạng thái", Layout = 12,},
            };
        }
    }

    class Edit : Add
    {
        protected override void OnReady()
        {
            // Thay FieldName bằng tên trường muốn thể hiện trên câu hỏi xóa bản ghi
            ShowDeleteAction("FieldName");
            // Thay EditorName bằng tên trường muốn cấm soạn thảo
            Find("EditorName", c => c.IsEnabled = false);
        }
    }
}