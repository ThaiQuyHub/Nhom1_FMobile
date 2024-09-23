<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý sản phẩm</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h2>Quản lý sản phẩm</h2>

    <!-- Hiển thị thông báo thành công -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
                ${successMessage}
        </div>
    </c:if>

    <!-- Form thêm mới hoặc cập nhật sản phẩm -->
    <h3><c:choose>
        <c:when test="${isEdit}">Chỉnh sửa sản phẩm</c:when>
        <c:otherwise>Thêm mới sản phẩm</c:otherwise>
    </c:choose></h3>

    <form action="${pageContext.request.contextPath}/admin/product/saveOrUpdate" method="post">
        <input type="hidden" name="product_id" value="${product.product_id}" />

        <div class="form-group">
            <label for="product_name">Tên sản phẩm</label>
            <input type="text" class="form-control" id="product_name" name="product_name" value="${product.product_name}" required />
        </div>

        <div class="form-group">
            <label for="product_price">Giá sản phẩm</label>
            <input type="number" class="form-control" id="product_price" name="product_price" step="0.01" value="${product.product_price}" required />
        </div>

        <div class="form-group">
            <label for="product_quantity">Số lượng</label>
            <input type="number" class="form-control" id="product_quantity" name="product_quantity" value="${product.product_quantity}" required />
        </div>

        <div class="form-group">
            <label for="product_sold">Đã bán</label>
            <input type="number" class="form-control" id="product_sold" name="product_sold" value="${product.product_sold}" />
        </div>

        <div class="form-group">
            <label for="product_color">Màu sắc</label>
            <input type="text" class="form-control" id="product_color" name="product_color" value="${product.product_color}" />
        </div>

        <div class="form-group">
            <label for="product_ram">RAM</label>
            <input type="text" class="form-control" id="product_ram" name="product_ram" value="${product.product_ram}" />
        </div>

        <div class="form-group">
            <label for="product_description">Mô tả sản phẩm</label>
            <textarea class="form-control" id="product_description" name="product_description">${product.product_description}</textarea>
        </div>

        <div class="form-group">
            <label for="brand">Thương hiệu</label>
            <select class="form-control" id="brand" name="brand.brand_id" required>
                <option value="">-- Chọn thương hiệu --</option>
                <c:forEach var="brand" items="${brands}">
                    <option value="${brand.brand_id}" <c:if test="${brand.brand_id == product.brand.brand_id}">selected</c:if>>
                            ${brand.brand_name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="category">Danh mục</label>
            <select class="form-control" id="category" name="category.category_id" required>
                <option value="">-- Chọn danh mục --</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.category_id}"
                            <c:if test="${category.category_id == product.category.category_id}">selected</c:if>>
                            ${category.category_name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="create_day">Ngày khởi tạo</label>
            <input type="date" class="form-control" id="create_day" name="create_day" value="${product.create_day}" />
        </div>

        <div class="form-group">
            <label for="update_day">Ngày cập nhật</label>
            <input type="date" class="form-control" id="update_day" name="update_day" value="${product.update_day}" />
        </div>

        <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
    </form>

    <!-- Bảng danh sách sản phẩm -->
    <h3>Danh sách sản phẩm</h3>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Đã bán</th>
            <th>Màu sắc</th>
            <th>RAM</th>
            <th>Thương hiệu</th>
            <th>Danh mục</th>
            <th>Mô tả</th>
            <th>Ngày khởi tạo</th>
            <th>Ngày cập nhật</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.product_id}</td>
                <td>${product.product_name}</td>
                <td>${product.product_price}</td>
                <td>${product.product_quantity}</td>
                <td>${product.product_sold}</td>
                <td>${product.product_color}</td>
                <td>${product.product_ram}</td>
                <td>${product.brand.brand_name}</td>
                <td>${product.category.category_name}</td>
                <td>${product.product_description}</td>
                <td>${product.create_day}</td>
                <td>${product.update_day}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/product/edit/${product.product_id}" class="btn btn-warning">Chỉnh sửa</a>
                    <a href="${pageContext.request.contextPath}/admin/product/delete/${product.product_id}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
