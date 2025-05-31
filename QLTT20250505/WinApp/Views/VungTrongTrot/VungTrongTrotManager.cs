using System;
namespace WinApp.Views.VungTrongTrot
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh sách vùng trồng trọt";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenVungTrongTrot", Caption = "Tên vùng trồng trọt", Width = 200, },
                new TableColumn { Name = "DonViHanhChinh", Caption = "Trực thuộc", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 200, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Vùng Trồng Trọt";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenVungTrongTrot", Caption = " Tên vùng trồng trọt", Layout = 12,   },
                new EditorInfo { Name = "DonViHanhChinhID", Caption = " Trực thuộc", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenDonVi", Options = Provider.Select<DonViHanhChinh>(), },
                new EditorInfo { Name = "MoTa", Caption = " Mô tả", Layout = 12,   },
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
