<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindVehicle.aspx.cs" Inherits="HolidayTravelVehicles.Customer.FindVehicle" %>

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
        
        <div class="col-md-4 col-md-offset-4">
            <h4 style="color:white; font-weight: bold">Note: Click search with no data entered to display all results...</h4>
            <div class="form-area">            
                
                <h3 style="margin-bottom: 25px; text-align: center;">Find a Vehicle</h3>

                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="carname" placeholder="Name" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="model" placeholder="Model" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="year" placeholder="Year" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="manufacturer" placeholder="Manufacturer" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" type="text" class="form-control" id="basecost" placeholder="Base Cost" />
                </div>
                <div>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn btn-primary pull-right"/>
                </div>
            </div>
        </div>
        <div>
            <asp:GridView ID="gridView" 
                Caption="<span style='font-weight:bold; font-size:14pt'>Search Results</span>"
                CssClass="mGrid" 
                OnRowCommand="gridView_OnRowCommand"
                AlternatingRowStyle-CssClass="alt" 
                AutoGenerateColumns="false"
                runat="server">
                <Columns>
                    <asp:BoundField DataField="vehicleName" HeaderText="Vehicle Name" />
                    <asp:BoundField DataField="vehicleModel" HeaderText="Vehicle Model" />
                    <asp:BoundField DataField="vehicleYear" HeaderText="Vehicle Year" />
                    <asp:BoundField DataField="manufacturer" HeaderText="Manufacturer" />
                    <asp:BoundField DataField="baseCost" DataFormatString="{0:c}"  HeaderText="Base Cost" />
                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate >
                            <div style="padding:1px">
                             <asp:Button  ID="btnPurchase" runat="server"   CausesValidation="false" CommandName="purchaseVehicle"  Text="Buy it!" 
                                 CommandArgument='<%# Eval("vehicleID") %>' class="btn btn-primary pull-right"/>
                            </div>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
