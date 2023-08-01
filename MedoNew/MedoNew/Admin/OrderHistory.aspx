<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="MedoNew.Admin.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
         #FormDiv {
            width:1180px;
            margin-left:300px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5" id="FormDiv">
        <div class="card">
            <div class="card-header badge-info" style="text-align: center; background-color:rgb(51, 255, 214)"; color: #ffffff;">
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
                                    <th>Order_date</th>
                                    <th>Total_amount</th>
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
