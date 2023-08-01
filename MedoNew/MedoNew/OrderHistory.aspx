<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="MedoNew.UserAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #FormDiv{
           
        }
        .orderTab{
          
            min-width:1000px !important;
            padding:10px !important;
            min-height:400px !important;
            border:none;
        }
        .chk{
            margin-top:30px;
            background-color:#24aeb1;
            text-decoration:none;
            color:#fff !important;
            padding:8px 30px !important;
            border-radius:7px;
        }
    </style>
   <div class="container mt-5" id="FormDiv">
        <a href="Shop.aspx" class="text-dark mx-3">Back<<</a>
        <div class="card mt-3 orderTab ">
            <div class="card-header badge-info" style="text-align: center; background-color:#033b4d; color:#fff;">
                <h4 class="pt-1">Youe Order History</h4>
            </div>
            <div class="card-body">
                <div class="col-lg-12">
                    <div class="row">   
                        <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <th>Sr.No</th>
                                    <th>Order Id</th>
                                    <th>Order Date</th>
                                    <th>Discount</th>
                                    <th>Final Amount</th>
                                    <th>Status</th>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Row") %></td>
                                    <td><%# Eval("OrderId") %></td>
                                    <td><%# Eval("Orderdate") %></td>
                                    <td><%# Eval("OrderDiscount") %></td>
                                    <td><%# Eval("OrderFinalAmount") %></td>
                                    <td><%# Eval("OrderStatusUpdate") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="mt-3">
                        <a href="CheckOrder.aspx" class="text-dark chk">Check Order Status</a>
                        <a href="UplodaPrec.aspx" class="text-dark chk">Upload prescription</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
