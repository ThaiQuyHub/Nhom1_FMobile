<%--
  Created by IntelliJ IDEA.
  User: ThinkPad T470
  Date: 9/9/2024
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
<<<<<<< HEAD
    <title>Verify | FMOBILE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
=======
    <title>Login Form Design | CodeLab</title>
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        html,body{
            display: grid;
            height: 100%;
            width: 100%;
            place-items: center;
            background: #f2f2f2;
            background: url("https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg");
        }
        ::selection{
            background: #4158d0;
            color: #fff;
        }
        .wrapper{
            width: 600px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
        }
        .wrapper .title{
            font-size: 35px;
            font-weight: 600;
            text-align: center;
            line-height: 100px;
            color: #fff;
            user-select: none;
            border-radius: 15px 15px 0 0;
            background: linear-gradient(-135deg, #c850c0, #4158d0);
        }
        .wrapper form{
            padding: 10px 30px 50px 30px;
        }
        .wrapper form .field{
            height: 50px;
            width: 100%;
            margin-top: 20px;
            position: relative;
        }
        .wrapper form .field input{
            height: 100%;
            width: 100%;
            outline: none;
            font-size: 17px;
            padding-left: 20px;
            border: 1px solid lightgrey;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .wrapper form .field input:focus,
        form .field input:valid{
            border-color: #4158d0;
        }
        .wrapper form .field label{
            position: absolute;
            top: 50%;
            left: 20px;
            color: #999999;
            font-weight: 400;
            font-size: 17px;
            pointer-events: none;
            transform: translateY(-50%);
            transition: all 0.3s ease;
        }
        form .field input:focus ~ label,
        form .field input:valid ~ label{
            top: 0%;
            font-size: 16px;
            color: #4158d0;
            background: #fff;
            transform: translateY(-50%);
        }
        form .content{
            display: flex;
            width: 100%;
            height: 50px;
            font-size: 16px;
            align-items: center;
            justify-content: space-around;
        }
        form .content .checkbox{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        form .content input{
            width: 15px;
            height: 15px;
            background: red;
        }
        form .content label{
            color: #262626;
            user-select: none;
            padding-left: 5px;
        }
        form .content .pass-link{
            /*color: "";*/
        }
        form .field input[type="submit"]{
            color: #fff;
            border: none;
            padding-left: 0;
            margin-top: -10px;
            font-size: 20px;
            font-weight: 500;
            cursor: pointer;
            background: linear-gradient(-135deg, #c850c0, #4158d0);
            transition: all 0.3s ease;
        }
        form .field input[type="submit"]:active{
            transform: scale(0.95);
        }
        form .signup-link{
            color: #262626;
            margin-top: 20px;
            text-align: center;
        }
        form .pass-link a,
        form .signup-link a{
            color: #4158d0;
            text-decoration: none;
        }
        form .pass-link a:hover,
        form .signup-link a:hover{
            text-decoration: underline;
        }
<<<<<<< HEAD
        .error {
            color: red;
            font-size: 14px;
        }
=======
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function resendOTP() {
            $.ajax({
                type: "POST",
                url: "/resend-otp",
                success: function(response) {
                    alert(response);
                },
                error: function() {
                    alert("Có lỗi xảy ra khi gửi lại mã OTP. Vui lòng thử lại sau.");
                }
            });
        }
    </script>
</head>
<body>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%-- Add taglib directive --%>
<div class="wrapper">
    <div class="title">
        Verify
    </div>
    <%--@elvariable id="verify" type="com.group1.fmobile.domain.dto.VerifyDTO"--%>
    <form:form action="/verify" method="post" modelAttribute="verify"> <%-- Use form:form and assume a 'verificationData' model attribute --%>
<<<<<<< HEAD
        <div class="mb-5 field">
            <form:input path="otp" type="text" required="required" />
            <label>Verification code</label>
            <form:errors path="otp" cssClass="error" />
=======
        <div class="field">
            <form:input path="otp" type="text" required="required" />
            <label>Verification code</label>
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
        </div>
        <div class="field">
            <input type="submit" value="Submit">
        </div>
        <div>
            <p>not receive verification code? <a href="javascript:void(0);" onclick="resendOTP()">resend code</a></p>
        </div>
        <div class="signup-link">
            back to login <a href="login.html">login now</a>
        </div>
    </form:form>
</div>
</body>
</html>
