<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePwd.aspx.cs" Inherits="MedoNew.UpdatePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Password</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap');

        body {
            font-family: 'Poppins', sans-serif !important;
        }

        .btn {
            background-color: #033b4d;
            color: white;
        }

        .container {
            height: 100vh;
            font-family: 'Poppins', sans-serif;
        }

        .form-control {
            padding: 8px 10px;
        }

        h3 {
            letter-spacing: 3px;
        }

        .card {
            height:370px;
            width: 500px;
        }

        .btn:hover {
            background-color: #033b4d;
            color: #fff;
        }

        .req1 {
            color: rgb(255, 0, 0);
            margin-bottom: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container  d-flex justify-content-center align-items-center flex-column">
            <div class="card">
                <h3 class="text-center mt-4">Reset Password</h3>
                <label runat="server" id="errlab" class="req1"></label>
                <div class="card-body">
                    <div>
                        <label>Create Password</label>
                        <asp:TextBox runat="server" ID="password" placeholder="Create Password" CssClass="form-control mt-1" MaxLength="10" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter password" CssClass="req1" ControlToValidate="password" Display="Dynamic"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password length must be between 7 to 10 characters"  ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" ControlToValidate="password" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <label>Confirm Password</label>
                        <asp:TextBox runat="server" ID="conPwd" placeholder="Confirm Password" CssClass="form-control mt-1" MaxLength="10" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter password" CssClass="req1" ControlToValidate="conPwd" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ControlToCompare="password" ControlToValidate="conPwd" CssClass="req1"></asp:CompareValidator>
                    </div>
                    <div class="text-center mt-3">
                        <asp:Button runat="server" Text="Reset Password" ID="ResBtn" OnClick="ResBtn_Click" CssClass="btn w-100" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
