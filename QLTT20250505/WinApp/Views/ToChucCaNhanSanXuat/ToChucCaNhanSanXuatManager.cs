using System;

namespace WinApp.Views.ToChucCaNhanSanXuat
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var tochuc = item as ToChucCaNhanSanXuat;
                searchKey = searchKey.ToLower();
                return (tochuc.MoTa != null && tochuc.MoTa.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Thống kê tổ chức/cá nhân";
            context.TableColumns = new object[] {
                new TableColumn { Name = "GiayPhepSanXuat", Caption = "Tên thuốc", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Tên loại thuốc", Width = 200, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày hết hạn", Width = 300, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Width = 300, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin tổ chức/cá nhân";
            context.Editors = new object[] {
                new EditorInfo { Name = "GiayPhepSanXuat", Caption = "Tên thuốc", Layout = 12, },
                new EditorInfo { Name = "NgayCapGiayPhep", Caption = "Tên loại thuốc", Layout = 12, },
                new EditorInfo { Name = "NgayHetHan", Caption = "Ngày hết hạn", Layout = 12, },
                new EditorInfo { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Layout = 12, },
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