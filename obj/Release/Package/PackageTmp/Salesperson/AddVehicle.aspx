<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="HolidayTravelVehicles.Salesperson.AddVehicle" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="Server">
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
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-area">


                <h3 style="margin-bottom: 25px; text-align: center;">Add Vehicle</h3>
                <div class="form-group">
                    <asp:TextBox runat="server" class="form-control" id="vehicleName" placeholder="Vehicle Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" class="form-control" id="vehicleModel" placeholder="Vehicle Model" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" class="form-control" id="vehicleYear" placeholder="Vehicle Year" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" class="form-control" id="manufacturer"  placeholder="Manufacturer" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" class="form-control" id="baseCost" placeholder="Base Cost" />
                </div>                

               
                <asp:Button runat="server" ID="btnAddVehicle" Text="Add Vehicle" OnClick="btnAddVehicle_Click" class="btn btn-primary pull-right" />
                   

            </div>
            <asp:Panel runat="server" ID="successDelete" Visible="false">
                <div class="alert alert-success">
                    <strong>Success!</strong> Vehicle was deleted.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="success" Visible="false">
                <div class="alert alert-success">
                    <strong>Success!</strong> Vehicle was added.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="error" Visible="false">
                <div class="alert alert-danger">
                    <strong>Error!</strong> Vehicle not added.
                </div>
            </asp:Panel>
        </div>
        <div>
            <asp:GridView ID="vehiclegridView"
                Caption="<span style='font-weight:bold; font-size:14pt'>Vehicle List</span>"
                CssClass="mGrid"
                OnRowCommand="vehiclegridView_OnRowCommand"
                AlternatingRowStyle-CssClass="alt"
                AutoGenerateColumns="false"                
                runat="server">
                <Columns>
                    <asp:BoundField DataField="vehicleName" HeaderText="Vehicle Name" />
                    <asp:BoundField DataField="vehicleModel" HeaderText="Vehicle Model" />
                    <asp:BoundField DataField="vehicleYear" HeaderText="Vehicle Year" />
                    <asp:BoundField DataField="manufacturer" HeaderText="Manufacturer" />
                    <asp:BoundField DataField="baseCost" DataFormatString="{0:C}" HeaderText="Base Cost" />
                    
                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div style="padding:1px">
                                <asp:Button ID="btnDelete" runat="server" CommandName="deleteVehicle" Text="Delete"
                                    CommandArgument='<%# Eval("vehicleID") %>' class="btn btn-primary pull-right" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
