package com.group1.fmobile.service;

import com.group1.fmobile.domain.Product;

import java.util.List;

public interface IProductService {

    public List<Product> getAll();

    public Product getById(long Id);

    public void saveOrUpdate(Product product);

    public void delete(long Id);
}
