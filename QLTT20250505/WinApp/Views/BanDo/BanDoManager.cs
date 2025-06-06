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
                new TableColumn { Name = "KinhDo", Caption = "Kinh độ", Width = 150, },
                new TableColumn { Name = "ViDo", Caption = "Vĩ độ", Width = 150, },
                new TableColumn { Name = "CoSoID", Caption = "Cơ sở ID", Width = 100, },
                new TableColumn { Name = "VungTrongTrotID", Caption = "Vùng trồng trọt ID", Width = 150, },
            };
        }
    }

    }
