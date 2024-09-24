package com.group1.fmobile.repository;

import com.group1.fmobile.domain.Orders;
import com.group1.fmobile.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersRepository extends JpaRepository<Orders, Long> {
    List<Orders> findByUser(User user);

    // Tìm tất cả các đơn hàng theo fullname của người dùng
    List<Orders> findAllByUser_Email(String email);

    List<Orders> findAllByUser(User user);


}
