<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="MedoNew.Admin.AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Form {
            width: 1140px;
            margin-left: 300px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mx-auto mt-5 mx-auto mt-5 mb-5" id="Form">
        <div class="card-header  text-dark" style="background-color: rgb(51, 255, 214);">
            <h3 style="text-align: center; background-color: rgb(51, 255, 214);">Add Category</h3>
        </div>
        <div class="card-body">
            <div class="form-row">
                <div class="form-group col-lg-6">
                    <label for="txtcatid">
                        ID:</label>
                    <asp:TextBox runat="server" ID="txtcatid" ReadOnly="true" class="form-control" placeholder="Auto-increment ID"></asp:TextBox>
                </div>

            </div>
            <div class="row mt-3">
                <div class=" col-lg-6">
                    <label for="txtcatname">
                        Category Name:
                    </label>
                    <asp:TextBox runat="server" ID="txtcatname" class="form-control" placeholder="enter category name" ValidationGroup="v1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="please enter category name" ControlToValidate="txtcatname" ForeColor="Red"
                        ValidationGroup="v1"></asp:RequiredFieldValidator>
                </div>
                <div class="col-lg-6">
                    <label for="txtdesp">
                        description:</label>
                    <asp:TextBox runat="server" ID="txtdesp" class="form-control" TextMode="MultiLine" placeholder="enter medicine description" ValidationGroup="v1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="please enter description" ControlToValidate="txtdesp"
                        ForeColor="Red" ValidationGroup="v1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row d-flex">
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" ID="Save" Width="100%" class="btn btn-block" Style="background-color: rgb(51, 255, 214); color: #000000; width: 90%;" OnClick="Save_Click" ValidationGroup="v1">Add</asp:LinkButton>
                </div>
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" Width="90%" class="btn btn-block" ID="Reset" Style="background-color: rgb(51, 255, 214); color: #000000; width: 90%;" OnClick="Reset_Click">Reset</asp:LinkButton>
                </div>
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" Width="90%" class="btn btn-block" ID="Update"
                        Style="background-color: rgb(51, 255, 214); color: #000000; width: 90%;" OnClick="Update_Click">Update</asp:LinkButton>
                </div>
            </div>
            <br />
            <asp:GridView ID="dgv" runat="server" class="table table-bordered text-center" AllowPaging="True"
                AutoGenerateColumns="False" DataKeyNames="Categoryid" OnRowDeleting="dgv_RowDeleting"
                OnRowUpdating="dgv_RowUpdating" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblcatid" runat="server" Text='<%#Eval("Categoryid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category Name">
                        <ItemTemplate>
                            <asp:Label ID="lblcatname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lblcatdesp" runat="server" Text='<%#Eval("Descp") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblstat" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <i class="fa fa-edit"></i>
                            <asp:LinkButton ID="Edit" runat="server" Text="Edit" CommandName="Update" ToolTip="Update" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <i class="fa fa-trash"></i>
                            <asp:LinkButton ID="Delete" runat="server" Text="Delete" OnClick="dgv_RowDeleting"
                                CommandName="Delete" ToolTip="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
