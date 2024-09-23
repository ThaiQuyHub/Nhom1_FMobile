package com.group1.fmobile.service;

import com.group1.fmobile.domain.dto.Brand;
import com.group1.fmobile.domain.dto.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getAll();
    Category getById(long Id);
    void saveOrUpdate(Category category);
    void delete(long Id);
}
