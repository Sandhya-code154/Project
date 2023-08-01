<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddDiscount.aspx.cs" Inherits="MedoNew.Admin.AddDiscount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Form {
            width: 1180px;
            margin-left: 300px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mx-auto mt-5 mx-auto mt-5 mb-5" id="Form">
        <div class="card-header  text-dark" style="background-color:rgb(51, 255, 214);">
            <h3 style="text-align: center; background-color:rgb(51, 255, 214)">Add Coupon Code</h3>
        </div>
        <div class="card-body">
            <div class="form-row">
                <div class="form-group col-lg-6">
                    <label for="txtcatid">
                        ID:</label>
                    <asp:TextBox runat="server" ID="txtcatid" ReadOnly="true" class="form-control" placeholder="Auto-increment ID"></asp:TextBox>
                </div>
                <div class="form-group col-lg-6 mt-4">
                    <label for="txtcatname">
                        Coupon Code Name:
                    </label>
                    <asp:TextBox runat="server" ID="txtcatname" class="form-control" placeholder="enter coupon name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="please enter coupon name" ControlToValidate="txtcatname" ForeColor="Red"
                        ValidationGroup="procat"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-lg-6">
                    <label for="txtdis">
                        Coupon Discount:</label>
                    <asp:TextBox runat="server" ID="txtdis" class="form-control" TextMode="MultiLine" placeholder="enter  coupon discount"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="please enter coupon discount" ControlToValidate="txtdis"
                        ForeColor="Red" ValidationGroup="procat"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-lg-6">
                    <label for="txtdesp">
                        Description:</label>
                    <asp:TextBox runat="server" ID="txtdesp" class="form-control" TextMode="MultiLine" placeholder="enter coupon description"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="please enter description" ControlToValidate="txtdesp"
                        ForeColor="Red" ValidationGroup="procat"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row d-flex">
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" ID="Save" Width="100%" class="btn btn-block" Style="background-color:rgb(51, 255, 214); color:black; width: 90%;" OnClick="Save_Click" ValidationGroup="product">Add</asp:LinkButton>
                </div>
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" Width="90%" class="btn btn-block" ID="Reset" Style="background-color:rgb(51, 255, 214); color: black; width: 90%;" OnClick="Reset_Click">Reset</asp:LinkButton>
                </div>
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" Width="90%" class="btn btn-block" ID="Update"
                        Style="background-color:rgb(51, 255, 214); color:black; width: 90%;" OnClick="Update_Click">Update</asp:LinkButton>
                </div>
            </div>
            <br />
            <asp:GridView ID="dgv" runat="server" class="table table-bordered" AllowPaging="True"
                AutoGenerateColumns="False" DataKeyNames="copid" OnRowDeleting="dgv_RowDeleting"
                OnRowUpdating="dgv_RowUpdating" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblcatid" runat="server" Text='<%#Eval("copid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Coupon Name">
                        <ItemTemplate>
                            <asp:Label ID="lblcatname" runat="server" Text='<%#Eval("CopCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Coupon Discount">
                        <ItemTemplate>
                            <asp:Label ID="lblcatdis" runat="server" Text='<%#Eval("copDiscount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Coupon Description">
                        <ItemTemplate>
                            <asp:Label ID="lbldescp" runat="server" Text='<%#Eval("description") %>'></asp:Label>
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
