using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class HoTrongTrotController : DataController<HoTrongTrot>
    {
        public object ThongKe()
        {
            object data = Provider.Select<ThongKeHoTrongTrot>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
    }
}
