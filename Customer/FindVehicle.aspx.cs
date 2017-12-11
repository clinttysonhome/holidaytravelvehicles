using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolidayTravelVehicles.Customer
{
    public partial class FindVehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            string strWhere = "";
            sb.Append(" Where ");
            if (!String.IsNullOrEmpty(carname.Text))
                sb.Append("vehicleName ='" + carname.Text.ToUpper() + "'");

            if (!String.IsNullOrEmpty(model.Text))
            {
                sb.Append((sb.ToString() != " Where " ? " AND " : ""));
                sb.Append("vehicleModel ='" + model.Text.ToUpper() + "'");
            }
            if (!String.IsNullOrEmpty(year.Text))
            {
                sb.Append((sb.ToString() != " Where " ? " AND " : ""));
                sb.Append("vehicleYear ='" + year.Text.ToUpper() + "'");
            }
            if (!String.IsNullOrEmpty(manufacturer.Text))
            {
                sb.Append((sb.ToString() != " Where " ? " AND " : ""));
                sb.Append("manufacturer ='" + manufacturer.Text.ToUpper() + "'");
            }
            if (!String.IsNullOrEmpty(manufacturer.Text))
            {
                sb.Append((sb.ToString() != " Where " ? " AND " : ""));
                sb.Append("baseCost ='" + basecost.Text.ToUpper() + "'");
            }


            if (!String.IsNullOrEmpty(sb.ToString()))
                strWhere = sb.ToString();

            

            string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                //
                // Open the SqlConnection.
                //
                con.Open();
                //
                // The following code uses an SqlCommand based on the SqlConnection.

                //
                using (SqlCommand command = new SqlCommand("Select * From Vehicle" + strWhere + " customerID IS NULL", con))
                    da.SelectCommand = command;
                da.Fill(dt);
                gridView.DataSource = dt;
                gridView.DataBind();

            }

        }
        protected void gridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "purchaseVehicle") return;
            int id = Convert.ToInt32(e.CommandArgument);
            Session["vehicleID"] = id;
            Response.Redirect("~/Customer/VehiclePurchase.aspx");
            // do something
        }
    }
}