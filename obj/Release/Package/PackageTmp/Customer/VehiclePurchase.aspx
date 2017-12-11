<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehiclePurchase.aspx.cs" Inherits="HolidayTravelVehicles.Customer.VehiclePurchase" %>

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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="col-md-4 col-md-offset-4">
                    
                    <div class="form-area">

                        <h3 style="margin-bottom: 25px; text-align: center;">Vehicle Purchase</h3>

                        <div class="form-group">
                            <asp:TextBox runat="server" Enabled="false" type="text" class="form-control" ID="vehicleName" placeholder="Vehicle Name" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" Enabled="false" type="text" class="form-control" ID="vehicleModel" placeholder="Vehicle Model" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" Enabled="false" type="text" class="form-control" ID="vehicleYear" placeholder="Vehicle Year" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" Enabled="false" type="text" class="form-control" ID="manufacturer" placeholder="Manufacturer" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox runat="server" Enabled="false" type="text" class="form-control" ID="basecost" placeholder="Base Cost" />
                        </div>
                        <div style="font-weight: bold">
                            Choose the Customer purchasing a vehicle:
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlCustomers"
                                AppendDataBoundItems="true"
                                DataTextField="CustomerName"
                                DataValueField="customerID"
                                DataSourceID="dsCustomers"
                                CssClass="form-control"
                                runat="server">
                                <asp:ListItem>--Choose a Customer--</asp:ListItem>

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsCustomers"
                                ConnectionString="<%$ ConnectionStrings:DataConnectionString%>"
                                runat="server"
                                SelectCommand="SELECT customerID, firstName + ' ' + lastName As CustomerName From Customer Order By lastName ASC "></asp:SqlDataSource>
                        </div>
                        <table style="float: right">
                            <tr>
                                <td style="padding-right: 3px">
                                    <asp:Button runat="server" ID="btnOptions" Text="Options" OnClick="btnOptions_Click" class="btn btn-primary pull-right" />
                                </td>
                                <td>
                                    <asp:Button runat="server" ID="btnPurchase" Text="Purchase" OnClick="btnPurchase_Click" class="btn btn-primary pull-right" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel runat="server" ID="error" Visible="false">
                        <div class="alert alert-danger">
                            <strong>Error!</strong> You must select a customer first.
                        </div>
                    </asp:Panel>
                    
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
