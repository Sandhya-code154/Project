<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MedoNew.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="CSS/Register.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        #RegBtn {
            background-color: #033b4d;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <div class="spacer10"></div>
            <h3 class="text-center mb-4">Create Your Account<img src="https://img.icons8.com/external-itim2101-lineal-color-itim2101/60/null/external-account-bill-and-payment-itim2101-lineal-color-itim2101.png" class="mx-2" /></h3>
            <div class="card-body">
                <div class="row">
                    <div class="d-flex align-items-center inputDiv col-lg-6">
                        <img src="Images/MastePageLogo/user.png" />
                        <asp:TextBox runat="server" placeholder="Enter your first name" CssClass="form-control" ID="Name" MaxLength="40"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter name" ControlToValidate="name" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div class="col-lg-6 d-flex align-items-center inputDiv">
                        <img src="Images/MastePageLogo/user.png" />
                        <asp:TextBox runat="server" placeholder="Enter your last name" CssClass="form-control" ID="txtlname" MaxLength="40"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="please enter name" ControlToValidate="txtlname" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="spacer25"></div>
                <div class="d-flex align-items-center inputDiv">
                    <img src="Images/MastePageLogo/email%20(1).png" />
                    <asp:TextBox runat="server" placeholder="Enter your email" CssClass="form-control" ID="Email" TextMode="Email"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter your email" ControlToValidate="email" Display="Dynamic" CssClass="req"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="please enter a valid email" ControlToValidate="email" CssClass="req" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <div class="spacer25"></div>
                <div class="row">
                    <div class="d-flex align-items-center inputDiv col-lg-6">
                        <img src="Images/MastePageLogo/padlock.png" />
                        <asp:TextBox runat="server" placeholder="Create Password" CssClass="form-control" ID="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="please create your password" ControlToValidate="password" Display="Dynamic" CssClass="req"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password length must be between 7 to 10 characters" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" ControlToValidate="password" CssClass="req"></asp:RegularExpressionValidator>
                    <div class="d-flex align-items-center inputDiv col-lg-6">
                        <img src="Images/MastePageLogo/change.png" />
                        <asp:TextBox runat="server" placeholder="Confirm Password" CssClass="form-control" ID="ConPwd" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please confirm your password" ControlToValidate="conpwd" Display="Dynamic" CssClass="req"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" Display="Dynamic" ControlToCompare="password" ControlToValidate="conpwd" CssClass="req"></asp:CompareValidator>
                <div class="spacer30"></div>
                <div class="d-flex align-items-center inputDiv">
                    <img src="Images/MastePageLogo/call.png" height="28" width="28" />
                    <asp:TextBox runat="server" placeholder="Enter Your Phone Number" CssClass="form-control" ID="number" MaxLength="10"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please enter your phone number" ControlToValidate="number" Display="Dynamic" CssClass="req"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                    ControlToValidate="number" ErrorMessage="Invalid Phone Number"
                    ValidationExpression="[0-9]{10}" Display="Dynamic" CssClass="req"></asp:RegularExpressionValidator>
                <div class="spacer30"></div>
                <div class="d-flex align-items-center inputDiv">
                    <img src="Images/MastePageLogo/place.png" height="28" width="28" />
                    <asp:TextBox runat="server" placeholder="Enter Your Address" CssClass="form-control" TextMode="MultiLine" ID="txtAddress" MaxLength="250"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="please enter your addresss" ControlToValidate="txtAddress" Display="Dynamic" CssClass="req"></asp:RequiredFieldValidator>
                <div class="spacer30"></div>
                <div class="mt-4">
                    <asp:Button runat="server" Text="sign up" CssClass="btn w-100  py-2 text-capitalize" ID="RegBtn" OnClick="RegBtn_Click" />
                </div>
                <div class="spacer25"></div>
                <div class="text-center mt-3">
                    <p>Already have an account? <a href="Login.aspx" class="text-dark">Sign In</a> </p>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
