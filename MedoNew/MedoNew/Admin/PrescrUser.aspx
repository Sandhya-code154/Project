<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PrescrUser.aspx.cs" Inherits="MedoNew.Admin.PrescrUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #FormDiv {
        }

        .orderTab {
            width: 800px !important;
            padding: 10px !important;
            min-height: 400px !important;
            margin-left: 300px !important;
        }
        .formdiv{
             margin-left: 300px !important;
              width: 800px !important;
        }

        .chk {
            margin-top:15px;
            background-color: #24aeb1;
            text-decoration: none;
            color: #fff !important;
            padding: 8px 30px !important;
            border-radius: 7px;
            padding:7px 20px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5" id="FormDiv">
        <div class="card mt-3 orderTab ">
            <div class="card-header badge-info" style="text-align: center; background-color: #033b4d; color: #fff;">
                <h5 class="pt-1">Prescription Uploaded By Users</h5>
            </div>
            <div class="card-body">
                <h3 class="fw-bold text-center" runat="server" visible="false" id="msg">No Request Is Found</h3>
                <div class="col-lg-12">
                    <div class="row">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <th>UserId</th>
                                    <th>Prescription Image</th>
                                    <th>Medicine Name</th>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("UserId") %></td>
                                    <td><%# Eval("PrescriptionImage") %></td>
                                    <td><%# Eval("MedicineName") %></td>
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
        <div class="card formdiv mt-3">
            <div class="card-body">
                <h5 class="fw-bold text-center">Reply To User </h5>
                <div class="mt-3">
                    <label>Enter User Id</label>
                    <asp:TextBox ID="txtid" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="this is required" ValidationGroup="v1" CssClass="text-danger" ControlToValidate="txtid"></asp:RequiredFieldValidator>
                </div>
                <div class="mt-3">
                    <label>Enter Message</label>
                    <asp:TextBox ID="txtmsg" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="this is required" ValidationGroup="v1" CssClass="text-danger" ControlToValidate="txtmsg"></asp:RequiredFieldValidator>
                </div>
                <div class="mt-3 text-center">
                    <asp:Button ID="Button1" runat="server" Text="Send to User" CssClass="btnsend bg-dark text-white chk" ValidationGroup="v1" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
