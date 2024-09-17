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
    <title>Checkout</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; margin: 0; padding: 20px; }
        h1 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
        .total { font-weight: bold; font-size: 1.2em; }
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
            <td>$${item.key.price}</td>
            <td>${item.value}</td>
            <td>$${item.key.price * item.value}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="total">
    Total Amount: $${totalAmount}
</div>


</body>
</html>
