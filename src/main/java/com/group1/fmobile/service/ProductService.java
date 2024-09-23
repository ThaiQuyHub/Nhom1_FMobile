package com.group1.fmobile.service;

import com.group1.fmobile.domain.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAll();
    Product getById(long Id);
    void saveOrUpdate(Product product);
    void delete(long Id);
}
