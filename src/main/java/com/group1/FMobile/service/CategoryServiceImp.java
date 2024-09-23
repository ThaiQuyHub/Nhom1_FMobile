package com.group1.fmobile.service;

import com.group1.fmobile.domain.dto.Category;
import com.group1.fmobile.repository.CategoryRepositry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImp implements CategoryService {
    @Autowired
    private CategoryRepositry categoryRepositry;

    @Override
    public List<Category> getAll() {
        return this.categoryRepositry.findAll();
    }

    @Override
    public Category getById(long Id) {
        return this.categoryRepositry.findById(Id).get();
    }

    @Override
    public void saveOrUpdate(Category category) {
        categoryRepositry.save(category);
    }

    @Override
    public void delete(long Id) {
        categoryRepositry.deleteById(Id);
    }
}
