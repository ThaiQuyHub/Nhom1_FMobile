package com.group1.fmobile.service;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImp implements IProductService{
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getAll() {
        return this.productRepository.findAll();
    }

    @Override
    public Product getById(long Id) {
        return this.productRepository.findById(Id).get();
    }

    @Override
    public void saveOrUpdate(Product product) {
        productRepository.save(product);
    }

    @Override
    public void delete(long Id) {
        productRepository.deleteById(Id);
    }
}
