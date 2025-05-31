using System;
namespace WinApp.Views.DieuKienTrongTrot
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "List of DieuKienTrongTrot";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenVungTrongTrot", Caption = "Tên Vùng Trồng Trọt", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
                new TableColumn { Name = "NgayCapNhat", Caption = "Ngày cập nhật", Width = 200, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "DieuKienTrongTrot Information";
            context.Editors = new object[] {
                new EditorInfo { Name = "HoTrongTrotID", Caption = " Caption of HoTrongTrotID", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "HoTrongTrotID", Options = Provider.Select<HoTrongTrot>(), },
                new EditorInfo { Name = "MoTa", Caption = " Caption of MoTa", Layout = 12,   },
                new EditorInfo { Name = "NgayCapNhat", Caption = " Caption of NgayCapNhat", Layout = 12,   },
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
