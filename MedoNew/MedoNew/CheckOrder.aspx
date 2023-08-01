<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CheckOrder.aspx.cs" Inherits="MedoNew.CheckOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cardser{  
            width:50% !important;
            height:250px !important;
        }
        #MainDiv{
            border:none !important  ;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-5" id="FormDiv">
        <a href="Home.aspx" class="mb-5 text-dark mx-2">Back<<</a>
        <div class="card cardser">
            <div class="card-header badge-info" style="text-align: center; background-color:#033b4d; color: #ffffff;">
                <h4 class="pt-1">Check Order Status</h4>
            </div>
            <div class="card-body">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="form-group">
                            <label>Enter your order number</label>
                            <asp:TextBox ID="txtorder_number" runat="server" class="form-control"></asp:TextBox>
                            <label runat="server" id="msg" class="text-danger"></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter order id" Display="Dynamic" ControlToValidate="txtorder_number" CssClass="text-danger" ValidationGroup="v1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtorder_number"
                                ErrorMessage="Please enter valid order number"
                                ValidationExpression="^\d+$" ValidationGroup="v1" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:Button ID="btnCheck" runat="server" class="btn btn-dark mt-4" OnClick="btnCheck_Click" Text="Check Order Status" ValidationGroup="v1" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblstatus" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="container d-flex flex-wrap justify-content-between g-4 mb-5 form-control mt-4" id="MainDiv" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="card d-flex flex-column" id="ProdCard">
                    <p></p>
                    <div class="card-body d-flex flex-column text-center mb-5 justify-content-center align-items-center">
                        <div class="ProdDet mt-4">
                            <h5><span>OrderId :</span><%#Eval("OrderId")%></h5>
                            <h5><span>Amount Paid:</span><%#Eval("OrderAmount") %></h5>
                            <div class="prodPrice pt-1">
                                <h5><span>Order Status:</span><%#Eval("OrderStatusUpdate") %></h5>
                            </div>
                            <div class="mt-4 mb-b">
                                <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("OrderId")%>' CommandName="cancel" runat="server" CssClass="AddBtn text-uppercase" ToolTip="Add to Cart">Cancel Order</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
