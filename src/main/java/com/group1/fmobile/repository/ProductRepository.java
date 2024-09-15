package com.group1.fmobile.repository;

import com.group1.fmobile.domain.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductRepository extends JpaRepository <Product, Long> {
    @Query("SELECT p FROM Product p WHERE p.productCategory.id = 1 ORDER BY p.createdAt DESC")
    List<Product> findAllMobileByOrderByCreatedAtDesc(Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.productCategory.id = 1 ORDER BY p.sold DESC")
    List<Product> findAllMobileByOrderBySoldDesc(Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.productCategory.id = 3 ORDER BY p.price DESC")
    List<Product> findAllTabletByOrderByPriceDesc(Pageable pageable);
}
