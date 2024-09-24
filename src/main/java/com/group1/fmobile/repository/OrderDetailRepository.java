package com.group1.fmobile.repository;

import com.group1.fmobile.domain.OrdersDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrdersDetail, Long> {
}
