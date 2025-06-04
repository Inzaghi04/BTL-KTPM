using System;

namespace WinApp.Views.SinhVatGayHai
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var ten = item as SinhVatGayHai;
                searchKey = searchKey.ToLower();
                return (ten.TenSinhVat != null && ten.TenSinhVat.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Thống kê sinh vật gây hại";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenSinhVat", Caption = "Tên sinh vật", Width = 200, },
                new TableColumn { Name = "LoaiSinhVat", Caption = "Tên loại sinh vật", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
                new TableColumn { Name = "NgayPhatHien", Caption = "Ngày phát hiện", Width = 300, },
            };
        }
    }
    class SauBenh : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var ten = item as SinhVatGayHai;
                searchKey = searchKey.ToLower();
                return (ten.TenSinhVat != null && ten.TenSinhVat.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Thống kê sâu bệnh";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenSinhVat", Caption = "Tên sinh vật", Width = 200, },
                new TableColumn { Name = "TenTuoiSau", Caption = "Tuổi sâu", Width = 200, },
                new TableColumn { Name = "TenCapDoPhoBien", Caption = "Cấp độ phổ biến", Width = 300, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Sinh Vật Gây Hại";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenSinhVat", Caption = "Tên sinh vật", Layout = 12, },
                new EditorInfo { Name = "LoaiSinhVat", Caption = "Tên loại sinh" , Layout = 12, },
                new EditorInfo { Name = "MoTa", Caption = "Mô tả", Layout = 12, },
                new EditorInfo { Name = "NgayPhatHien", Caption = "Ngày phát hiện", Layout = 12, },
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