package com.group1.fmobile.repository;

import com.group1.fmobile.domain.dto.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepositry extends JpaRepository<Category, Long> {
}
