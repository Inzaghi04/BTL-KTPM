using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Views.BanDo
{
    using Vst.Controls;
    using Models;
    class Index : BaseView<DataListViewLayout>
    {
        protected override void RenderCore(ViewContext context)
        {
            context.Search = (item, searchKey) =>
            {
                var banDo = item as Models.BanDoPhanBo;
                searchKey = searchKey.ToLower();
                return (banDo.ViDo != null && banDo.ViDo.ToString().Contains(searchKey)) ||
                       (banDo.KinhDo != null && banDo.KinhDo.ToString().Contains(searchKey));
            };
            base.RenderCore(context);
            context.Title = "Bản đồ phân bố";
            context.TableColumns = new object[] {
                new TableColumn { Name = "CoSoID", Caption = "Cơ sở ID", Width = 100, },
                new TableColumn { Name = "VungTrongTrotID", Caption = "Vùng trồng trọt ID", Width = 150, },
                new TableColumn { Name = "Ten", Caption = "Tên", Width = 200, },
                new TableColumn { Name = "KinhDo", Caption = "Kinh độ", Width = 150, },
                new TableColumn { Name = "ViDo", Caption = "Vĩ độ", Width = 150, },
                
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
                new EditorInfo { Name = "CoSoID", Caption = "Cơ sở ID", Layout = 12, },
                new EditorInfo { Name = "VungTrongTrotID", Caption = "Vùng trồng trọt ID", Layout = 12, },
                new EditorInfo { Name = "Ten", Caption = "Tên", Layout = 12, },
                new EditorInfo { Name = "KinhDo", Caption = "Kinh độ", Layout = 12, },
                new EditorInfo { Name = "ViDo", Caption = "Vĩ độ", Layout = 12, },
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
