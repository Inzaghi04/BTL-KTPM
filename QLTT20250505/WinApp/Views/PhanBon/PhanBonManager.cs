using System;

namespace WinApp.Views.PhanBon
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            //context.Search = (item, searchKey) =>
            //{
            //    var tochuc = item as ToChucCaNhanSanXuat;
            //    searchKey = searchKey.ToLower();
            //    return (tochuc.MoTa != null && tochuc.MoTa.ToLower().Contains(searchKey));
            //};
            base.RenderCore(context);
            context.Title = "Thống kê phân bón";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenPhanBon", Caption = "Tên phân bón", Width = 200, },
                new TableColumn { Name = "LoaiPhanBon", Caption = "Tên loại phân bón", Width = 200, },
                new TableColumn { Name = "NgaySanXuat", Caption = "Ngày sản xuất", Width = 300, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày hết hạn", Width = 300, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Phân Bón";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenPhanBon", Caption = "Tên phân bón", Layout = 12, },
                new EditorInfo { Name = "LoaiPhanBon", Caption = "Tên loại phân bón", Layout = 12, },
                new EditorInfo { Name = "NgaySanXuat", Caption = "Ngày sản xuất", Layout = 12, },
                new EditorInfo { Name = "NgayHetHan", Caption = "Ngày hết hạn", Layout = 12, },
                new EditorInfo { Name = "MoTa", Caption = "Mô tả", Layout = 12, },
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