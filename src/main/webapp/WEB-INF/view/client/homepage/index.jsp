<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="header.jsp"/>
<%--<style>--%>
<%--    .buyNow {--%>
<%--        width: 90px;--%>
<%--        height: 38px;--%>
<%--        line-height: 30px;--%>
<%--        border-radius: 99px;--%>
<%--        margin-top: 50px;--%>
<%--        max-width: 35%;--%>
<%--        font-size: 12px;--%>
<%--    }--%>
<%--</style>--%>
<%--NEW MOBILE--%>
<div class="container">
    <header>
        <div class="title">NEW MOBILE</div>
    </header>
    <div class="product newMobile">
        <c:forEach items="${products}" var="newMobile"> <%-- 'products' trùng với ProductController--%>
            <div data-id = ${newMobile.id} class="item">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6">
                            <a href="${pageContext.request.contextPath}/client/productsDetail/${newMobile.id}"> <!-- Liên kết hình ảnh đến trang chi tiết sản phẩm -->
                                <img src="${newMobile.images[0].url}" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 p-4">
                            <h2>${newMobile.productName}</h2>
                            <div class="price">$${newMobile.price}</div>
                            <div class="detail">
                                <p>Color: ${newMobile.color}</p>
                                <p>RAM: ${newMobile.ram}</p>
                            </div>
                            <div class="row">
<%--                                <a href="${pageContext.request.contextPath}/client/checkout/${newMobile.id}"--%>
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

<%--BEST-SELLER--%>
<div class="container">
    <header>
        <div class="title">BEST-SELLER</div>
    </header>
    <div class="listProduct">
        <c:forEach items="${bestSellingProducts}" var="bestSellingMobile">
            <div data-id = ${bestSellingMobile.id} class="item">
                <a href="${pageContext.request.contextPath}/client/productsDetail/${bestSellingMobile.id}"> <%-- click vào sản phẩm chi tiết--%>
                    <img src="${bestSellingMobile.images[0].url}" alt="">
                </a>
                <h2>${bestSellingMobile.productName}</h2>
                <div class="price">$${bestSellingMobile.price}</div>
                <div class="detail">
                    <p>Color: ${bestSellingMobile.color}</p>
                    <p>RAM: ${bestSellingMobile.ram}</p>
                </div>
                <div class="row">
                    <button href="#" class="buyNow bg-primary">Buy Now</button>
                    <button class="addCart bg-warning">Add To Cart</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%--TABLET--%>
<div class="container">
    <header>
        <div class="title">TABLET</div>
    </header>
    <div class="product tablet">
        <c:forEach items="${tabletProducts}" var="tablet">
            <div data-id= ${tablet.id} class="item">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6">
                            <a href="${pageContext.request.contextPath}/client/productsDetail/${tablet.id}"> <%-- click vào sản phẩm chi tiết--%>
                                <img src="${tablet.images[0].url}" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 p-4">
                            <h2>${tablet.productName}</h2>
                            <div class="price">$${tablet.price}</div>
                            <div class="detail">
                                <p>Color: ${tablet.color}</p>
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


<jsp:include page="footer.jsp"/>

