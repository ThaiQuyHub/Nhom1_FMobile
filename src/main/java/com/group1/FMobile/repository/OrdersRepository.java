package com.group1.FMobile.repository;

import com.group1.FMobile.domain.Orders;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OrdersRepository extends JpaRepository<Orders, Long> {
    // Tìm kiếm theo trạng thái với phân trang
    @Query("SELECT o FROM Orders o WHERE o.status LIKE %:search%")
    Page<Orders> searchOrder(@Param("search") String search, Pageable pageable);

    @Override
    Page<Orders> findAll(Pageable pageable);

    // Đếm tổng số lượng đơn hàng của cả hệ thông
    @Query("SELECT COUNT(o) FROM Orders o")
    Long countTotalOrder();

    // Đếm tổng doanh thu
    @Query("SELECT SUM(o.totalPayment) FROM Orders o")
    Double countTotalRevenue();
}
