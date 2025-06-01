using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace WinApp.Controllers
{
    internal class GiongCayController : DataController<GiongCay>
    {
        public object ThongKeGiongCayLuuHanh()
        {
            object data = Provider.Select<GiongCayLuuHanh>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
        public object ThongKeCayDauDong()
        {
            object data = Provider.Select<CayDauDong>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
    }
}
