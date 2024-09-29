<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    <style>

        /* ///// */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
        }
        .container-product {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            margin: 100px 0;
        }
        .product-image {
            flex: 1;
            min-width: 300px;

        }
        .product-info {
            flex: 1;
            min-width: 300px;
            padding: 0 20px;
            border: 3px solid #FFA500;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .product-title {
            font-size: 24px;
            font-weight: bold;
            background: linear-gradient(90deg, #FB6848, #F99147);
            padding: 20px 10px;
        }
        .rating {
            color: #ffa500;
        }
        .options button {
            margin: 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: #f8f8f8;
            cursor: pointer;
        }
        .price {
            font-size: 24px;

            font-weight: bold;
        }
        .original-price {
            color: #868081;
            text-decoration: line-through;
        }
        .Sale-price {
            color: #e94560;
        }
        .discounted-price {
            color: grey;
        }


        .buy-button {
            background-color: #D0021C;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 10px;
            border-radius: 10px;
        }
    </style>

<jsp:include page="header.jsp"/>

<div style="margin: auto" class="container-product">
    <div data-id="${product.id}" class="item">
        <div class="product-image col-md-9">
            <img src="${product.images[0].url}" alt="" style="max-width: 100%;">
        </div>
        <div class="product-info col-md-9">
            <div class="options">
                <h1 class="product-title" style="margin-bottom: 20px">${product.productName}</h1>
                <h3>Dung lượng: ${product.ram}</h3>
                <h3>Màu sắc: ${product.color}</h3>
                <h3>Quantity: ${product.quantity}</h3>
                <h3>Sold: ${product.sold}</h3>
                <h3><small class="text-muted">Created:
                    <fmt:parseDate value="${product.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}" />
                </small></h3>
            </div>
            <div class="price">
                <h1 style="margin: 20px 0" class="Sale-price">Sale price: ${product.price} $</h1>
                <h2 class="discounted-price">Original price: <del> ${(product.price * 1.15)} $ </del></h2>
            </div>

            <div style="margin-top: 40px" class="row">
                <button style="border-radius: 10px; height: 50px" class="buyNow bg-primary">Buy Now</button>
                <button style="border-radius: 10px; height: 50px" class="addCart bg-warning">Add To Cart</button>
            </div>
        </div>
    <div>
</div>


<jsp:include page="footer.jsp"/>


