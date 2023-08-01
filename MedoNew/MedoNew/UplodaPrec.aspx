<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UplodaPrec.aspx.cs" Inherits="MedoNew.UplodaPrec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnsub{
            background-color:#24aeb1 !important;
            color:#fff !important;
            padding:7px 60px;
            border:1px solid #fff;
            border-radius:5px;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center">
        <h4 class="fw-bold text-success" runat="server" id="msg" ></h4>
        <div class="card pt-5" style="width: 430px !important;height:400px !important;">
            <h3 class="text-center">Upload Prescription</h3>
            <div class="card-body">
                <div>
                    <br />
                    <label>Upload Prescription Image:</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control mt-1"/>
                    <br />
                    <br />
                    <div class="">
                        <label>Enter Medicine Name:</label>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Medicine name" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter medicine name" ControlToValidate="TextBox1" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text-center mt-3">
                        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Submit"  CssClass="btnsub" />
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="lblmessage" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
