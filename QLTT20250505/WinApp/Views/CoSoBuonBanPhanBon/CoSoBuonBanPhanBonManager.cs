using System;

namespace WinApp.Views.CoSoBuonBanPhanBon
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var ten = item as CoSoBuonBanPhanBon;
                searchKey = searchKey.ToLower();
                return (ten.TenCoSo != null && ten.TenCoSo.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Thống kê cơ sở buôn bán phân bón";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "SoGiayPhepKinhDoanh", Caption = "Số giấy phép kinh doanh", Width = 300, },
                new TableColumn { Name = "NgayCapGiayPhep",Caption = "Ngày cấp giấy phép", Width = 300, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Cơ Sở Buôn Bán Phân Bón";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenCoSo", Caption = "Tên cơ sở", Layout = 12, },
                new EditorInfo { Name = "DiaChi", Caption = "Địa chỉ", Layout = 12, },
                new EditorInfo { Name = "SoGiayPhepKinhDoanh", Caption = "Số giấy phép kinh doanh", Layout = 12, },
                new EditorInfo { Name = "NgayCapGiayPhep",Caption = "Ngày cấp giấy phép", Layout = 12, },
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