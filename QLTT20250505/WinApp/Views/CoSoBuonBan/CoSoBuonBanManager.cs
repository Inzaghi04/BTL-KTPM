using System;

namespace WinApp.Views.CoSoBuonBan
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var coso = item as CoSoBuonBan;
                searchKey = searchKey.ToLower();
                return (coso.TenCoSo != null && coso.TenCoSo.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Thống kê cơ sở buôn bán";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "SoGiayPhepKinhDoanh", Caption = "Số giấy phép kính doanh", Width = 300, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép", Width = 300, },
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