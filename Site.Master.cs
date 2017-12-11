using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolidayTravelVehicles
{
    public partial class SiteMaster : MasterPage
    {
        public string imgPath = System.Web.VirtualPathUtility.ToAbsolute("~/Images/bg.jpg");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}