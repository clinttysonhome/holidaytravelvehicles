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
    public partial class VehicleConfirmPurchase : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowSummary();
            SetInvoicePanel();
            error.Visible = false;
            success.Visible = false;

           
        }
        private void SetInvoicePanel()
        {            
            int vehicleid = int.Parse(Session["vehicleID"].ToString());
            int customerid = int.Parse(Session["customerID"].ToString());

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("Select * From Vehicle Where vehicleID =" + vehicleid + " AND customerID =" + customerid, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        pnlViewInvoice.Visible = true;
                    }
                    else
                    {
                        pnlViewInvoice.Visible = false;
                    }
                }
            }

        }
        private void ShowSummary()
        {
            int vehicleid = int.Parse(Session["vehicleID"].ToString());
            int customerid = int.Parse(Session["customerID"].ToString());

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("Select * From Customer Where customerID =" + customerid, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    custgridView.DataSource = dt;
                    custgridView.DataBind();
                }
            }

            dt = new DataTable();
            da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("Select * From Vehicle Where vehicleID =" + vehicleid, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    vehiclegridView.DataSource = dt;
                    vehiclegridView.DataBind();
                    
                }
            }

            dt = new DataTable();
            da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                string selectQuery = "Select om.*, o.* From OptionsMapping om INNER JOIN Options o ON om.optionID = o.optionID " +
                                     "Where om.vehicleID =" + vehicleid + " AND om.customerID =" + customerid;
                con.Open();
                using (SqlCommand command = new SqlCommand(selectQuery, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    optionsgridView.DataSource = dt;
                    optionsgridView.DataBind();
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            int vehicleid = int.Parse(Session["vehicleID"].ToString());
            int customerid = int.Parse(Session["customerID"].ToString());

            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"UPDATE Vehicle Set customerID = @param1, orderDate = @param2 WHERE vehicleID = @param3";

                    cmd.Parameters.AddWithValue("@param1", customerid);
                    cmd.Parameters.AddWithValue("@param2", DateTime.Today);
                    cmd.Parameters.AddWithValue("@param3", vehicleid);
                    
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
                        pnlViewInvoice.Visible = true;
                    }
                    else
                    {
                        error.Visible = true;
                    }
                }
            }
            
        }

        protected void btnViewInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/Invoice.aspx");
        }
    }
}