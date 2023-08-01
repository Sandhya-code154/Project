<%@ Page Title="" Language="C#" MasterPageFile="~/Chemist/Chemist.Master" AutoEventWireup="true" CodeBehind="AddMedicine.aspx.cs" Inherits="MedoNew.Chemist.AddMedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #FormDiv {
            max-width: 1180px;
            margin-left: 290px !important;
        }
        .tables{
            
            margin-left:270px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card mx-auto mt-5 mx-auto mt-5 mb-5" id="FormDiv">
            <div class="card-header bg-default text-dark" style="text-align: center; background-color: rgb(51, 255, 214)">
                <h3 style="text-align: center;">Add Medicine</h3>
            </div>
            <div class="card-body">
                <div class="form-row">
                    <div class="form-group col-lg-6">
                        <label for="txtproid">
                            ID:</label>
                        <asp:TextBox runat="server" ID="txtproid" ReadOnly="true" class="form-control" placeholder="Auto-increment ID"></asp:TextBox>
                    </div>
                    <div class="form-group col-lg-6 mt-3">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <label for="txtcatid">
                            Medicine Category:
                        </label>
                        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="please choose valid option" ControlToValidate="DropDownList1"
                            ForeColor="Red" ValidationGroup="pro"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-6">
                        <label for="txtname">
                            Medicine Name:</label>
                        <asp:TextBox runat="server" ID="txtname" class="form-control" placeholder="please enter name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="please enter name" ControlToValidate="txtname" ForeColor="Red"
                            ValidationGroup="pro"></asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <label for="txtproname">
                            Medicine Brand Name:</label>
                        <asp:TextBox runat="server" ID="txtproname" class="form-control" placeholder="enter brand name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="please enter brand name" ControlToValidate="txtproname"
                            ForeColor="Red" ValidationGroup="pro"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-6">
                        <label for="txtproname">
                            Price:</label>
                        <asp:TextBox runat="server" ID="PriceN" class="form-control" placeholder="enter medicine price"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ErrorMessage="please enter medicine price" ControlToValidate="PriceN"
                            ForeColor="Red" ValidationGroup="pro"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <label for="FileUpload1">
                            Image:</label>
                        <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="please upload image" ControlToValidate="FileUpload1"
                            ForeColor="Red" ValidationGroup="pro"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-6">
                        <label for="txtdesp">
                            Description:</label>
                        <asp:TextBox runat="server" ID="txtdesp" class="form-control" TextMode="MultiLine"
                            placeholder="please enter description"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="please enter description" ControlToValidate="txtdesp"
                            ForeColor="Red" ValidationGroup="pro"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-lg-12">
                        <label for="txtcreate">
                            Created By:</label>
                        <asp:TextBox runat="server" ID="txtcreate" class="form-control" ReadOnly="true" placeholder="autogenerated"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row mt-4 d-flex justify-content-center align-items-center">
                    <div class="col-lg-4">
                        <asp:LinkButton runat="server" ID="Save" Width="100%" class="btn btn-block" Style="background-color: rgb(51, 255, 214); color: #000000; width: 80%;" OnClick="Save_Click" ValidationGroup="pro">Add</asp:LinkButton>
                    </div>
                    <div class="col-lg-4">
                        <asp:LinkButton runat="server" ID="Reset" Width="100%" class="btn btn-block" Style="background-color: rgb(51, 255, 214); color: #000000; width: 80%;" OnClick="Reset_Click">Reset</asp:LinkButton>
                    </div>
                    <div class="col-lg-4">
                        <asp:LinkButton runat="server" Width="100%" class="btn btn-block" ID="Update" Style="background-color: rgb(51, 255, 214); color: #000000; width: 80%;" OnClick="Update_Click">Update</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class=" tables">
            <div class="">
                <asp:GridView ID="dgv" runat="server" class="table table-bordered table-responsive text-center" AllowPaging="True"
                    AutoGenerateColumns="False" DataKeyNames="Productid" OnRowDeleting="dgv_RowDeleting"
                    OnRowUpdating="dgv_RowUpdating" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="5" AllowSorting="true">
                    <Columns>
                        <asp:TemplateField HeaderText="MID">
                            <ItemTemplate>
                                <asp:Label ID="lblproid" runat="server" Text='<%#Eval("Productid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category ID">
                            <ItemTemplate>
                                <asp:Label ID="lblcatid" runat="server" Text='<%#Eval("Categoryid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Medicine Name">
                            <ItemTemplate>
                                <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Brand Name">
                            <ItemTemplate>
                                <asp:Label ID="lblproname" runat="server" Text='<%#Eval("Prod_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Label ID="image" runat="server" Text='<%#Eval("Image") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lbldesp" runat="server" Text='<%#Eval("Descp") %>'></asp:Label>
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
