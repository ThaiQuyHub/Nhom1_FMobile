<%--
  Created by IntelliJ IDEA.
  User: Hieu
  Date: 17/09/2024
  Time: 10:13 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.2/js/toastr.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; margin: 0; padding: 20px; }
        h1 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
        .total { font-weight: bold; font-size: 1.2em; }
        .lbform{
            font-weight: bold;
            display: block;
            margin-bottom: 3px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<h1>Checkout</h1>
<table>
    <thead>
    <tr>
        <th>Product</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${cart}" var="item">
        <tr>
            <td>${item.key.productName}</td>
            <td class="prices">$${item.key.price}</td>
            <td>${item.value}</td>
            <td>$${item.key.price * item.value}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="total">
    Total Amount: $${totalAmount}
</div>
<hr>
<h5>Thông tin đặt hàng</h5>
<c:if test="${user != null}">
    <form method="post" action="/checkout" class="row">
        <div class="col-sm-4">
            <label class="lbform">Email</label>
            <input value="${user.email}" readonly disabled class="form-control">
            <label class="lbform">Họ tên</label>
            <input value="${user.fullName}" class="form-control">
            <label class="lbform">Địa chỉ</label>
            <input value="${user.address}" name="address" class="form-control">
            <label class="lbform">Số điện thoại</label>
            <input value="${user.phone}" class="form-control">
        </div>
        <div class="col-sm-4">
            <label class="lbform">Phương thức thanh toán</label>
            <select name="payment" class="form-control">
                <c:forEach items="${payment}" var="payment">
                    <option value="${payment.id}">${payment.paymentName}</option>
                </c:forEach>
            </select>
            <br><br>
            <button class="form-control btn btn-primary">Đặt hàng</button>
        </div>
    </form>
</c:if>
<c:if test="${user == null}">
    <form method="post" action="/checkout-not-login" class="row">
        <div class="col-sm-4">
            <label class="lbform">Họ tên</label>
            <input name="fullName" class="form-control">
            <label class="lbform">Địa chỉ</label>
            <input name="address" class="form-control">
            <label class="lbform">Số điện thoại</label>
            <input name="phone" class="form-control">
            <label class="lbform">Email</label>
            <input name="email" class="form-control">
        </div>
        <div class="col-sm-4">
            <label class="lbform">Phương thức thanh toán</label>
            <select name="payment" class="form-control">
                <c:forEach items="${payment}" var="payment">
                    <option value="${payment.id}">${payment.paymentName}</option>
                </c:forEach>
            </select>
            <br><br>
            <button class="form-control btn btn-primary">Đặt hàng</button>
        </div>
    </form>
</c:if>

</body>
<script>
    $( document ).ready(function() {
        var prices = document.getElementsByClassName("prices");
        // for(i=0; i<prices.length; i++){
        //     prices[i].innerHTML = formatmoney(prices[i].textContent)
        // }
    });
    function formatmoney(money) {
        const VND = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });
        return VND.format(money);
    }
</script>
</html>
