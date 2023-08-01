<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MedoNew.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            min-height: 90vh;
        }

        #ProdCard {
            height: 225px !important;
            width: 100% !important;
        }

            #ProdCard:hover {
                box-shadow: 0 0 0 0 !important;
            }

        .ActionBtn {
            text-decoration: none;
            border: 1px solid rgb(51, 255, 214);
            color: #fff;
            background-color: #033b4d;
            border-radius: 5px;
            padding: 7px 15px;
        }

            .ActionBtn:hover {
                text-decoration: none;
                border: 1px solid rgb(51, 255, 214);
                color: #fff;
                background-color: #033b4d;
                border-radius: 5px;
                padding: 7px 15px;
            }

        #ProdDiv p {
            font-weight: 500;
        }

        #ProdDiv .maxPrice {
            font-size: 15px;
        }

        #CopDiv {
            width: 300px !important;
        }

        .BillDiv1 {
            width: 400px !important;
            height: 340px !important;
        }

        .apllcop {
            border: 1px solid rgb(51, 255, 214);
            color: #fff;
            background-color: #033b4d;
            border-radius: 5px;
        }

        .apllcop1 {
            border: 1px solid rgb(51, 255, 214);
            color: #fff;
            background-color: #033b4d;
            border-radius: 5px;
            padding: 5px 40px;
        }

        .apllcop:hover {
            border: 1px solid rgb(51, 255, 214);
            color: #fff;
            background-color: #033b4d;
            border-radius: 5px;
        }

        .apllcop1:hover {
            border: 1px solid rgb(51, 255, 214);
            color: #fff;
            background-color: #033b4d;
            border-radius: 5px;
            padding: 5px 40px;
        }

        .UserSearcBx1 {
            width: 400px !important;
            height: 200px !important;
            display: none;
        }

        .CopDiv1 {
            height: 140px !important;
            width: 400px !important;
        }

        .ViewDivNew {
            height: 430px !important;
            width: 430px !important;
        }

            .ViewDivNew .cart-btn {
                background-color: #24aeb1;
                color: #ffffff;
            }

                .ViewDivNew .cart-btn:hover {
                    background-color: #24aeb1;
                    color: #ffffff;
                }

        .Proc {
            padding:10px 40px;
            color: #fff;
            background-color: #033b4d;
            border-radius: 5px;
            border:none !important;

        }
        #btnProc{
            
            margin-bottom:100px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div id="emptycart" runat="server">
            <div class="container-fluid mt-100 d-flex justify-content-center align-items-center">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card ViewDivNew" id="">
                            <div class="card-body cart">
                                <div class="col-sm-12 empty-cart-cls text-center">
                                    <img src="https://img.icons8.com/external-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto/64/000000/external-remove-cart-retail-store-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                    <h4>Your Cart is Empty</h4>
                                    <h4>Add something to make me happy :)</h4>
                                    <a href="generic.aspx" class="btn cart-btn mt-4 text-capitalize" data-abc="true">continue shopping</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <asp:DataList ID="DataList1" runat="server" CellPadding="1" CellSpacing="1"
                    DataKeyField="ProdID"
                    OnItemCommand="DataList1_ItemCommand">
                    <ItemStyle BackColor="White" ForeColor="Black" />
                    <ItemTemplate>
                        <div class="card mb-5 " id="ProdCard">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <img class="img-fluid" src="Admin/product/<%#Eval("ProdImg") %>" alt="" height="170" width="170">
                                    </div>
                                    <div class="col-lg-4 ProdDetails mt-3">
                                        <p class="Prodname"><%#Eval("ProdName")%></p>
                                        <span class="maxPrice">MRP:</span><span class="ProdPrice">₹<%#Eval("ProdPrice")%></span></div>
                                    <div class="Action col-lg-4 mt-4 text-center">
                                        <div>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ProdId")%>' CommandName="remove_cart" CssClass="text-uppercase ActionBtn">Remove from cart</asp:LinkButton>
                                        </div>
                                        <div class="mt-5 text-center">
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("ProdId")%>' CommandName="Add" CssClass="mx-3 IncBtn"><img src="Images/BackImg/icons8-add-2.png" height="35" width="35"/></asp:LinkButton>
                                            <span id="Qunatitty" runat="server"><%#Eval("ProdQuan")%></span>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("ProdId")%>' CommandName="Sub" CssClass="mx-3  IncBtn"><img src="Images/BackImg/icons8-minus-64.png"  height="35" width="35" /></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="col-lg-4" runat="server">
                <div class="card CopDiv1" id="CopDiv" runat="server">
                    <div class="card-body">
                        <h5 class="text-capitalize">apply coupon code:</h5>
                        <p class="border"></p>
                        <div class="d-block">
                            <asp:Button runat="server" Text="apply coupons" CssClass="text-capitalize w-100 text-start px-5 py-2 apllcop" ID="appBtn" OnClick="appBtn_Click" />
                        </div>
                    </div>
                </div>
                <div class="card UserSearcBx1" id="UserSearcBx" runat="server">
                    <div class="card-body">
                        <div>
                            <asp:Label runat="server" Text="enter coupon code" CssClass="text-capitalize"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                            <asp:Label runat="server" ID="msg" ForeColor="red" CssClass="text-capitalize"></asp:Label>
                        </div>
                        <div class="d-block">
                            <asp:Button runat="server" ID="copBtn" CssClass="btn text-center text-capitalize apllcop1 mt-3" Text="apply" OnClick="copBtn_Click" />
                        </div>
                    </div>
                </div>
                <div class="card mt-4 BillDiv1" runat="server" id="BillDiv">
                    <div class="card-body text-capitalize">
                        <h6 class="mb-3 mt-3">bill summary</h6>
                        <div class="border mb-4"></div>
                        <div class="row mb-3">
                            <div class="col-lg-8 col-sm-12">Total MRP</div>
                            <div class="col-lg-4 col-sm-12">
                                Rs.<span id="totalPrice" runat="server"> </span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-8 col-sm-12">delivery charges</div>
                            <div class="col-lg-4 col-sm-12">
                                Rs.<asp:Label runat="server" ID="DelCharges">100 </asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-8 col-sm-12">coupon discount</div>
                            <div class="col-lg-4 col-sm-12">
                                Rs.
                                <asp:Label runat="server" ID="CopDiscount"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-8 col-sm-12">additional discount</div>
                            <div class="col-lg-4 col-sm-12">
                                <asp:Label runat="server" ID="Label1">Rs. 0</asp:Label>
                            </div>
                        </div>
                        <div class="border mb-4"></div>
                        <div class="row mb-3">
                            <div class="col-lg-8 col-sm-12">amount to be paid</div>
                            <div class="col-lg-4 col-sm-12">
                                Rs.<asp:Label runat="server" ID="LastPrice">Rs. 0</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-5" id="btnProc">
                        <div class="card-body">
                            <asp:Button ID="OrderConfirm" runat="server" Text="Proceed" OnClick="OrderConfirm_Click" CssClass="Proc"/>
                        </div>
                    </div>
                </div>
            </div>
            <div runat="server" id="FinalPriceCard">
                <h3 runat="server" id="Qunatity1"></h3>
                <h3 runat="server" id="FinalePrice1"></h3>
            </div>
        </div>
    </div>
</asp:Content>
