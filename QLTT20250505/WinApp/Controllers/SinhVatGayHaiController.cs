using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace WinApp.Controllers
{
    internal class SinhVatGayHaiController:DataController<SinhVatGayHai>
    {
        public object SauBenh()
        {
            object data = Provider.Select<TuoiSau_CapDoPhoBien>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
    }
}
