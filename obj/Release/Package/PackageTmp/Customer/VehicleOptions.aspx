<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleOptions.aspx.cs" Inherits="HolidayTravelVehicles.Customer.VehicleOptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        @import('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/css/bootstrap.min.css') .funkyradio div

        {
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
                <h3 style="margin-bottom: 25px; text-align: center;">Vehicle Options</h3>
                <div class="funkyradio">
                    <div class="funkyradio-primary">
                        <input type="checkbox" name="checkbox" id="checkbox1" checked />
                        <label for="checkbox1">Sunroof</label>
                    </div>
                    <div class="funkyradio-primary">
                        <input type="checkbox" name="checkbox" id="checkbox2" checked />
                        <label for="checkbox2">Leather</label>
                    </div>
                    <div class="funkyradio-primary">
                        <input type="checkbox" name="checkbox" id="checkbox3" checked />
                        <label for="checkbox3">Backup Camera</label>
                    </div>
                    <div class="funkyradio-primary">
                        <input type="checkbox" name="checkbox" id="checkbox4" checked />
                        <label for="checkbox4">Seat Warmer</label>
                    </div>
                    <div class="funkyradio-primary">
                        <input type="checkbox" name="checkbox" id="checkbox5" checked />
                        <label for="checkbox5">Eco Boost</label>
                    </div>
                    <div class="funkyradio-primary">
                        <input type="checkbox" name="checkbox" id="checkbox6" checked />
                        <label for="checkbox6">Chrome Wheels</label>
                    </div>
                </div>
                <button type="button" id="exit" name="exit" class="btn btn-primary pull-right">Exit</button>
                <button type="submit" id="submit" name="submit" class="btn btn-primary pull-right">Save</button>
            </div>
        </div>
    </div>

</asp:Content>
