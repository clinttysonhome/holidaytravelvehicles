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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="form-area">
    <div class="row" style="text-align:left">
        <div class="col-xs-12">
            
    		<div class="invoice-title">
    			<h2>Invoice</h2><h3 class="pull-right">Order # 12345</h3>
    		</div>
    		<hr>
    		<div class="row" style="text-align:left">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed To:</strong><br>
    					John Smith<br>
    					1234 Main<br>
    					Apt. 4B<br>
    					Springfield, ST 54321
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>Shipped To:</strong><br>
    					Jane Smith<br>
    					1234 Main<br>
    					Apt. 4B<br>
    					Springfield, ST 54321
    				</address>
    			</div>
    		</div>
    		<div class="row" style="text-align:left">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment Method:</strong><br>
    					Visa ending **** 4242<br>
    					jsmith@email.com
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					March 7, 2014<br><br>
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
    								<td>2017 Land Shark</td>
    								<td class="text-center">$36,999.99</td>
    								<td class="text-center">1</td>
    								<td class="text-right">$36,999.99</td>
    							</tr>
                                <tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Sales Tax</strong></td>
    								<td class="thick-line text-right">$2,589.99</td>
    							</tr>
                                <tr>    								
                                    <td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Sub Total</strong></td>
    								<td class="no-line text-right">$36,999.99</td>
    							</tr>
    							
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right">$39,589.99</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
        <button type="button" id="exit" name="exit" class="btn btn-primary pull-right">Exit</button>
        <button type="submit" id="submit" name="submit" class="btn btn-primary pull-right">Print</button>
    </div>
</div>
</asp:Content>
