<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedoNew.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="CSS/Login.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        #LogBtn {
            background-color: #033b4d;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h3 class="text-center pt-4 text-capitalize">Sign in
                    <img src="https://img.icons8.com/external-flaticons-flat-flat-icons/70/null/external-login-web-development-flaticons-flat-flat-icons.png" />
            </h3>
            <label class="text-danger" runat="server" id="errmsg"></label>
            <div class="card-body">
                <div>
                    <label>Email</label>
                    <div class="d-flex align-items-center inputDiv">
                        <span>
                            <img src="Images/MastePageLogo/email%20(1).png" />
                        </span>
                        <asp:TextBox runat="server" placeholder="Enter your email" CssClass="form-control" ID="Email" TextMode="Email"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="req1" ErrorMessage="Please Enter Email" ControlToValidate="Email" CssClass="text-danger req" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <div class="spacer30"></div>
                    <label>Password</label>
                    <div class="d-flex align-items-center email inputDiv">
                        <span>
                            <img src="Images/MastePageLogo/padlock.png" /></span>
                        <asp:TextBox runat="server" placeholder="Enter your password" CssClass="form-control" ID="Pwd" MaxLength="10" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator runat="server" CssClass="text-danger req" ControlToValidate="Pwd" ErrorMessage="Please Enter Password" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="spacer30"></div>
                <div class="spacer10"></div>
                <div class="mt-4">
                    <asp:Button runat="server" Text="Sign in" CssClass="btn w-100 py-2" ID="LogBtn" OnClick="LogBtn_Click" />
                </div>
                <div class="spacer15"></div>
                <div class="spacer20"></div>
                <div class="text-center text-uppercase">
                    <p>OR</p>
                    <div></div>
                </div>
                <div class="spacer15"></div>
                <div class="spacer10"></div>
                <div class="text-center mt-4">
                    Don't have an account? <a href="Register.aspx" class="text-dark">Sign up today </a>
                </div>
                <div class="text-center mt-3">
                    Forgot Password?<a href="ForgotPwd.aspx" class="mx-2 text-dark">Reset Now</a>
                </div>
                <div class="text-center mt-3">
                    <span><a href="Admin/Login.aspx" class="text-dark mx-1">Admin Login </a></span>
                    <span>Or</span>
                    <span><a href="Chemist/ChemistLogin.aspx" class="text-dark mx-1">Chemist Login </a></span>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
