package com.group1.fmobile.repository;

import com.group1.fmobile.domain.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @Override
    Optional<Product> findById(Long id);

    @Query("SELECT p FROM Product p WHERE p.productCategory.id = 1 ORDER BY p.createdAt DESC")
    List<Product> findAllMobileByOrderByCreatedAtDesc(Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.productCategory.id = 1 ORDER BY p.sold DESC")
    List<Product> findAllMobileByOrderBySoldDesc(Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.productCategory.id = 3 ORDER BY p.price DESC")
    List<Product> findAllTabletByOrderByPriceDesc(Pageable pageable);

    @Query("SELECT DISTINCT p FROM Product p " +
            "LEFT JOIN p.productCategory c " +
            "LEFT JOIN p.brand b " +
            "WHERE LOWER(p.productName) LIKE LOWER(CONCAT('%', :query, '%')) " +
            "OR LOWER(c.categoryName) LIKE LOWER(CONCAT('%', :query, '%')) " +
            "OR LOWER(b.brandName) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<Product> findProductsByQuery(@Param("query") String query);

}
