<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Thương hiệu</title>
</head>
<body>

<!-- Hiển thị thông báo thành công -->
<c:if test="${not empty successMessage}">
    <div style="color: green;">${successMessage}</div>
</c:if>

<!-- Form thêm mới/cập nhật thương hiệu -->
<h2>
    <c:choose>
        <c:when test="${isEdit}">
            Cập nhật danh mục
        </c:when>
        <c:otherwise>
            Thêm mới danh mục
        </c:otherwise>
    </c:choose>
</h2>

<form action="/admin/category/saveOrUpdate" method="post">
    <!-- Hidden field để lưu brand_id khi cập nhật -->
    <input type="hidden" name="category_id" value="${category.category_id}" />
    <!-- Nhập tên thương hiệu -->
    <label for="category_name">Tên danh muc:</label>
    <input type="text" id="category_name" name="category_name" value="${category.category_name}" required>

    <!-- Nhập mô tả thương hiệu -->
    <label for="category_description">Mô tả:</label>
    <textarea id="category_description" name="category_description" required>${category.category_description}</textarea>

    <!-- Nút gửi form (thêm mới hoặc cập nhật) -->
    <button type="submit" id="submit-button" class="btn btn-primary">
        <c:choose>
            <c:when test="${isEdit}">
                Cập nhật
            </c:when>
            <c:otherwise>
                Thêm mới
            </c:otherwise>
        </c:choose>
    </button>
</form>

<hr/>

<!-- Danh sách các thương hiệu đã có -->
<h2>Danh sách Thương hiệu</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên danh muc</th>
        <th>Mô tả</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${categories}">
        <tr>
            <td>${c.category_id}</td>
            <td>${c.category_name}</td>
            <td>${c.category_description}</td>
            <td>
                <a href="/admin/category/edit/${c.category_id}">Sửa</a> |
                <a href="/admin/category/delete/${c.category_id}" onclick="return confirm('Bạn có chắc chắn muốn xóa thương hiệu này không?');">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
