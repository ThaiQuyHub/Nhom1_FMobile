package com.group1.fmobile.service;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.repository.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServices {

    @Autowired
    public ProductServices(ProductRepository productRepository){
        this.productRepository = productRepository;
    }
    private final ProductRepository productRepository;

    public List<Product> getNewestMobileProducts(int limit) {
        Pageable pageable = PageRequest.of(0, limit);
        return productRepository.findAllMobileByOrderByCreatedAtDesc(pageable);
    }

    public List<Product> getBestSellingMobileProducts(int limit) {
        Pageable pageable = PageRequest.of(0, limit);
        return productRepository.findAllMobileByOrderBySoldDesc(pageable);
    }

    public List<Product> getTabletProducts(int limit){
        Pageable pageable = PageRequest.of(0, limit);
        return productRepository.findAllTabletByOrderByPriceDesc(pageable);
    }


}
