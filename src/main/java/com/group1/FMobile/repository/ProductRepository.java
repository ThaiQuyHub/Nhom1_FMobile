package com.group1.fmobile.repository;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.domain.ProductCategory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Lấy 4 sản phẩm mới nhất dựa trên product_category_id
    List<Product> findTop4ByProductCategoryIdOrderByCreatedProductDesc(Long productCategoryId);

    // Lấy 4 sản phẩm bán chạy nhất
    List<Product> findTop4ByOrderBySoldDesc();

    // Lấy 4 table bán chạy nhất
    @Query("SELECT p FROM Product p WHERE p.productCategory.id = 3 ORDER BY p.price DESC")
    List<Product> findAllTabletByOrderByPriceDesc(Pageable pageable);

    //Search sản phẩm
    @Query("FROM Product p WHERE p.productName LIKE CONCAT('%', :name, '%') OR p.color LIKE CONCAT('%', :name, '%') OR p.ram LIKE CONCAT('%', :name, '%')")
    Page<Product> searchProducts(@Param("name") String name, Pageable pageable);

    // Đếm số lượng sản phẩm kết quả theo điều kiện tìm kiếm
    @Query("SELECT COUNT(p) FROM Product p WHERE p.productName LIKE %:name% OR p.color LIKE %:name% OR p.ram LIKE %:name%")
    long countSearchResults(@Param("name") String name);

    //Lọc sản phẩm
    @Query("SELECT p FROM Product p WHERE " +
            "(:brands IS NULL OR p.brand.brandName IN :brands) " +
            "AND (:minPrice IS NULL OR p.price >= :minPrice) " +
            "AND (:maxPrice IS NULL OR p.price <= :maxPrice) " +
            "AND (:rams IS NULL OR p.ram IN :rams) " +
            "AND (:color IS NULL OR p.color = :color) " +
            "AND (:searchQuery IS NULL OR LOWER(p.productName) LIKE LOWER(CONCAT('%', :searchQuery, '%')))")
    Page<Product> filterProducts(
            @Param("brands") List<String> brands,
            @Param("minPrice") Double minPrice,
            @Param("maxPrice") Double maxPrice,
            @Param("rams") List<String> rams,
            @Param("color") String color,
            @Param("searchQuery") String searchQuery,
            Pageable pageable);
}






//Tạo ProductRepository để lưu và truy vấn dữ liệu từ cơ sở dữ liệu
