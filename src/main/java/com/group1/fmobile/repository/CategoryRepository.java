package com.group1.fmobile.repository;

import com.group1.fmobile.domain.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<ProductCategory, Long> {

}
