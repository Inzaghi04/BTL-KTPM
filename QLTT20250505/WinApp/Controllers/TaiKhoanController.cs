﻿using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    partial class TaiKhoanController : DataController<HoSo>
    {
        public object LichSu()
        {
            object data = Provider.Select<LichSuTruyCap>();
            // Xử lý dữ liệu thống kê
            return View(data);
        }
        //protected override HoSo CreateEntity()
        //{
        //    return new HoSo { QuyenId = 3 };
        //}

        //protected override void UpdateCore(HoSo e)
        //{
        //    // Đặt tên người dùng mặc định
        //    if (string.IsNullOrWhiteSpace(e.TenDangNhap))
        //        e.TenDangNhap = e.SDT;

        //    base.UpdateCore(e);
        //}

    }
}
