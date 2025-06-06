using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class BanDoPhanBo
    {
        public string Ten
        {
            get
            {
                if (CoSoID.HasValue)
                {
                    var coSo = Provider.GetTable<CoSo>().Find<CoSo>(CoSoID.Value);
                    return coSo?.TenCoSo;
                }
                else if (VungTrongTrotID.HasValue)
                {
                    var vungTrongTrot = Provider.GetTable<VungTrongTrot>().Find<VungTrongTrot>(VungTrongTrotID.Value);
                    return vungTrongTrot?.TenVungTrongTrot;
                }
                return null;
            }
        }
    }
}

