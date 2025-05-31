using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class HoTrongTrot
    {
        public string KiemDinh => KQ ? "Đạt chuẩn" : "Chưa đạt chuẩn";
        public string VungTrongTrot
        {
            get
            {
                return Provider.GetTable<VungTrongTrot>().Find<VungTrongTrot>(VungTrongTrotID).TenVungTrongTrot;
            }
        }
    }
}
