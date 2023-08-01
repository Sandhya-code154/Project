<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="offers.aspx.cs" Inherits="MedoNew.offers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <style>
        body {
            height: 200vh;
        }

        #prodChild {
            padding-right: 100px;
            border: 1px solid red;
            width: 400px !important;
            height: 350px !important;
        }

        #BackDiv {
        }

        .prodCard {
            height: 310px !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ProdDiv">
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="d-flex justify-content-between container-fluid mb-1" id="BackDiv">
                    <h5>Explore Offers</h5>
                    <a href="Generic.aspx" class="text-decoration-none text-capitalize text-dark">view all>></a>
                </div>
                <div class="row">

                   <asp:Repeater ID="OfferList" runat="server">
                       <ItemTemplate>
                           <div class="col-md-12 col-lg-3 mb-4 mb-lg-0 text-center">
                        <div class="card prodCard">
                            <div class="card-body pt-3">
                                <a href="Shop.aspx?category_id=<%#Eval("copid")%>" class="text-decoration-none text-dark">
                                   
                                   <%-- <img  class="mt-5" src="Admin/product/<%#Eval("Image") %>" alt="" height="200" width="200">--%>
                                    <h4 class="pt-4"><%#Eval("CopCode")%></h4>
                                    <h6 class="pt-4"><%#Eval("copDiscount")%></h6>
                                    
                                    <p><%#Eval("description")%></p>
                                </a>
                            &nbsp;&nbsp;</div>
                        </div>
                    </div>
                       </ItemTemplate>
                   </asp:Repeater>
                    
                    <%--<div class="col-md-12 col-lg-3 mb-4 mb-lg-0 text-center">
                        <div class="card prodCard">
                            <div class="card-body pt-3">
                                <a href="Generic.aspx" class="text-decoration-none text-dark">
                                    <img src="Images/ProductsImg/truuth_omega_3_vegan_capsules_60s_472647_0_2.jpg" height="160" width="160" class="mt-5"/>
                                    <h6 class="pt-4">Generic</h6>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3 mb-4 mb-md-0 text-center">
                        <div class="card prodCard">
                            <div class="card-body">
                                <a href="ayurvedic.aspx" class="text-decoration-none text-dark">
                                    <img src="Images/ProductsImg/himalaya_wellness_brahmi_tablet_60_s_0.jpg" height="210" width="210" class="mt-2"/>
                                    <h6 class="pt-2">Ayurvedic</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3  mb-4 mb-md-3 text-center">
                        <div class="card prodCard">
                            <div class="card-body">
                                <a href="homeopathy.aspx" class="text-decoration-none text-dark">
                                    <img src="Images/ProductsImg/MW618e56cf766ae-400X.png" height="160" width="160" class="mt-5"/>
                                    <h6 class="mt-3">Homeopathy</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-3 mb-4 mb-lg-0 text-center">
                        <div class="card prodCard">
                            <div class="card-body">
                                <a href="PersonalCare.aspx" class="text-decoration-none text-dark">
                                    <img src="Images/cetaphil-os-oily-skin-cleanser-125ml_f8f27d2f-74e5-4072-b039-91407a15d124.jpg" height="150" width="150" class="mt-5"/>
                                    <h6 class="mt-4">Personal Care</h6>
                                </a>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
