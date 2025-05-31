using System;
namespace WinApp.Views.HoTrongTrot
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Danh Sách Hộ Trồng Trọt";
            context.TableColumns = new object[] {
                new TableColumn { Name = "VungTrongTrot", Caption = "Tên Vùng Trồng Trọt", Width = 200, },
                new TableColumn { Name = "SoHo", Caption = "Số Hộ", Width = 50, },
                new TableColumn { Name = "KiemDinh", Caption = "Kiểm Định", Width = 100, },
                new TableColumn { Name = "NgayThongKe", Caption = "Ngày Thống Kê", Width = 150, },
            };
        }
    }

    class ThongKe : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Title = "Số lượng vùng trồng trọt đạt chuẩn";
            context.TableColumns = new object[] {
                new TableColumn { Name = "KiemDinh", Caption = "Kiểm Định ", Width = 200, },
                new TableColumn { Name = "SL", Caption = "Số lượng", Width = 100, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Hộ Trồng Trọt";
            context.Editors = new object[] {
                new EditorInfo { Name = "VungTrongTrotID", Caption = " Tên Vùng Trồng Trọt", Layout = 12,
    Type = "select", ValueName = "ID", DisplayName = "TenVungTrongTrot", Options = Provider.Select<VungTrongTrot>(), },
                new EditorInfo { Name = "SoHo", Caption = " Số Hộ", Layout = 6,   },
                new EditorInfo { Name = "KetQua", Caption = " Kết Quả", Layout = 6,   },
                new EditorInfo { Name = "NgayThongKe", Caption = " Ngày Thống Kê", Layout = 12,   },
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
