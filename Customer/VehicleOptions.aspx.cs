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
    public partial class VehicleOptions : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int vehicleid = 0;
                int customerid = 0;
                if (int.TryParse(Session["vehicleID"].ToString(), out vehicleid) && int.TryParse(Session["customerID"].ToString(), out customerid))
                {
                    populateInfo(customerid, vehicleid);
                }
            }
            errorDup.Visible = false;
            error.Visible = false;
            success.Visible = false;
            successDelete.Visible = false;
            
        }

        private void populateInfo(int customerid, int vehicleid)
        {

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
                using (SqlCommand command = new SqlCommand("Select * From Vehicle Where vehicleID =" + vehicleid, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                        lblVehicle.Text = dt.Rows[0]["vehicleName"].ToString() + ' ' + dt.Rows[0]["vehicleModel"].ToString();
                }
                dt = new DataTable();
                da = new SqlDataAdapter();
                using (SqlCommand command = new SqlCommand("Select * From Customer Where customerID =" + customerid, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                        lblCustomer.Text = dt.Rows[0]["firstName"].ToString() + ' ' + dt.Rows[0]["lastName"].ToString();
                }
            }
            ShowSummary();
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            foreach (ListItem listItem in cbxOptions.Items)
            {
                if (listItem.Selected)
                {
                    //do some work 
                    if (!Duplicate(listItem))
                    {
                        InsertItem(listItem);
                    }
                    else
                    {
                        errorDup.Visible = true;
                    }
                    ShowSummary();
                }
            }
        }

        private bool Duplicate(ListItem listItem)
        {
            int vehicleid = int.Parse(Session["vehicleID"].ToString());
            int customerid = int.Parse(Session["customerID"].ToString());
            bool isDuplicate = false;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("Select * From OptionsMapping Where optionID =" + listItem.Value + " AND vehicleID =" + vehicleid + " AND customerID =" + customerid, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    isDuplicate = (dt.Rows.Count > 0);
                }
            }
            return isDuplicate;
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

        private void InsertItem(ListItem listItem)
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
                    cmd.CommandText = @"INSERT INTO OptionsMapping(vehicleID, customerID, optionID) 
                            VALUES(@param1,@param2,@param3)";

                    cmd.Parameters.AddWithValue("@param1", vehicleid);
                    cmd.Parameters.AddWithValue("@param2", customerid);
                    cmd.Parameters.AddWithValue("@param3", listItem.Value);

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
        }

        protected void optionsgridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "deleteOption") return;
            int id = Convert.ToInt32(e.CommandArgument);
            int numDel = 0;
            try
            {
                using (var sc = new SqlConnection(connString))
                using (var cmd = sc.CreateCommand())
                {
                    sc.Open();
                    cmd.CommandText = "DELETE FROM OptionsMapping WHERE optionsmappingID = @optionmappingID";
                    cmd.Parameters.AddWithValue("@optionmappingID", id);
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
            ShowSummary();

        }
    }
}