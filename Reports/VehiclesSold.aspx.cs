using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolidayTravelVehicles.Reports
{
    public partial class VehiclesSold : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowReport();
        }
        private void ShowReport()
        {
            string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
               
                using (SqlCommand command = new SqlCommand("Select v.*, c.firstName + ' ' + c.lastName as customerName From Vehicle v INNER JOIN Customer c ON v.customerID = c.customerID Order By c.lastName ASC", con))
                    da.SelectCommand = command;
                da.Fill(dt);
                gridView.DataSource = dt;
                gridView.DataBind();

            }
        }
    }
}