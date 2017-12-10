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
    public partial class AddCustomer : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindCustomerGridView();
            }
            successDelete.Visible = false;
            success.Visible = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"INSERT INTO Customer(firstName, lastName, address, city, state, zip, phone, dateOfBirth) 
                            VALUES(@param1,@param2,@param3,@param4,@param5,@param6,@param7,@param8)";

                    cmd.Parameters.AddWithValue("@param1", firstName.Text);
                    cmd.Parameters.AddWithValue("@param2", lastName.Text);
                    cmd.Parameters.AddWithValue("@param3", address.Text);
                    cmd.Parameters.AddWithValue("@param4", city.Text);
                    cmd.Parameters.AddWithValue("@param5", state.Text);
                    cmd.Parameters.AddWithValue("@param6", zip.Text);
                    cmd.Parameters.AddWithValue("@param7", phone.Text);
                    cmd.Parameters.AddWithValue("@param8", dob.Text);
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
            bindCustomerGridView();
        }
        protected void custgridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "deleteCustomer") return;
            int id = Convert.ToInt32(e.CommandArgument);
            int numDel = 0;
            try
            {
                using (var sc = new SqlConnection(connString))
                using (var cmd = sc.CreateCommand())
                {
                    sc.Open();
                    cmd.CommandText = "DELETE FROM Customer WHERE customerID = @customerID";
                    cmd.Parameters.AddWithValue("@customerID", id);
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
            bindCustomerGridView();

        }
        private void bindCustomerGridView()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("Select * From Customer", con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);
                    custgridView.DataSource = dt;
                    custgridView.DataBind();
                }
            }
        }
    }
}