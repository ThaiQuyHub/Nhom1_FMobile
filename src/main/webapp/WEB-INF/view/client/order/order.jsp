<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../layout/header.jsp"/>

<%--NEW MOBILE--%>
<div class="container">
    <header>
        <div class="title">MY ORDER</div>
    </header>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Ngày tạo</th>
                <th>Địa chỉ nhận</th>
                <th>Trạng thái</th>
                <th>Tổng tiền</th>
                <th>Giảm giá</th>
                <th>Hình thức thanh toán</th>
                <th>Hủy đơn</th>
                <th>Chi tiết</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${listOrder}" var="iv">
            <tr>
                <td>${iv.id}</td>
                <td>${iv.orderDate}</td>
                <td>${iv.shippingAddress}</td>
                <td>${iv.status}</td>
                <td>${iv.totalPayment}</td>
                <td>${iv.discount==null?'':iv.discount.discountValue}</td>
                <td>${iv.paymentMethod.paymentName}</td>
                <td>
                    <c:if test="${iv.status != 'Canceled'}">
                        <form action="/cancel-order" onsubmit="return huyDon()" method="post">
                            <input type="hidden" name="orderID" value="${iv.id}">
                            <button class="btn btn-primary">Hủy</button>
                        </form>
                    </c:if>
                </td>
                <td><i class="fa fa-eye btneye"></i></td>
            </tr>


        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:forEach var="i" begin="1" end="${totalPage}">
                <li class="page-item"><a class="page-link" href="?page=${i-1}">${i}</a></li>
            </c:forEach>
        </ul>
    </nav>
</div>
<script>
    function huyDon(){
        return confirm("Xác nhận hủy đơn hàng này?");
    }
</script>
<jsp:include page="../layout/footer.jsp"/>
<style>
    .btneye{
        cursor: pointer;
    }
</style>