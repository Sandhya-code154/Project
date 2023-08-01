<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChemistLogin.aspx.cs" Inherits="MedoNew.Chemist.ChemistLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap');


        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }

        h3 {
            font-weight: bold;
        }


        .card-1 {
            min-height: 460px;
            width: 460px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
        }

        .card .inputDiv img {
            position: relative;
            left: 30px;
        }

        label {
            position: relative;
            left: 28px;
        }


        .form-control {
            margin-left: -10px;
            margin-right: 20px;
            width: 570px !important;
            padding: 10px 10px 10px 50px !important;
        }

            .form-control:hover {
                border: 1px solid #f2ccff !important;
            }

        .spacer5 {
            margin-top: 5px;
        }

        .spacer10 {
            margin-top: 10px;
        }

        .spacer15 {
            margin-top: 10px;
        }

        .spacer20 {
            margin-top: 20px;
        }

        .spacer30 {
            margin-top: 30px;
        }

        label {
            margin-bottom: 2px;
        }

        a {
            color: black;
        }

            a:hover {
                color: #00d9c5;
            }

        .req {
            position: relative;
            left: 32px;
        }

        .btn {
            font-weight: 600;
            background-color: #00d9c5;
            color: #fff;
            padding: 100px 0px;
            margin-left: 1px;
            font-size: 18px;
            font-weight: 500;
        }

            .btn:hover {
                background-color: #00d9c5;
                color: #fff;
                border: 1px solid #11101d;
            }

        h3 {
            font-weight: 500 !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <div class="card card-1">
                    <h3 class="text-center pt-4 text-capitalize">Chemist Login
                <img src="https://img.icons8.com/color/48/null/pharmacist-skin-type-1.png" />
                    </h3>
                    <label class="text-danger" runat="server" id="errmsg"></label>
                    <div class="card-body">
                        <div>
                            <label>Chemist Id</label>
                            <div class="d-flex align-items-center inputDiv">
                                <span>
                                    <img src="../Admin/Images/Logo/id.png" />

                                </span>
                                <asp:TextBox runat="server" placeholder="Enter your id" CssClass="form-control" ID="Id"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="Please enter chemist id" ControlToValidate="Id" CssClass="text-danger req" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="spacer30"></div>
                        <div>
                            <label>Email</label>
                            <div class="d-flex align-items-center inputDiv">
                                <span>
                                    <img src="../Admin/Images/Logo/email%20(2).png" />
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
                                    <img src="../Admin/Images/Logo/padlock.png" />
                                </span>
                                <asp:TextBox runat="server" placeholder="Enter your password" CssClass="form-control" ID="Pwd" MaxLength="10" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" CssClass="text-danger req" ControlToValidate="Pwd" ErrorMessage="Please Enter Password" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="spacer30"></div>
                        <div class="spacer10"></div>
                        <div class="mt-4">
                            <asp:Button runat="server" Text="Sign In" CssClass="btn w-100 py-2" ID="LogBtn" OnClick="LogBtn_Click" />
                        </div>
                        <div class="spacer15"></div>
                        <div class="text-center mt-3">
                            <a href="ChemistRegister.aspx" class="text-dark">Chemist Register</a>
                        </div>
                        <div class="spacer20"></div>
                        <div class="spacer15"></div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../Scripts/bootstrap.min.js"></script>
    </form>
</body>
</html>
