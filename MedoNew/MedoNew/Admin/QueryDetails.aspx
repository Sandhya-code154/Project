<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="QueryDetails.aspx.cs" Inherits="MedoNew.Admin.QueryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         #Form {
            width:1180px;
            margin-left:300px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-5" id="Form">
        <div class="card">
            <div class="card-header badge-info" style="text-align: center;background-color:rgb(51, 255, 214)"";>
                <h3>User Contact Form Details</h3>
            </div>
            <div class="card-body"> 
                <asp:GridView ID="dgv" runat="server" class="table table-bordered" AllowPaging="True"
                    AutoGenerateColumns="False" DataKeyNames="UserId" PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("UserId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblname" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email Id">
                            <ItemTemplate>
                                <asp:Label ID="lblemail" runat="server" Text='<%#Eval("UserEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Contact Number">
                            <ItemTemplate>
                                <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("ContactNum") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Issue">
                            <ItemTemplate>
                                <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("Issue") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lblcomment" runat="server" Text='<%#Eval("IssueDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
