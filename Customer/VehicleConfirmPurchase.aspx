<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleConfirmPurchase.aspx.cs" Inherits="HolidayTravelVehicles.Customer.VehicleConfirmPurchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .red {
            color: red;
        }

        .form-area {
            background-color: #FAFAFA;
            padding: 10px 40px 60px;
            margin: 10px 0px 60px;
            border: 1px solid GREY;
        }

            .form-area button {
                margin: 8px;
                margin-right: 0px;
            }

        .mGrid {
            width: 100%;
            background-color: #fff;
            margin: 5px 0 10px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
        }

            .mGrid td {
                padding: 2px;
                border: solid 1px #c1c1c1;
                color: #717171;
            }

            .mGrid th {
                padding: 4px 2px;
                text-align: center;
                color: #fff;
                background: #424242 url(grd_head.png) repeat-x top;
                border-left: solid 1px #525252;
                font-size: 12pt;
            }

            .mGrid .alt {
                background-color: lightgrey;
            }

            .mGrid .pgr td {
                border-width: 0;
                padding: 0 6px;
                border-left: solid 1px #666;
                font-weight: bold;
                color: #fff;
                line-height: 12px;
            }

            .mGrid .pgr a {
                color: #666;
                text-decoration: none;
            }

                .mGrid .pgr a:hover {
                    color: #000;
                    text-decoration: none;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div style="font-weight: bold; font-size: 20pt">
            Payment Details
        </div>

        <div>

            <asp:GridView ID="custgridView"
                Caption="<span style='font-weight:bold; font-size:16pt'>Customer</span>"
                CssClass="mGrid"
                AlternatingRowStyle-CssClass="alt"
                AutoGenerateColumns="false"
                runat="server">
                <Columns>
                    <asp:BoundField DataField="firstName" HeaderText="First Name" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="address" HeaderText="Address" />
                    <asp:BoundField DataField="city" HeaderText="City" />
                    <asp:BoundField DataField="state" HeaderText="State" />
                    <asp:BoundField DataField="zip" HeaderText="Zip" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" />
                    <asp:BoundField DataField="dateOfBirth" HeaderText="Date Of Birth" />
                </Columns>
            </asp:GridView>

            <asp:GridView ID="vehiclegridView"
                Caption="<span style='font-weight:bold; font-size:16pt'>Vehicle</span>"
                CssClass="mGrid"
                AlternatingRowStyle-CssClass="alt"
                AutoGenerateColumns="false"
                runat="server">
                <Columns>
                    <asp:BoundField DataField="vehicleName" HeaderText="Vehicle Name" />
                    <asp:BoundField DataField="vehicleModel" HeaderText="Vehicle Model" />
                    <asp:BoundField DataField="vehicleYear" HeaderText="Vehicle Year" />
                    <asp:BoundField DataField="manufacturer" HeaderText="Manufacturer" />
                    <asp:BoundField DataField="baseCost" DataFormatString="{0:c}" HeaderText="Base Cost" />
                </Columns>
            </asp:GridView>

            <asp:GridView ID="optionsgridView"
                Caption="<span style='font-weight:bold; font-size:16pt'>Vehicle Options</span>"
                CssClass="mGrid"
                AlternatingRowStyle-CssClass="alt"
                AutoGenerateColumns="false"
                runat="server">
                <Columns>
                    <asp:BoundField DataField="optionName" HeaderText="Option Name" />
                    <asp:BoundField DataField="optionCost" DataFormatString="{0:c}" HeaderText="Option Cost" />
                </Columns>
            </asp:GridView>
            <asp:Panel runat="server" ID="error" Visible="false">
                <div class="alert alert-danger">
                    <strong>Error!</strong> Unable to confirm Purchase.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="Panel1" Visible="false">
                <div class="alert alert-danger">
                    <strong>Error!</strong> Unable to confirm purchase.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="success" Visible="false">
                <div class="alert alert-success">
                    <strong>Success!</strong> Purchase confirmed. View your Invoice.
                </div>
            </asp:Panel>
            <table style="float:right">
                <tr>
                    <td><asp:Button runat="server" ID="btnConfirm" Text="Confirm Purchase" OnClick="btnConfirm_Click" class="btn btn-primary pull-right" /></td>
                    <td>
                        <asp:Panel runat="server" ID="pnlViewInvoice" Visible="false">
                <asp:Button runat="server" ID="btnViewInvoice" Text="View Invoice" OnClick="btnViewInvoice_Click" class="btn btn-primary pull-right" />&nbsp;
            </asp:Panel>
                    </td>
                </tr>
            </table>
           
            
        </div>
    </div>
</asp:Content>
