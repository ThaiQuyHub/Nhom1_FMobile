package com.group1.fmobile.service;

import com.group1.fmobile.domain.Image;
import com.group1.fmobile.domain.ProductCategory;
import com.group1.fmobile.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImp implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<ProductCategory> getAll() {
        return this.categoryRepository.findAll();
    }

    @Override
    public ProductCategory getById(long Id) {
        return this.categoryRepository.findById(Id).get();
    }

    @Override
    public void saveOrUpdate(ProductCategory category) {
        categoryRepository.save(category);
    }

    @Override
    public void delete(long Id) {
        categoryRepository.deleteById(Id);
    }
}
