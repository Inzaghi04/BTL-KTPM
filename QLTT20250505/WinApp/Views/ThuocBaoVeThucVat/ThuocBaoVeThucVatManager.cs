using System;

namespace WinApp.Views.ThuocBaoVeThucVat
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var thuoc = item as ThuocBaoVeThucVat;
                searchKey = searchKey.ToLower();
                return (thuoc.TenThuoc != null && thuoc.TenThuoc.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Thống kê thuốc bảo vệ thực vật";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenThuoc", Caption = "Tên thuốc", Width = 200, },
                new TableColumn { Name = "LoaiThuoc", Caption = "Tên loại thuốc", Width = 200, },
                new TableColumn { Name = "NgaySanXuat", Caption = "Ngày sản xuất", Width = 300, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày hết hạn", Width = 300, },
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
                new EditorInfo { Name = "TenThuoc", Caption = "Tên thuốc", Layout = 12, },
                new EditorInfo { Name = "LoaiThuoc", Caption = "Tên loại thuốc", Layout = 12, },
                new EditorInfo { Name = "NgaySanXuat", Caption = "Ngày sản xuất", Layout = 12, },
                new EditorInfo { Name = "NgayHetHan", Caption = "Ngày hết hạn", Layout = 12, },
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