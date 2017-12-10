<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="HolidayTravelVehicles.Salesperson.AddCustomer" %>

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
                font-size: 0.9em;
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
        <div class="col-md-4 col-md-offset-4">
            <div class="form-area">
                <h3 style="margin-bottom: 25px; text-align: center;">Add Customer</h3>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="firstName" placeholder="First Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="lastName" placeholder="Last Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="address" name="address" placeholder="Address" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="city" name="city" placeholder="City" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="state" name="state" placeholder="State" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="zip" name="zip" placeholder="Zipcode" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="phone" name="phone" placeholder="Phone" />
                </div>              
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="dob" name="dob" placeholder="Date Of Birth (mm/dd/yyyy)" />
                </div>
                
                <asp:Button runat="server" ID="btnAdd" Text="Add Customer" OnClick="btnAdd_Click" class="btn btn-primary pull-right" />

            </div>
            <asp:Panel runat="server" ID="successDelete" Visible="false">
                <div class="alert alert-success">
                    <strong>Success!</strong> Customer was deleted.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="success" Visible="false">
                <div class="alert alert-success">
                    <strong>Success!</strong> Customer was added.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="error" Visible="false">
                <div class="alert alert-danger">
                    <strong>Error!</strong> Customer not added.
                </div>
            </asp:Panel>
        </div>
        <div>
            <asp:GridView ID="custgridView"
                Caption="Customer List"
                CssClass="mGrid"
                OnRowCommand="custgridView_OnRowCommand"
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
                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div>
                                <asp:Button ID="btnDelete" runat="server" CommandName="deleteCustomer" Text="Delete"
                                    CommandArgument='<%# Eval("customerID") %>' class="btn btn-primary pull-right" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
