<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MedoNew.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #OrderCard {
            margin-left: 290px;
            width: 80%;
        }

            #OrderCard .card-header {
                background-color:rgb(51, 255, 214) !important; 
                color:#000000;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4 mb-4" id="OrderCard">
        <div class="card">
            <div class="card-header" style="text-align: center;background-color:rgb(51, 255, 214);">
                <h4 class="pt-1">Order History</h4>
            </div>
            <div class="card-body">
                <div class="col-lg-12">
                    <div class="row">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <th>Sr.No</th>
                                    <th>Sales_order_ID</th>
                                    <th>Order_Date</th>
                                    <th>Total_Amount</th>
                                    <th>Status</th>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Row") %></td>
                                    <td><%# Eval("Sales_order_ID") %></td>
                                    <td><%# Eval("Order_date") %></td>
                                    <td><%# Eval("Total_amount") %></td>
                                    <td><%# Eval("Status") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
