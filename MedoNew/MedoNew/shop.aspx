<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="MedoNew.shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="CSS/Product.css" rel="stylesheet" />
        <style>
            .cartBtn{
                  background-color: #033b4d;
                  color:#ffffff;
                  padding:7px 22px;
                  border-radius:5px;
            }
            .cartBtn:hover{
                color:#fff;
            }
            #ProdCard{
           
                min-height:400px !important;
            }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex flex-wrap justify-content-between g-4 mb-5 form-control" id="MainDiv">
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <div class="card d-flex flex-column" id="ProdCard">
                        <p></p>
                        <div class="card-body d-flex flex-column text-center mb-5">
                            <div>
                                <img class="img-fluid" src="Admin/product/<%#Eval("Image") %>" alt="" height="200" width="200">
                            </div>
                            <div class="ProdDet pt-2">
                            
                                <h6><%#Eval("Name")%></h6>
                                <div class="prodPrice pt-1">
                                    <span class="price">Best Price*:</span> <span style="color:red"> Rs. </span><span class="priceNum"><%#Eval("Price")%></span>
                                </div>
                                <div class="mt-4 mb-b">

                                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("ProductId")%>' CommandName="add_cart" runat="server" CssClass="AddBtn text-uppercase" ToolTip="Add to Cart">Add to cart</asp:LinkButton>

                                </div>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
</asp:Content>
