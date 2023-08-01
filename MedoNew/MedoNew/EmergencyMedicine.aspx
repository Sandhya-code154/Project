<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmergencyMedicine.aspx.cs" Inherits="MedoNew.EmergencyMedicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .btn-sub{
            background-color:#033b4d !important;
            color:#fff;
            padding:7px 40px;
        }
        .CardSub{
            width:600px !important;
            height:450px !important;
        }
        .btn-sub:hover{
            color:#fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-3 mb-5 d-flex justify-content-center align-items-center">
        <div class="card  CardSub pt-4 pb-5">
            <h3 class="text-center"> <img src="https://img.icons8.com/external-others-zufarizal-robiyanto/64/null/external-emergency-biru-medical-care-others-zufarizal-robiyanto.png"/>Order Emergency Medicine</h3>
            <div class="card-body">
                <div class="">
                    <label>Enter Your Name</label>
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"  ValidationGroup="v1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="this is required" ControlToValidate="txtname" ValidationGroup="v1" ForeColor="red"></asp:RequiredFieldValidator>
                </div>
                 <div class="">
                    <label>Enter Medicine Name</label>
                    <asp:TextBox ID="txtmed" runat="server" CssClass="form-control"  ValidationGroup="v1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="this is required" ControlToValidate="txtmed"  ValidationGroup="v1" ForeColor="red"></asp:RequiredFieldValidator>
                </div>
                <div class="">
                    <label>Select Location</label>
                     <div class="">
                         <asp:DropDownList ID="DropDownList3" runat="server" CssClass="text-capitalize dropdown form-control" ValidationGroup="v1">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="this is required" CssClass="req" ControlToValidate="DropDownList3" Display="Dynamic" ValidationGroup="v1" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="text-center mt-4 mb-4">
                    <asp:Button ID="Button1" runat="server" Text="Request" CssClass="btn btn-sub"  ValidationGroup="v1" OnClick="Button1_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
