<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="MedoNew.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        @import url('https://fonts.googleapis.com/css?family=Baloo+Bhaijaan|Ubuntu');

 

        * {

            margin: 0;

            padding: 0;

            box-sizing: border-box;

            font-family: 'Ubuntu', sans-serif;

        }

        body {

            background: #2196F3;

            margin: 0 10px;

        }

        .payment {

            background: #f8f8f8;

            max-width: 360px;

            margin: 80px auto;

            height: auto;

            padding: 35px;

            padding-top: 70px;

            border-radius: 5px;

            position: relative;

        }

 

            .payment h2 {

                text-align: center;

                letter-spacing: 2px;

                margin-bottom: 40px;

                color: #0d3c61;

            }

 

        .form .label {

            display: block;

            color: #555555;

            margin-bottom: 6px;

        }

 

        .input {

            padding: 13px 0px 13px 25px;

            width: 100%;

            text-align: center;

            border: 2px solid #dddddd;

            border-radius: 5px;

            letter-spacing: 1px;

            word-spacing: 3px;

            outline: none;

            font-size: 16px;

            color: #555555;

        }

 

        .card-grp {

            display: flex;

            justify-content: space-between;

        }

 

        .card-item {

            width: 48%;

        }

 

        .space {

            margin-bottom: 20px;

        }

 

        .icon-relative {

            position: relative;

        }

 

            .icon-relative .fas,

            .icon-relative .far {

                position: absolute;

                bottom: 12px;

                left: 15px;

                font-size: 20px;

                color: #555555;

            }

 

        .btn {

            margin-top: 40px;

            background: #2196F3;

            padding: 12px;

            text-align: center;

            color: #f8f8f8;

            border-radius: 5px;

            cursor: pointer;

        }

 

 

        .payment-logo {

            position: absolute;

            top: -50px;

            left: 50%;

            transform: translateX(-50%);

            width: 100px;

            height: 100px;

            background: #f8f8f8;

            border-radius: 50%;

            box-shadow: 0 0 5px rgba(0,0,0,0.2);

            text-align: center;

            line-height: 85px;

        }

 

            .payment-logo:before {

                content: "";

                position: absolute;

                top: 5px;

                left: 5px;

                width: 90px;

                height: 90px;

                background: #2196F3;

                border-radius: 50%;

            }

 

            .payment-logo p {

                position: relative;

                color: #f8f8f8;

                font-family: 'Baloo Bhaijaan', cursive;

                font-size: 58px;

            }

 

 

        @media screen and (max-width: 420px) {

            .card-grp {

                flex-direction: column;

            }

 

            .card-item {

                width: 100%;

                margin-bottom: 20px;

            }

 

            .btn {

                margin-top: 20px;

            }

        }

    </style>

     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

    <script>

        function checkOnline() {

            var phone = $("#mobile").val();

            var email = $("#email").val();

            var amount = $("#amount").val();

            $.ajax({

                type: 'POST',

                url: "Payment.aspx/SelectDetailOnline",

                data: "{'email':'" + email + "','phone':'" + phone + "','amount':'" + amount + "'}",

                contentType: "application/json; charset=utf-8",

                dataType: "json",

                success: function (r) { 

                    if (r.d.status == 2) {

                        Swal.fire({

                            type: 'error',

                            title: r.d.name,

                            text: 'Oops...'

                        })

                    }

                    else if (r.d.status == 0) {

                        Swal.fire({

                            type: 'error',

                            title: 'Something went wrong please try after some time ....!',

                            text: 'Oops...'

                        })

                    }

                    else

                        var options = {                          

                            "key": "rzp_test_d2v3pJiZkS4CO3",

                            "amount": r.d.amount, // INR

                            "name": "Test Razorpay",

                            "payment_capture": "0",

                            "order_id": r.d.orderid,

                            "description": "Welcome to Test ",

                            "image": "https://techmanish.in/assets/images/Manish-Tech-Logo211x57.png",

                            "handler": function (response) {

                                CheckPaymentOnline(response.razorpay_order_id, response.razorpay_payment_id, response.razorpay_signature);

                            },

                            "prefill": {

                                "name": r.d.name,

                                "email": r.d.email,

                                "contact": r.d.phone

                            },

                            "notes": {

                                "address": r.d.address

                            },

                            "theme": {

                                "color": "#F37254"

                            }

                        };

                    var rzp1 = new Razorpay(options);

                    rzp1.open();

                    e.preventDefault();

                   


                },

                error: function (XMLHttpRequest, textStatus, errorThrown) {

                    alert("Status: " + textStatus); alert("Error: " + errorThrown);

                }

            });

        };



 

        function CheckPaymentOnline(orderid, paymentid, signature) {


            function SendEmail() {
                $.ajax({

                    url: 'Payment.aspx/VerifyEmail',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: '{email:"' + $("#email").val() + '"}',
                    success: OnSuccess,
                    failure: OnFailure,
                    complete: function (xhr, status) {
                        /*alert(status);*/
                    }

                });

                function OnSuccess(response) {
                    if (response.d == "yes") {

                       
                    }
                    else {
                        /*$("#errmsg").text("Please enter a valid email id");*/
                    }
                }

                function OnFailure() {
                    alert("fail");
                }





            }

            $.ajax({

                type: "POST",

                url: "Payment.aspx/goToPayment2",

                data: "{'orderid':'" + orderid + "','paymentid':'" + paymentid + "','signature':'" + signature + "'}",

                contentType: "application/json; charset=utf-8",

                dataType: "json",

                success: function (r) {

                    if (r != null) {

                        if (r.d.status == "0") {

                            Swal.fire(

                                'Sorry due to some technical problem your Order is not processed Please Wait and try again after some time.',

                                'Click to close!',

                                'success'

                            )

                        }

                        if (r.d.status == "1") {

                          /*  alert("1");*/

                            Swal.fire({

                                position: 'top-end',

                                icon: 'success',

                                title: 'Payment Done Successfully',

                                showConfirmButton: false,

                                timer: 2500

                            })

                            SendEmail();
                            window.location = "OrderHistory.aspx";

                        }

                        if (r.d.status == "2") {

                            alert("2");

                            Swal.fire({

                                icon: 'error',

                                title: 'Oops...',

                                text: 'Something went wrong!'

                              

                            })


                            window.location = "OrderHistory.aspx";

                        }

                       

                    }

                }

            });

        };

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="wrapper">

                <div class="payment">

                    <div class="payment-logo">

                        <p>TM</p>

                    </div>



                    <h2>Razor Pay Payment Gateway</h2>

                    <div class="form">

                        <div class="card space icon-relative">

                            <label class="label">Mobile Number:</label>

                            <asp:TextBox runat="server" ID="mobile" type="text" class="input" placeholder="Mobile Number" ReadOnly="true"></asp:TextBox>

                            <i class="fas fa-user"></i>

                        </div>

                        <div class="card space icon-relative">

                            <label class="label">Email ID:</label>

                            <asp:TextBox runat="server" ID="email" type="text" class="input" placeholder="Email ID" ReadOnly="true"></asp:TextBox>

                            <i class="far fa-envelope"></i>

                        </div>

                        <div class="card space icon-relative">

                            <label class="label">Amount:</label>

                            <asp:TextBox runat="server" ID="amount" type="text" class="input" placeholder="Amount" ReadOnly="true"></asp:TextBox>

                        </div>

                        <div class="card space icon-relative">

                            <a onclick="return checkOnline();" class="btn">Pay Now </a>

                        </div>



                    </div>

                </div>

            </div>

        </div>

    </form>
</body>
</html>
