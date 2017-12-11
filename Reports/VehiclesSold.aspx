<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehiclesSold.aspx.cs" Inherits="HolidayTravelVehicles.Reports.VehiclesSold" %>
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
            border-collapse:collapse; 
        }
        .mGrid td { 
            padding: 2px; 
            border: solid 1px #c1c1c1; 
            color: #717171; 
        }
        .mGrid th { 
            padding: 4px 2px; 
            text-align:center;
            color: #fff; 
            background: #424242 url(grd_head.png) repeat-x top; 
            border-left: solid 1px #525252; 
            font-size: 12pt; 
        }
        .mGrid .alt { background-color: lightgrey; }
        
        .mGrid .pgr td { 
            border-width: 0; 
            padding: 0 6px; 
            border-left: solid 1px #666; 
            font-weight: bold; 
            color: #fff; 
            line-height: 12px; 
         }   
        .mGrid .pgr a { color: #666; text-decoration: none; }
        .mGrid .pgr a:hover { color: #000; text-decoration: none; }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">        
        <div>
            <asp:GridView ID="gridView" 
                Caption="<span style='font-weight:bold; font-size:14pt'>Vehicles Sold</span>"
                CssClass="mGrid"                 
                AlternatingRowStyle-CssClass="alt" 
                AutoGenerateColumns="false"
                runat="server">
                <Columns>
                    <asp:BoundField DataField="vehicleName" HeaderText="Vehicle Name" />
                    <asp:BoundField DataField="vehicleModel" HeaderText="Vehicle Model" />
                    <asp:BoundField DataField="vehicleYear" HeaderText="Vehicle Year" />
                    <asp:BoundField DataField="manufacturer" HeaderText="Manufacturer" />
                    <asp:BoundField DataField="baseCost" DataFormatString="{0:c}"  HeaderText="Base Cost" />
                    <asp:BoundField DataField="customerName" HeaderText="Customer Name" />                    
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
