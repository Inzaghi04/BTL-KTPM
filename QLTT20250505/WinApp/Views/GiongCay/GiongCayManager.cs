using System;

namespace WinApp.Views.GiongCay
{
    using Vst.Controls;
    using Models;

    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var donVi = item as GiongCay;
                searchKey = searchKey.ToLower();
                return (donVi?.TenGiongCay != null && donVi.TenGiongCay.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Danh sách giống cây trồng";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenGiongCay", Caption = "Tên giống cây", Width = 200, },
                new TableColumn { Name = "LoaiCay", Caption = "Tên loại cây", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
            };
        }
    }
    class ThongKeCayDauDong : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var donVi = item as GiongCay;
                searchKey = searchKey.ToLower();
                return (donVi?.TenGiongCay != null && donVi.TenGiongCay.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Giống cây/vườn đầu dòng";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenGiongCay", Caption = "Tên giống cây", Width = 200, },
                new TableColumn { Name = "LoaiCay", Caption = "Tên loại cây", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
            };
        }
    }
    class ThongKeGiongCayLuuHanh : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var donVi = item as GiongCay;
                searchKey = searchKey.ToLower();
                return (donVi?.TenGiongCay != null && donVi.TenGiongCay.ToLower().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Giống cây lưu hành tại Việt Nam";
            context.TableColumns = new object[] {
                new TableColumn { Name = "TenGiongCay", Caption = "Tên giống cây", Width = 200, },
                new TableColumn { Name = "LoaiCay", Caption = "Tên loại cây", Width = 200, },
                new TableColumn { Name = "MoTa", Caption = "Mô tả", Width = 300, },
            };
        }
    }
    class Add : EditView
    {
        protected override void RenderCore(ViewContext context)
        {
            base.RenderCore(context);
            context.Title = "Thông Tin Giống Cây";
            context.Editors = new object[] {
                new EditorInfo { Name = "TenGiongCay", Caption = "Tên giống cây", Layout = 12, },
                new EditorInfo { Name = "LoaiCay", Caption = "Tên loại cây", Layout = 12, },
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