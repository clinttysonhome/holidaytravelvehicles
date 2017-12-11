using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolidayTravelVehicles.Salesperson
{
    public partial class AddVehicle : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                bindVehicleGridView();
            }
            successDelete.Visible = false;
            success.Visible = false;
            error.Visible = false;

        }

        protected void btnAddVehicle_Click(object sender, EventArgs e)
        {
           
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"INSERT INTO Vehicle(vehicleName, vehicleModel, vehicleYear, manufacturer, baseCost) 
                            VALUES(@param1,@param2,@param3,@param4,@param5)";

                    cmd.Parameters.AddWithValue("@param1", vehicleName.Text);
                    cmd.Parameters.AddWithValue("@param2", vehicleModel.Text);
                    cmd.Parameters.AddWithValue("@param3", vehicleYear.Text);
                    cmd.Parameters.AddWithValue("@param4", manufacturer.Text);
                    cmd.Parameters.AddWithValue("@param5", baseCost.Text);
                    
                    int numIns = 0;
                    try
                    {
                        numIns = cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        error.Visible = true;
                    }
                    if (numIns > 0)
                    {
                        success.Visible = true;
                    }
                    else
                    {
                        error.Visible = true;
                    }
                }

            }
            bindVehicleGridView();
        }

        protected void vehiclegridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "deleteVehicle") return;
            int id = Convert.ToInt32(e.CommandArgument);
            int numDel = 0;
            try
            {
                using (var sc = new SqlConnection(connString))
                using (var cmd = sc.CreateCommand())
                {
                    sc.Open();
                    cmd.CommandText = "DELETE FROM Vehicle WHERE vehicleID = @vehicleID";
                    cmd.Parameters.AddWithValue("@vehicleID", id);
                    numDel = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                error.Visible = true;
            }
            if (numDel > 0)
            {
                successDelete.Visible = true;

            }
        
            bindVehicleGridView();

        }

        private void bindVehicleGridView()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("Select * From Vehicle Where customerID IS NULL", con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    vehiclegridView.DataSource = dt;
                    vehiclegridView.DataBind();
                }
            }
        }
    }
}