<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MedoNew.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-1 {
            width: 85%;
            background: #fff;
            border-radius: 6px;
            padding: 20px 60px 30px 40px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }

            .container-1 .content {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

                .container-1 .content .left-side {
                    width: 25%;
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    margin-top: 15px;
                    position: relative;
                }

        .content .left-side::before {
            content: '';
            position: absolute;
            height: 70%;
            width: 2px;
            right: -15px;
            top: 50%;
            transform: translateY(-50%);
            background: #00ffff;
        }

        .content .left-side .details {
            margin: 14px;
            text-align: center;
        }

            .content .left-side .details i {
                font-size: 30px;
                color: #24aeb1;
                margin-bottom: 10px;
            }

            .content .left-side .details .topic {
                font-size: 18px;
                font-weight: 500;
            }

            .content .left-side .details .text-one,
            .content .left-side .details .text-two {
                font-size: 14px;
                color: #afafb6;
            }

        .container-1 .content .right-side {
            width: 75%;
            margin-left: 75px;
        }

        .content .right-side .topic-text {
            font-size: 23px;
            font-weight: 600;
            color: #24aeb1;
        }

        .right-side .input-box {
            height: 50px;
            width: 100%;
            margin: 12px 0;
        }

            .right-side .input-box input,
            .right-side .input-box textarea {
                height: 100%;
                width: 100%;
                border: none;
                outline: none;
                font-size: 16px;
                background: #F0F1F8;
                border-radius: 6px;
                padding: 0 15px;
                resize: none;
            }

        .right-side .message-box {
            min-height: 110px;
        }

        .right-side .input-box textarea {
            padding-top: 6px;
        }

        .right-side .button {
            display: inline-block;
            margin-top: 12px;
        }

            .right-side .button input[type="button"] {
                color: #fff;
                font-size: 18px;
                outline: none;
                border: none;
                padding: 8px 16px;
                border-radius: 6px;
                background: #24aeb1;
                cursor: pointer;
                transition: all 0.3s ease;
            }

        .button input[type="button"]:hover {
            background: #24aeb1;
        }

        @media (max-width: 950px) {
            .container-1 {
                width: 90%;
                padding: 30px 40px 40px 35px;
            }

                .container-1 .content .right-side {
                    width: 75%;
                    margin-left: 55px;
                }
        }

        @media (max-width: 820px) {
            .container-1 {
                margin: 40px 0;
                height: 100%;
            }

                .container-1 .content {
                    flex-direction: column-reverse;
                }

                    .container-1 .content .left-side {
                        width: 100%;
                        flex-direction: row;
                        margin-top: 40px;
                        justify-content: center;
                        flex-wrap: wrap;
                    }

                        .container-1 .content .left-side::before {
                            display: none;
                        }

                    .container-1 .content .right-side {
                        width: 100%;
                        margin-left: 0;
                    }
        }

        .bod {
            background-color: #f0f1f8;
            width: 100% !important;
            margin-top: 35px;
        }

        .btn-submit {
            margin-top: 20px;
            background-color: #24aeb1;
            color: #fff;
            padding: 10px 40px;
        }

            .btn-submit:hover {
                background-color: #24aeb1;
                color: #fff;
            }

        .input-box {
            margin-top: 35px !important;
        }

        .dropdo {
            margin-top: 35px !important;
            margin-bottom: 30px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-1 container">
        <div class="content">
            <div class="left-side">
                <div class="address details">
                    <i class="fas fa-map-marker-alt"></i>
                    <div class="topic">Address</div>
                    <div class="text-one">Virar, Maha</div>
                    <div class="text-two">India</div>
                </div>
                <div class="phone details">
                    <i class="fas fa-phone-alt"></i>
                    <div class="topic">Phone</div>
                    <div class="text-one">+0098 9893 5647</div>
                    <div class="text-two">+0096 3434 5678</div>
                </div>
                <div class="email details">
                    <i class="fas fa-envelope"></i>
                    <div class="topic">Email</div>
                    <div class="text-one">demo@gmail.com</div>
                    <div class="text-two">demo2@gmail.com</div>
                </div>
            </div>
            <div class="right-side">
                <div class="topic-text">Contact Us </div>
                <p>Medo Online is India’s largest super speciality pharmacy that delivers life saving medication at affordable prices. </p>
                <div action="#">
                    <div class="input-box">
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter Your Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter your name" ControlToValidate="txtname" CssClass="text-danger" Display="Dynamic" ValidationGroup="v2"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-box mt-1">
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter Your Email Id"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter your email id" ControlToValidate="txtname" CssClass="text-danger" Display="Dynamic" ValidationGroup="v2"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-box">
                        <asp:TextBox ID="txtnum" runat="server" CssClass="form-control" placeholder="Enter Your Contact Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="please enter your contact number" ControlToValidate="txtnum" CssClass="text-danger" ValidationGroup="v2" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="dropdo">
                        <asp:DropDownList ID="DropDownList1" runat="server" placeholder="Please Select option" CssClass="form-control w-75 p-3 bod mt-1 ">
                            <asp:ListItem Value="0">Please Select option</asp:ListItem>
                            <asp:ListItem> Order Tracking isssue</asp:ListItem>
                            <asp:ListItem>Delivery Package Issue</asp:ListItem>
                            <asp:ListItem>General Feedbacks</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please select a option" ControlToValidate="DropDownList1" InitialValue="0" CssClass="text-danger" Display="Dynamic" ValidationGroup="v2"></asp:RequiredFieldValidator>
                    </div>
                    <div class="">
                        <textarea id="txtmsg" cols="20" rows="2" placeholder="Please Describe your Issue" class="form-control w-75 p-3 bod mt-3" runat="server"></textarea>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please fill this field" ControlToValidate="txtmsg" CssClass="text-danger" ValidationGroup="v2" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="button">
                        <asp:Button ID="Button1" runat="server" Text="Send Feedback" CssClass="btn btn-submit" OnClick="Button1_Click" ValidationGroup="v2" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
