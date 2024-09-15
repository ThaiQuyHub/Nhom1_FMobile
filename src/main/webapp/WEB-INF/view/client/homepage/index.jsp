<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp"/>

<%--NEW MOBILE--%>
<div class="container">
    <header>
        <div class="title">NEW MOBILE</div>
    </header>
    <div class="product newMobile">
        <c:forEach items="${latestProducts}" var="product">
            <div class="item">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="${product.images[0].url}" alt="">
                        </div>
                        <div class="col-md-6 p-4">
                            <h2>${product.productName}</h2>
                            <div class="price">$${product.price}</div>
                            <div class="detail">
                                <p>A18 Pro chip with 6-core GPU</p>
                                <p>RAM: ${product.ram}</p>
                                <p>Camera: 48 MP</p>
                            </div>
                            <div class="row">
                                <button class="buyNow bg-primary">Buy Now</button>
                                <button class="addCart bg-warning">Add To Cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%--BEST-SELLING--%>

<jsp:include page="footer.jsp"/>