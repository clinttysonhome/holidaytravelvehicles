﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="HolidayTravelVehicles.Salesperson.AddVehicle" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-area">


                <h3 style="margin-bottom: 25px; text-align: center;">Add Vehicle</h3>
                <div class="form-group">
                    <input type="text" class="form-control" id="VehicleSN" name="VehicleSN" placeholder="Vehicle Serial Number" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="email" name="email" placeholder="Name" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Model" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Year" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="manufacturer" name="manufacturer" placeholder="Manufacturer" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="basecost" name="basecost" placeholder="Base Cost" required>
                </div>

                <button type="button" id="exit" name="exit" class="btn btn-primary pull-right">Exit</button>
                <button type="button" id="submit" name="submit" class="btn btn-primary pull-right">Add Vehicle</button>

            </div>
        </div>
    </div>

</asp:Content>