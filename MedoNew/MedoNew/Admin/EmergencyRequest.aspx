<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EmergencyRequest.aspx.cs" Inherits="MedoNew.Admin.EmergencyRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        #FormDiv1{
            width:500px !important;
            
        }
        .orderTab{
          
            width:800px !important;
            padding:10px !important;
            min-height:400px !important;
            margin-left:300px !important;
        }
        .chk{
            margin-top:30px;
            background-color:#24aeb1;
            text-decoration:none;
            color:#fff !important;
            padding:8px 30px !important;
            border-radius:7px;
        }
        .formdiv{
            margin-top:30px;
            width:600px;
            margin-left:400px;
        }
        .btnsend{
            background-color:#033b4d;
            color:#fff;
            padding:7px 40px;
            border-radius:7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-5" id="FormDiv">
        <div class="card mt-3 orderTab ">
            <div class="card-header badge-info" style="text-align: center; background-color: #033b4d; color: #fff;">
                <h5 class="pt-1">Emergency Medicine Request By User</h5>
            </div>
            <div class="card-body">
                <h3 class="fw-bold text-center" runat="server" visible="false" id="msg">No Request Is Found</h3>
                <div class="col-lg-12">
                    <div class="row">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <th>Medicine Name</th>
                                    <th>UserId</th>
                                    <th>Location</th>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("MedicineName") %></td>
                                    <td><%# Eval("UserId") %></td>
                                    <td><%# Eval("LocationName") %></td>
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
         <div class="card formdiv">
             <div class="card-body">
                 <h5 class="fw-bold text-center">Reply To User Request Medicine</h5>
                 <div class="mt-3">
                     <label>Enter User Id</label>
                     <asp:TextBox ID="txtid" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator runat="server" ErrorMessage="this is required" ValidationGroup="v1" CssClass="text-danger" ControlToValidate="txtid"></asp:RequiredFieldValidator>
                 </div>
                 <div class="mt-3">
                     <label>Enter Medicine Price</label>
                     <asp:TextBox ID="txtprice" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator runat="server" ErrorMessage="this is required" ValidationGroup="v1" CssClass="text-danger" ControlToValidate="txtprice"></asp:RequiredFieldValidator>
                 </div>
                 <div class="mt-3">
                     <label>Enter Message</label>
                     <asp:TextBox ID="txtmsg" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                     <asp:RequiredFieldValidator runat="server" ErrorMessage="this is required" ValidationGroup="v1" CssClass="text-danger" ControlToValidate="txtmsg"></asp:RequiredFieldValidator>
                 </div>
                 <div class="mt-3 text-center">
                     <asp:Button ID="Button1" runat="server" Text="Send to User" CssClass="btnsend" ValidationGroup="v1" OnClick="Button1_Click"/>
                 </div>
             </div>
         </div>
    </div>

   
</asp:Content>
