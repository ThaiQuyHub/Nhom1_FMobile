<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Quicksand', Arial, sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-title {
            color: #0d6efd;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
            border-color: #0a58ca;
            transform: translateY(-2px);
        }
        .form-control:focus, .form-select:focus {
            border-color: #86b7fe;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        .img-thumbnail {
            border-radius: 10px;
        }
        .lbform {
            font-weight: bold;
            display: block;
            margin-bottom: 3px;
            margin-top: 15px;
        }
        .text-danger {
            color: #b34040;
            font-size: 0.875rem;
            margin-top: 5px;
        }
        @media (max-width: 768px) {
            .order-item {
                flex-direction: column;
                align-items: flex-start;
            }
            .order-item img {
                margin-bottom: 1rem;
            }
            .order-item button {
                margin-top: 1rem;
            }
        }
    </style>
    <script>
        function validateFormGuest(form) {
            // Reset lại thông báo lỗi trước mỗi lần submit
            document.getElementById('fullNameError').innerHTML = '';
            document.getElementById('addressError').innerHTML = '';
            document.getElementById('phoneError').innerHTML = '';
            document.getElementById('emailError').innerHTML = '';

            let fullName = form.fullName.value.trim();
            let address = form.address.value.trim();
            let phone = form.phone.value.trim();
            let email = form.email.value.trim();

            let isValid = true;

            // Validate Full Name
            if (fullName === '') {
                document.getElementById('fullNameError').innerHTML = 'Full Name is required.';
                isValid = false;
            }

            // Validate Address
            if (address === '') {
                document.getElementById('addressError').innerHTML = 'Address is required.';
                isValid = false;
            }

            // Validate Phone (10-11 số và bắt đầu bằng số 0)
            const phonePattern = /^0\d{9,10}$/;
            if (phone === '') {
                document.getElementById('phoneError').innerHTML = 'Phone Number is required.';
                isValid = false;
            } else if (!phone.match(phonePattern)) {
                document.getElementById('phoneError').innerHTML = 'Phone Number must be 10-11 digits and start with 0.';
                isValid = false;
            }

            // Validate Email
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === '') {
                document.getElementById('emailError').innerHTML = 'Email is required.';
                isValid = false;
            } else if (!email.match(emailPattern)) {
                document.getElementById('emailError').innerHTML = 'Invalid Email format.';
                isValid = false;
            }

            return isValid;
        }
        function validateFormUser(form) {
            // Reset lại thông báo lỗi trước mỗi lần submit
            document.getElementById('fullNameErrorLogin').innerHTML = '';
            document.getElementById('addressErrorLogin').innerHTML = '';
            document.getElementById('phoneErrorLogin').innerHTML = '';

            let fullName = form.fullName.value.trim();
            let address = form.address.value.trim();
            let phone = form.phone.value.trim();

            let isValid = true;

            // Validate Full Name
            if (fullName === '') {
                document.getElementById('fullNameErrorLogin').innerHTML = 'Full Name is required.';
                isValid = false;
            }

            // Validate Address
            if (address === '') {
                document.getElementById('addressErrorLogin').innerHTML = 'Address is required.';
                isValid = false;
            }

            // Validate Phone
            const phonePattern = /^0\d{9,10}$/;
            if (phone === '') {
                document.getElementById('phoneErrorLogin').innerHTML = 'Phone Number is required.';
                isValid = false;
            } else if (!phone.match(phonePattern)) {
                document.getElementById('phoneErrorLogin').innerHTML = 'Phone Number must be 10-11 digits and start with 0.';
                isValid = false;
            }

            return isValid;
        }



    </script>
</head>
<body>
<%-- Lấy header theo thằng ml mô đặt tên--%>
<jsp:include page="header.jsp"/>

<div class="container mt-5">
    <h1 class="mb-4">Checkout</h1>
    <div class="row">
        <div class="col-lg-8">
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="card-title">Order Details</h2>
                    <table class="table">
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
                                <td>$ ${item.key.price * item.value}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-between">
                        <h5>Total:</h5>
                        <h5>$ ${totalAmount}</h5>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="card-title">Order Information</h2>
                    <c:if test="${user != null}">
                        <form method="post" action="/checkout" class="row" onsubmit="return validateFormUser(this);">
                            <div class="col-md-6">
                                <label class="lbform">Email</label>
                                <input value="${user.email}" readonly disabled class="form-control">
                                <label class="lbform">Full Name</label>
                                <input name="fullName" value="${user.fullName}" class="form-control">
                                <div id="fullNameErrorLogin" class="text-danger"></div> <!-- Thẻ báo lỗi Full Name -->
                                <label class="lbform">Address</label>
                                <input name="address" value="${user.address}" class="form-control">
                                <div id="addressErrorLogin" class="text-danger"></div> <!-- Thẻ báo lỗi Address -->
                                <label class="lbform">Phone Number</label>
                                <input name="phone" value="${user.phone}" class="form-control">
                                <div id="phoneErrorLogin" class="text-danger"></div> <!-- Thẻ báo lỗi Phone -->
                            </div>
                            <div class="col-md-6">
                                <label class="lbform">Payment Method</label>
                                <select name="payment" class="form-select">
                                    <c:forEach items="${payment}" var="payment">
                                        <option value="${payment.id}">${payment.paymentName}</option>
                                    </c:forEach>
                                </select>
                                <button class="btn btn-primary btn-lg w-100 mt-4">Place Order</button>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${user == null}">
                        <form method="post" action="/checkout-not-login" class="row" onsubmit="return validateFormGuest(this);">
                            <div class="col-md-6">
                                <label class="lbform">Full Name</label>
                                <input name="fullName" class="form-control">
                                <div id="fullNameError" class="text-danger"></div> <!-- Thẻ báo lỗi Full Name -->

                                <label class="lbform">Address</label>
                                <input name="address" class="form-control">
                                <div id="addressError" class="text-danger"></div> <!-- Thẻ báo lỗi Address -->

                                <label class="lbform">Phone Number</label>
                                <input name="phone" class="form-control">
                                <div id="phoneError" class="text-danger"></div> <!-- Thẻ báo lỗi Phone -->

                                <label class="lbform">Email</label>
                                <input name="email" class="form-control">
                                <div id="emailError" class="text-danger"></div> <!-- Thẻ báo lỗi Email -->
                            </div>
                            <div class="col-md-6">
                                <label class="lbform">Payment Method</label>
                                <select name="payment" class="form-select">
                                    <c:forEach items="${payment}" var="payment">
                                        <option value="${payment.id}">${payment.paymentName}</option>
                                    </c:forEach>
                                </select>
                                <button class="btn btn-primary btn-lg w-100 mt-4">Place Order</button>
                            </div>
                        </form>

                    </c:if>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">Order Summary</h2>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Subtotal:</span>
                        <span>$ ${totalAmount}</span>
                    </div>
                    <c:if test="${discount != null}">
                        <div class="d-flex justify-content-between mb-2 text-danger">
                            <span>Discount:</span>
                            <span class="text-danger">$ ${discount.discountValue}</span>
                        </div>
                    </c:if>
                    <hr>
                    <div class="d-flex justify-content-between mb-4">
                        <h5>Total:</h5>
                        <h5>$ ${discountedAmount != null ? discountedAmount : totalAmount}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Lấy footer theo thằng ml mô đặt tên--%>
<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
