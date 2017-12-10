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
        
         .form-area button{
          margin: 8px;
          margin-right:0px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-area">

                <h3 style="margin-bottom: 25px; text-align: center;">Vehicle Purchase</h3>
              
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="vehicleName"  placeholder="Vehicle Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="vehicleModel"  placeholder="Vehicle Model" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="vehicleYear" placeholder="Vehicle Year" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="manufacturer"  placeholder="Manufacturer" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="basecost" placeholder="Base Cost" />
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlCustomers" CssClass="form-control" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                    </asp:DropDownList>
                </div>
                
              <table style="float:right">
                  <tr>
                      <td style="padding-right:3px">
                           <asp:Button runat="server" id="Button2" Text="Options" class="btn btn-primary pull-right"/>
                      </td>
                      <td>
                          <asp:Button runat="server" id="Button1" Text="Purchase" class="btn btn-primary pull-right"/>
                      </td>
                  </tr>
              </table>
                
            </div>
        </div>
    </div>
</asp:Content>
