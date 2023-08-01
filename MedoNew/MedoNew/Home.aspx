<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MedoNew.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" integrity="sha512-OTcub78R3msOCtY3Tc6FzeDJ8N9qvQn1Ph49ou13xgA9VsH9+LRxoFU6EqLhW4+PKRfU+/HReXmSZXHEkpYoOA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    <!-- Carousel Start-->
        <div class="container-fluid mb-4">
            <div class="Spacer20"></div>
            <div class="Spacer10"></div>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-mdb-interval="10000">
                        <img src="https://www.netmeds.com/images/cms/aw_rbslider/slides/1666362307_Home_Bannernmsnew.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item" data-mdb-interval="2000">
                        <img src="https://www.netmeds.com/images/cms/aw_rbslider/slides/1669212547_code-netmeds-w-h.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://www.netmeds.com/images/cms/aw_rbslider/slides/1671640109_Web_Home_Kareena.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://www.netmeds.com/images/cms/aw_rbslider/slides/1666362521_Home_Bannernms20.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    <div class="ProdDiv">
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="d-flex justify-content-between container-fluid mb-1" id="BackDiv">
                    <h5>Explore Category</h5>
                    <a href="Generic.aspx" class="text-decoration-none text-capitalize text-dark">view all>></a>
                </div>
                <div class="row">

                   <asp:Repeater ID="CategoryList" runat="server">
                       <ItemTemplate>
                           <div class="col-md-12 col-lg-3 mb-4 mb-lg-0 text-center">
                        <div class="card prodCard">
                            <div class="card-body pt-3">
                                <a href="Shop.aspx?category_id=<%#Eval("CategoryId")%>" class="text-decoration-none text-dark">
                                   
                                    <img  class="mt-5" src="Admin/product/<%#Eval("Image") %>" alt="" height="180" width="180">
                                    <h6 class="pt-4"><%#Eval("Name")%></h6>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
    </script>
</asp:Content>
