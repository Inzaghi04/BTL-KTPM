using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class QLTTController : BaseController
    {
        public override object Index()
        {
            return Redirect("GiongCay");
        }
        //public override object Index()
        //{
        //    return Redirect("CoSo");
        //}
    }
}
