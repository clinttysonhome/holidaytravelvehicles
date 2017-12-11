using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolidayTravelVehicles.Customer
{
    public partial class VehiclePurchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 0;
            if (!Page.IsPostBack)
            {
                if (int.TryParse(Session["vehicleID"].ToString(), out id))
                {
                    getVehicleByID(id);
                }
            }
            
        }

        private void getVehicleByID(int id)
        {
            string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {                
                con.Open();                
                using (SqlCommand command = new SqlCommand("Select * From Vehicle Where vehicleID=" + id, con))
                    da.SelectCommand = command;
                da.Fill(dt);
                populateForm(dt);
            }
        }

        private void populateForm(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                vehicleName.Text = dt.Rows[0]["vehicleName"].ToString();
                vehicleModel.Text = dt.Rows[0]["vehicleModel"].ToString();
                vehicleYear.Text = dt.Rows[0]["vehicleYear"].ToString();
                manufacturer.Text = dt.Rows[0]["manufacturer"].ToString();
                basecost.Text = String.Format("{0:c}", dt.Rows[0]["baseCost"].ToString());
            }
        }

        protected void btnOptions_Click(object sender, EventArgs e)
        {
            if (ddlCustomers.SelectedIndex == 0)
            {
                error.Visible = true;
                return;
            }
            Session["customerID"] = ddlCustomers.SelectedValue;
            Response.Redirect("~/Customer/VehicleOptions.aspx");
        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            if (ddlCustomers.SelectedIndex == 0)
            {
                error.Visible = true;
                return;
            }
            Session["customerID"] = ddlCustomers.SelectedValue;
            Response.Redirect("~/Customer/VehicleConfirmPurchase.aspx");

        }
    }
}