<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Hình Ảnh</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Quản lý Hình Ảnh</h1>

    <!-- Thông báo thành công -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success" role="alert">
                ${successMessage}
        </div>
    </c:if>

    <!-- Form thêm mới hoặc chỉnh sửa hình ảnh -->
    <div class="card mb-4">
        <div class="card-header">
            <c:choose>
                <c:when test="${isEdit}">
                    <h5>Cập nhật Hình Ảnh</h5>
                </c:when>
                <c:otherwise>
                    <h5>Thêm mới Hình Ảnh</h5>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="card-body">
            <form:form action="${pageContext.request.contextPath}/admin/image/saveOrUpdate" method="post" modelAttribute="image" enctype="multipart/form-data">
                <input type="hidden" name="image_id" value="${image.image_id}" />

                <!-- Chọn Sản phẩm -->
                <div class="form-group">
                    <label for="product">Chọn Sản phẩm:</label>
                    <select class="form-control" id="product" name="product.product_id" required>
                        <option value="">-- Chọn sản phẩm --</option>
                        <c:forEach var="product" items="${products}">
                            <option value="${product.product_id}"
                                    <c:if test="${product.product_id == image.product.product_id}">selected</c:if>>
                                    ${product.product_name}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Tên Hình Ảnh -->
                <div class="form-group">
                    <label for="image_name">Tên Hình Ảnh:</label>
                    <form:input path="image_name" class="form-control" placeholder="Nhập tên hình ảnh" />
                </div>

                <!-- Chọn Hình Ảnh -->
                <div class="form-group">
                    <label for="image_data">Chọn Hình Ảnh:</label>
                    <input type="file" class="form-control" id="image_data" name="image_data" required />
                </div>

                <!-- Nút Thêm/Cập nhật -->
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${isEdit}">
                            Cập nhật Hình Ảnh
                        </c:when>
                        <c:otherwise>
                            Thêm mới Hình Ảnh
                        </c:otherwise>
                    </c:choose>
                </button>
            </form:form>
        </div>
    </div>

    <!-- Danh sách Hình Ảnh -->
    <h2>Danh sách Hình Ảnh</h2>
    <table class="table table-hover table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Sản phẩm</th>
            <th>Tên Hình Ảnh</th>
            <th>Hình Ảnh</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="img" items="${images}">
            <tr>
                <td>${img.image_id}</td>
                <td>${img.product.product_name}</td>
                <td>${img.image_name}</td>
                <td>
                    <!-- Hiển thị ảnh thu nhỏ -->
                    <c:choose>
                        <c:when test="${not empty img.image_url}">
                            <img src="${pageContext.request.contextPath}${img.image_url}" alt="${img.image_name}" class="img-thumbnail" width="100" height="100"/>
                        </c:when>
                        <c:otherwise>
                            <span>Chưa có hình ảnh</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <!-- Nút Sửa -->
                    <a href="${pageContext.request.contextPath}/admin/image/edit/${img.image_id}" class="btn btn-warning btn-sm">
                        Sửa
                    </a>
                    <!-- Nút Xóa -->
                    <a href="${pageContext.request.contextPath}/admin/image/delete/${img.image_id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa hình ảnh này không?');">
                        Xóa
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS và các phụ thuộc -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
