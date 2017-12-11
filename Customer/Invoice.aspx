<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="HolidayTravelVehicles.Customer.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .invoice-title h2, .invoice-title h3 {
            display: inline-block;
            margin: auto;
        }

        .table > tbody > tr > .no-line {
            border-top: none;
        }

        .table > thead > tr > .no-line {
            border-bottom: none;
        }

        .table > tbody > tr > .thick-line {
            border-top: 2px solid;
        }

        .form-area button {
            margin: 8px;
            margin-right: 0px;
        }
        body {
            background-image: url('')
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-area">
            <div class="row" style="text-align: left">
                <div class="col-xs-12">

                    <div class="invoice-title">
                        <h2>Invoice</h2>
                        <h3 class="pull-right">Order #
                            <asp:Label ID="lblVehicleID" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <hr>
                    <div class="row" style="text-align: left">
                        <div class="col-xs-6">
                            <address>
                                <strong>Billed To:</strong><br>
                                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label><br>
                                <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label><br>
                                <asp:Label ID="lblCity" runat="server" Text="Label"></asp:Label>,
                                <asp:Label ID="lblState" runat="server" Text="Label"></asp:Label>
                                <asp:Label ID="lblZip" runat="server" Text="Label"></asp:Label>
                            </address>
                        </div>
                        <div class="col-xs-6 text-right">
                            <address>
                                <strong>Shipped To:</strong><br>
                                <asp:Label ID="lblName2" runat="server" Text="Label"></asp:Label><br>
                                <asp:Label ID="lblAddress2" runat="server" Text="Label"></asp:Label><br>
                                <asp:Label ID="lblCity2" runat="server" Text="Label"></asp:Label>,
                                <asp:Label ID="lblState2" runat="server" Text="Label"></asp:Label>
                                <asp:Label ID="lblZip2" runat="server" Text="Label"></asp:Label>
                            </address>
                        </div>
                    </div>
                    <div class="row" style="text-align: left">
                        <div class="col-xs-6">
                            <address>
                                <strong>Payment Method:</strong><br>
                                Visa ending **** 4242<br>
                                <asp:Label ID="lblEmailName" runat="server" Text="Label"></asp:Label>@email.com
                            </address>
                        </div>
                        <div class="col-xs-6 text-right">
                            <address>
                                <strong>Order Date:</strong><br>
                                <asp:Label ID="lblOrderDate" runat="server" Text="Label"></asp:Label><br>
                                <br>
                            </address>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Order summary</strong></h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <td><strong>Name/Model</strong></td>
                                            <td class="text-center"><strong>Base Cost</strong></td>
                                            <td class="text-center"><strong>Quantity</strong></td>
                                            <td class="text-right"><strong>Totals</strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblVehicleName" runat="server" Text="Label"></asp:Label>
                                                <asp:Label ID="lblVehicleModel" runat="server" Text="Label"></asp:Label></td>
                                            <td class="text-center">$<asp:Label ID="lblBaseCost" runat="server" Text="Label"></asp:Label></td>
                                            <td class="text-center">1</td>
                                            <td class="text-right">$<asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="thick-line"></td>
                                            <td class="thick-line"></td>
                                            <td class="thick-line text-center"><strong>Sales Tax</strong></td>
                                            <td class="thick-line text-right">$<asp:Label ID="lblSalesTax" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>Sub Total</strong></td>
                                            <td class="no-line text-right">$<asp:Label ID="lblSubTotal" runat="server" Text="Label"></asp:Label></td>
                                        </tr>

                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>Total</strong></td>
                                            <td class="no-line text-right">$<asp:Label ID="lblFinalTotal" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table style="float: right">
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btnPrint" Text="Print" OnClick="btnPrint_Click" class="btn btn-primary pull-right" />
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btnExit" Text="Exit" OnClick="btnExit_Click" class="btn btn-primary pull-right" />            
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
