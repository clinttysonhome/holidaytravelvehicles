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
    public partial class Invoice : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DataConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateInvoice();
        }

        private void CreateInvoice()
        {
            int vehicleid = int.Parse(Session["vehicleID"].ToString());
            int customerid = int.Parse(Session["customerID"].ToString());

            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            using (SqlConnection con = new SqlConnection(connString))
            {
                string selectStatement = " Select v.*, c.*, o.* From Vehicle v INNER JOIN Customer c ON v.customerID = c.customerID " +
                                         "LEFT JOIN OptionsMapping om ON v.vehicleID = om.vehicleID " +
                                         "LEFT JOIN Options o ON om.optionID = o.optionID " +
                                         "WHERE v.vehicleID =" + vehicleid + " AND v.customerID =" + customerid;

                con.Open();
                using (SqlCommand command = new SqlCommand(selectStatement, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt);

                    PopulateInvoiceCustomerInfo(dt);
                }
                selectStatement = " Select  v.baseCost * .07 As SalesTax, ISNULL(SUM(o.optionCost),0) As OptionsCost, (v.baseCost * .07) + ISNULL(Sum(o.optionCost),0) + v.baseCost As FinalTotal, v.baseCost + ISNULL(Sum(o.optionCost),0) As SubTotal  From Vehicle v " +
                                  "INNER JOIN Customer c ON v.customerID = c.customerID " +
                                  "LEFT JOIN OptionsMapping om ON v.vehicleID = om.vehicleID " +
                                  "LEFT JOIN Options o ON om.optionID = o.optionID " +
                                  "WHERE v.vehicleID =" + vehicleid + " AND v.customerID =" + customerid +
                                  " GROUP BY v.baseCost";

                using (SqlCommand command = new SqlCommand(selectStatement, con))
                {
                    da.SelectCommand = command;
                    da.Fill(dt2);

                    PopulateInvoiceAmount(dt, dt2);
                }
            }


        }

        private void PopulateInvoiceAmount(DataTable dt, DataTable dt2)
        {
            lblBaseCost.Text = String.Format("{0:#.00}", Convert.ToDecimal(dt.Rows[0]["baseCost"].ToString()));
            lblTotal.Text = String.Format("{0:#.00}", Convert.ToDecimal(dt2.Rows[0]["SubTotal"].ToString()));
            lblSalesTax.Text = String.Format("{0:#.00}", Convert.ToDecimal(dt2.Rows[0]["SalesTax"].ToString()));
            lblSubTotal.Text = String.Format("{0:#.00}", Convert.ToDecimal(dt2.Rows[0]["SubTotal"].ToString()));
            lblFinalTotal.Text = String.Format("{0:#.00}", Convert.ToDecimal(dt2.Rows[0]["FinalTotal"].ToString()));
        }

        private void PopulateInvoiceCustomerInfo(DataTable dt)
        {
            if(dt.Rows.Count > 0)
            {
                lblVehicleID.Text = dt.Rows[0]["vehicleID"].ToString();
                lblName.Text = dt.Rows[0]["firstName"].ToString() + ' ' + dt.Rows[0]["lastName"].ToString();
                lblAddress.Text = dt.Rows[0]["address"].ToString();
                lblCity.Text = dt.Rows[0]["city"].ToString();
                lblState.Text = dt.Rows[0]["state"].ToString();
                lblZip.Text = dt.Rows[0]["zip"].ToString();

                lblName2.Text = dt.Rows[0]["firstName"].ToString() + ' ' + dt.Rows[0]["lastName"].ToString();
                lblAddress2.Text = dt.Rows[0]["address"].ToString();
                lblCity2.Text = dt.Rows[0]["city"].ToString();
                lblState2.Text = dt.Rows[0]["state"].ToString();
                lblZip2.Text = dt.Rows[0]["zip"].ToString();

                lblEmailName.Text = dt.Rows[0]["firstName"].ToString() +  dt.Rows[0]["lastName"].ToString();
                lblOrderDate.Text = dt.Rows[0]["orderDate"].ToString();

                lblVehicleName.Text = dt.Rows[0]["vehicleName"].ToString();
                lblVehicleModel.Text = dt.Rows[0]["vehicleModel"].ToString();
               

            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "RunPrintReport", "window.print();", true);
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/");              
        }
    }
}