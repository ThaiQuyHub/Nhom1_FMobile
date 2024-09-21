<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16/09/2024
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="searchHeader.jsp" />
<div class="container">
    <div class="row">
        <div class="col-3">
            <div class="filter-container">
                <form id="searchForm" action="/filter" method="get">
                    <div class="row">
                        <label>BRAND</label>
                        <div class="row brand-container">
                            <c:forEach items="${['apple', 'samsung', 'oppo', 'xiaomi', 'vivo', 'realme', 'huawei']}" var="brand">
                                <div class="col-4">
                                    <button type="radio" class="brand-checkbox" name="brand" value="${brand}" onclick="onsubmit()">
                                    <img src="images/product/${brand}.png" alt="${brand}">
                                    </button>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="row">
                        <label>Price</label>
                        <div class="row price-container">
                            <div class="col-6">
                                <button type="button" class="price-button" data-min="0" data-max="200$">Under 200$</button>
                            </div>
                            <div class="col-6">
                                <button type="button" class="price-button" data-min="200" data-max="400$">From 200 - 400$</button>
                            </div>
                            <div class="col-6">
                                <button type="button" class="price-button" data-min="400" data-max="700">From 200 - 700$</button>
                            </div>
                            <div class="col-6">
                                <button type="button" class="price-button" data-min="700" data-max="1000">From 700 - 1000$</button>
                            </div>
                            <div class="col-6">
                                <button type="button" class="price-button" data-min="1000" data-max="9999999">Above 1000</button>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <label>RAM</label>
                        <div class="row ram-container">
                            <c:forEach items="${['4GB', '6GB', '8GB', '12GB', '16GB', '18GB', '32GB', '64GB']}" var="ram">
                                <div class="col-4">
                                    <label>
                                        <input type="checkbox" class="ram-checkbox" value="${ram}">
                                        <span>${ram}</span>
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <input type="hidden" id="selectedBrands" name="selectedBrands">
                    <input type="hidden" id="selectedMinPrice" name="selectedMinPrice">
                    <input type="hidden" id="selectedMaxPrice" name="selectedMaxPrice">
                    <input type="hidden" id="selectedRams" name="selectedRams">
                </form>
            </div>
        </div>
        <div class="col-9">
            <div class="container">
                <header>
                    <div class="title">Kết quả tìm kiếm: ${products.size()} result </div>
                </header>
                <div class="listProduct searchResults">
                    <c:forEach items="${products}" var="product">
                        <div data-id="${product.id}" class="item">
                            <img src="${product.images[0].url}" alt="${product.productName}">
                            <h2>${product.productName}</h2>
                            <div class="price">$${product.price}</div>
                            <div class="detail">
                                <p>Danh mục: ${product.productCategory.categoryName}</p>
                                <p>RAM: ${product.ram}</p>
                                <c:if test="${not empty product.color}">
                                    <p>Màu sắc: ${product.color}</p>
                                </c:if>
                            </div>
                            <div class="row">
                                <button class="buyNow bg-primary">Mua ngay</button>
                                <button class="addCart bg-warning">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('searchForm');
        const brandButton = document.querySelectorAll('.brand-button');
        const priceButtons = document.querySelectorAll('.price-button');
        const ramButtons = document.querySelectorAll('.ram-button');

        const selectedBrands = new Set();
        const selectedRams = new Set();
        let selectedMinPrice = null;
        let selectedMaxPrice = null;

        function updateHiddenInputs() {
            document.getElementById('selectedBrands').value = Array.from(selectedBrands).join(',');
            document.getElementById('selectedMinPrice').value = selectedMinPrice;
            document.getElementById('selectedMaxPrice').value = selectedMaxPrice;
            document.getElementById('selectedRams').value = Array.from(selectedRams).join(',');
        }

        brandButton.addEventListener('click', function (){

        }

        // Thêm sự kiện change cho các checkbox của brand
        brandCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                    selectedBrands.add(this.value);
                } else {
                    selectedBrands.delete(this.value);
                }
                updateHiddenInputs();
                form.submit(); // Tự động submit form khi thay đổi trạng thái của checkbox
            });
        });

        priceButtons.forEach(button => {
            button.addEventListener('click', function() {
                selectedMinPrice = this.dataset.min;
                selectedMaxPrice = this.dataset.max;
                priceButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
                updateHiddenInputs();
            });
        });

        ramButtons.forEach(button => {
            button.addEventListener('click', function() {
                const ram = this.dataset.ram;
                if (selectedRams.has(ram)) {
                    selectedRams.delete(ram);
                    this.classList.remove('active');
                } else {
                    selectedRams.add(ram);
                    this.classList.add('active');
                }
                updateHiddenInputs();
            });
        });

        form.addEventListener('submit', function(e) {
            e.preventDefault();
            updateHiddenInputs();
            this.submit();
        });
    });


</script>

<%--<jsp:include page="searchFooter.jsp" />--%>
