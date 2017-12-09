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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-area">
                <h3 style="margin-bottom: 25px; text-align: center;">Add Customer</h3>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="firstName" placeholder="First Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="lastName" placeholder="Last Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="address" name="address" placeholder="Address" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="city" name="city" placeholder="City" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="state" name="state" placeholder="State" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="zip" name="zip" placeholder="Zipcode" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="dob" name="dob" placeholder="Date Of Birth (mm/dd/yyyy)" />
                </div>                
                <asp:Button runat="server" id="btnAdd" Text="Add Customer" OnClick="btnAdd_Click" class="btn btn-primary pull-right"/>

            </div>
        </div>
    </div>
</asp:Content>
