using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class BanDoPhanBo
    {
        public string TenBanDo => Provider.GetTable<BanDoPhanBo>().Find<BanDoPhanBo>(CoSoID).TenBanDo;
        
    }
}