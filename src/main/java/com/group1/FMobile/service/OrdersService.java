package com.group1.FMobile.service;

import com.group1.FMobile.domain.Orders;
import com.group1.FMobile.domain.dto.DailyRevenueDTO;
import com.group1.FMobile.repository.OrdersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrdersService {
    private final OrdersRepository ordersRepository;

    @Autowired
    public OrdersService(OrdersRepository ordersRepository) {
        this.ordersRepository = ordersRepository;
    }

    public List<Orders> getAllOrder() {
        return this.ordersRepository.findAll();
    }


    public Page<Orders> findOrdersByStatus(String search, Pageable pageable) {
        if (search == null || search.isEmpty()) {
            return ordersRepository.findAll(pageable);
        } else {
            return ordersRepository.searchOrder(search, pageable);
        }
    }

    public Long countTotalOrder() {
        return this.ordersRepository.countTotalOrder();
    }

    public Double countTotalRevenue() {
        return this.ordersRepository.countTotalRevenue();
    }

    public List<DailyRevenueDTO> getRevenueInRange(LocalDate startDate, LocalDate endDate) {
        return ordersRepository.findRevenueInRange(startDate, endDate);
    }
}
