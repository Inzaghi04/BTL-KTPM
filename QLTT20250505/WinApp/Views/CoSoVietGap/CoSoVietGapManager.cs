using System;

namespace WinApp.Views.CoSoVietGap
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var ten = item as CoSoVietGap;
                searchKey = searchKey.ToLower();
                return (ten.TenCoSo != null && ten.TenCoSo.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Cơ sở đủ kiều kiện an toàn thực phẩm VietGap";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenCoSo", Caption = "Tên cơ sở", Width = 200, },
                new TableColumn { Name = "DiaChi", Caption = "Địa chỉ", Width = 200, },
                new TableColumn { Name = "SoGiayPhepVietGap", Caption = "Số giấy phép VietGap", Width = 200, },
                new TableColumn { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép sản xuất", Width = 200, },
                new TableColumn { Name = "NgayHetHan", Caption = "Ngày hết hạn", Width = 300, },

            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Cơ Sở";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenCoSo", Caption = "Tên cơ sở", Layout = 12, },
                new EditorInfo { Name = "DiaChi", Caption = "Địa chỉ", Layout = 12, },
                new EditorInfo { Name = "SoGiayPhepVietGap", Caption = "Số giấy phép VietGap", Layout = 12, },
                new EditorInfo { Name = "NgayCapGiayPhep", Caption = "Ngày cấp giấy phép sản xuất", Layout = 12, },
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