<%@ Page Title="" Language="C#" MasterPageFile="~/Chemist/Chemist.Master" AutoEventWireup="true" CodeBehind="OrderRecived.aspx.cs" Inherits="MedoNew.Chemist.OrderRecived" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #FormDiv {
            width: 1180px;
            margin-left: 300px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5" id="FormDiv">
        <div class="card">
            <div class="card-header badge-info" style="text-align: center; background-color: rgb(51, 255, 214); color: #000000;">
                <h4 class="pt-1">Order Recived</h4>
            </div>
            <div class="card-body text-center">
                <div class="col-lg-12">
                    <div class="row">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <th>Sr.No</th>
                                    <th>Order Id</th>
                                    <th>Product Id</th>
                                    <th>Product Qunatity</th>
                                    <th>Total Amount</th>
                                    <th>Order Date</th>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Row") %></td>
                                    <td><%# Eval("order_id") %></td>
                                    <td><%# Eval("product_id") %></td>
                                    <td><%# Eval("qty") %></td>
                                    <td><%# Eval("price") %></td>
                                    <td><%# Eval("OrderDate") %></td>
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
