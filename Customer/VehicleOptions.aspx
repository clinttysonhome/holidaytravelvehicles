<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleOptions.aspx.cs" Inherits="HolidayTravelVehicles.Customer.VehicleOptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .funkyradio div {
            clear: both;
            /*margin: 0 50px;*/
            overflow: hidden;
        }

        .funkyradio label {
            /*min-width: 400px;*/
            width: 100%;
            border-radius: 3px;
            border: 1px solid #D1D3D4;
            font-weight: normal;
        }

        .funkyradio input[type="radio"]:empty, .funkyradio input[type="checkbox"]:empty {
            display: none;
        }

            .funkyradio input[type="radio"]:empty ~ label, .funkyradio input[type="checkbox"]:empty ~ label {
                position: relative;
                line-height: 2.5em;
                text-indent: 3.25em;
                margin-top: 2em;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

                .funkyradio input[type="radio"]:empty ~ label:before, .funkyradio input[type="checkbox"]:empty ~ label:before {
                    position: absolute;
                    display: block;
                    top: 0;
                    bottom: 0;
                    left: 0;
                    content: '';
                    width: 2.5em;
                    background: #D1D3D4;
                    border-radius: 3px 0 0 3px;
                }

        .funkyradio input[type="radio"]:hover:not(:checked) ~ label:before, .funkyradio input[type="checkbox"]:hover:not(:checked) ~ label:before {
            content: '\2714';
            text-indent: .9em;
            color: #C2C2C2;
        }

        .funkyradio input[type="radio"]:hover:not(:checked) ~ label, .funkyradio input[type="checkbox"]:hover:not(:checked) ~ label {
            color: #888;
        }

        .funkyradio input[type="radio"]:checked ~ label:before, .funkyradio input[type="checkbox"]:checked ~ label:before {
            content: '\2714';
            text-indent: .9em;
            color: #333;
            background-color: #ccc;
        }

        .funkyradio input[type="radio"]:checked ~ label, .funkyradio input[type="checkbox"]:checked ~ label {
            color: #777;
        }

        .funkyradio input[type="radio"]:focus ~ label:before, .funkyradio input[type="checkbox"]:focus ~ label:before {
            box-shadow: 0 0 0 3px #999;
        }

        .funkyradio-default input[type="radio"]:checked ~ label:before, .funkyradio-default input[type="checkbox"]:checked ~ label:before {
            color: #333;
            background-color: #ccc;
        }

        .funkyradio-primary input[type="radio"]:checked ~ label:before, .funkyradio-primary input[type="checkbox"]:checked ~ label:before {
            color: #fff;
            background-color: #337ab7;
        }

        .funkyradio-success input[type="radio"]:checked ~ label:before, .funkyradio-success input[type="checkbox"]:checked ~ label:before {
            color: #fff;
            background-color: #5cb85c;
        }

        .funkyradio-danger input[type="radio"]:checked ~ label:before, .funkyradio-danger input[type="checkbox"]:checked ~ label:before {
            color: #fff;
            background-color: #d9534f;
        }

        .funkyradio-warning input[type="radio"]:checked ~ label:before, .funkyradio-warning input[type="checkbox"]:checked ~ label:before {
            color: #fff;
            background-color: #f0ad4e;
        }

        .funkyradio-info input[type="radio"]:checked ~ label:before, .funkyradio-info input[type="checkbox"]:checked ~ label:before {
            color: #fff;
            background-color: #5bc0de;
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
        <div class="col-md-4 col-md-offset-4">
            <table>
                <tr>
                    <td style="text-align: right"><span style="font-weight: bold">Customer:&nbsp;&nbsp; </span></td>
                    <td style="text-align: left"><span style="font-weight: bold">
                        <asp:Label ID="lblCustomer" runat="server" Text="Label"></asp:Label></span></td>
                </tr>
                <tr>
                    <td style="text-align: right"><span style="font-weight: bold">Vehicle:&nbsp;&nbsp; </span></td>
                    <td style="text-align: left"><span style="font-weight: bold">
                        <asp:Label ID="lblVehicle" runat="server" Text="Label"></asp:Label></span></td>
                </tr>
            </table>

            <div class="form-area">
                <h3 style="margin-bottom: 25px; text-align: center;">Vehicle Options</h3>
                <div class="funkyradio">
                    <asp:CheckBoxList Width="270px" ID="cbxOptions"
                        CssClass="funkyradio-primary"
                        DataTextField="optionName"
                        DataValueField="optionID"
                        DataSourceID="dsOptions"
                        runat="server">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="dsOptions"
                        ConnectionString="<%$ ConnectionStrings:DataConnectionString%>"
                        runat="server"
                        SelectCommand="SELECT optionID, optionName From Options Order By optionID ASC "></asp:SqlDataSource>
                </div>
                <br />
                <table style="float:right">
                    <tr>
                        <td style="padding-right:3px">
                            <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" class="btn btn-primary pull-right" />
                        </td>
                        <td>
                           <asp:Button runat="server" ID="btnPurchase" Text="Purchase Vehicle" OnClick="btnPurchase_Click" class="btn btn-primary pull-right" />
                        </td>
                    </tr>
                </table>
                
                
            </div>
            <asp:Panel runat="server" ID="successDelete" Visible="false">
                <div class="alert alert-success">
                    <strong>Success!</strong> Option was deleted.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="error" Visible="false">
                <div class="alert alert-danger">
                    <strong>Error!</strong> Save failed.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="errorDup" Visible="false">
                <div class="alert alert-danger">
                    <strong>Error!</strong> Cannot insert duplicate.
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="success" Visible="false">
                <div class="alert alert-success">
                    <strong>Success!</strong> Options were saved. Please view summary.
                </div>
            </asp:Panel>
        </div>
        <div>
            <asp:GridView ID="custgridView"
                Caption="<span style='font-weight:bold; font-size:14pt'>Customer</span>"
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
            <br />
            <asp:GridView ID="vehiclegridView"
                Caption="<span style='font-weight:bold; font-size:14pt'>Vehicle</span>"
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
            <br />
            <asp:GridView ID="optionsgridView"
                Caption="<span style='font-weight:bold; font-size:14pt'>Vehicle Options</span>"
                CssClass="mGrid"               
                AlternatingRowStyle-CssClass="alt"
                AutoGenerateColumns="false"
                runat="server">
                <Columns>
                    <asp:BoundField DataField="optionName" HeaderText="Option Name" />
                    <asp:BoundField DataField="optionCost" DataFormatString="{0:c}" HeaderText="Option Cost" />
                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div>
                                <asp:Button ID="btnDeleteOption" runat="server" CommandName="deleteOption" Text="Delete"
                                    CommandArgument='<%# Eval("optionsmappingID") %>' class="btn btn-primary pull-right" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </div>

</asp:Content>
