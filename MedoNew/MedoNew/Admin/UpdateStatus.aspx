<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateStatus.aspx.cs" Inherits="MedoNew.Admin.UpdateStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Form {
            width: 1100px;
            margin-left: 300px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="card mx-auto mt-5 mx-auto mt-5 mb-5" id="Form">
        <div class="card-header  text-dark" style="background-color:#33ffd6;">
            <h3 style="text-align: center; background-color: #33ffd6;">Update Order Status</h3>
        </div>
        <div class="card-body">
            <div class="form-row">
                <div class="form-group col-lg-6">
                    <label for="txtcatid">
                        ID:</label>
                    <asp:TextBox runat="server" ID="txtcatid" ReadOnly="true" class="form-control" placeholder="Auto-increment ID"></asp:TextBox>
                </div>  
            </div>
            <div class="form-row mt-4">
                <div class="form-group col-lg-12">
                    <label for="txtdesp">
                        Enter Order id:</label>
                    <asp:TextBox runat="server" ID="txtdesp" class="form-control" placeholder="enter order id"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="please enter Order id" ControlToValidate="txtdesp"
                        ForeColor="Red" ValidationGroup="procat"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-lg-12">
                    <label for="txtstatus">
                        Enter Order Status:</label>
                    <asp:TextBox runat="server" ID="status" class="form-control" TextMode="MultiLine" placeholder="enter Order status"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="please enter order status" ControlToValidate="txtdesp"
                        ForeColor="Red" ValidationGroup="procat"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row d-flex">
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" Width="90%" class="btn btn-block" ID="Reset" Style="background-color: #33ffd6; color: white; width: 90%;" OnClick="Reset_Click">Reset</asp:LinkButton>
                </div>
                <div class="col-lg-4">
                    <asp:LinkButton runat="server" Width="90%" class="btn btn-block" ID="Update"
                        Style="background-color: #33ffd6; color: white; width: 90%;" OnClick="Update_Click">Update Order Status</asp:LinkButton>
                </div>
            </div>
            <br />
            <asp:GridView ID="dgv" runat="server" class="table table-bordered text-center" AllowPaging="True"
                AutoGenerateColumns="False" DataKeyNames="OrderId" OnRowDeleting="dgv_RowDeleting"
                OnRowUpdating="dgv_RowUpdating" OnPageIndexChanging="dgv_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:TemplateField HeaderText="Order Id">
                        <ItemTemplate>
                            <asp:Label ID="lblcatid" runat="server" Text='<%#Eval("OrderId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Amount">
                        <ItemTemplate>
                            <asp:Label ID="NoOfPack" runat="server" Text='<%#Eval("OrderFinalAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Status">
                        <ItemTemplate>
                            <asp:Label ID="lblstat" runat="server" Text='<%#Eval("OrderStatusUpdate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Order Status Update Date">
                        <ItemTemplate>
                            <asp:Label ID="lblstat1" runat="server" Text='<%#Eval("OrderStatusUpdateDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <i class="fa fa-edit"></i>
                            <asp:LinkButton ID="Edit" runat="server" Text="Update Order Status" CommandName="Update" ToolTip="Update" />
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
