package com.group1.fmobile.service;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.repository.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Predicate;

@Service
public class ProductServices {

    @Autowired
    public ProductServices(ProductRepository productRepository){
        this.productRepository = productRepository;
    }
    private final ProductRepository productRepository;

    public Product getProductById(Long id){
        return productRepository.findById(id).orElse(null);
    }
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

    public List<Product> searchByQuery(String query) {
        return productRepository.findProductsByQuery(query);
    }

    public Map<String, Integer> countProductsByCategory(List<Product> products) {
        Map<String, Integer> categoryCounts = new HashMap<>();
        for (Product product : products) {
            String categoryName = product.getProductCategory().getCategoryName().toLowerCase();
            categoryCounts.merge(categoryName, 1, Integer::sum);
        }
        return categoryCounts;
    }

    public String determineViewName(Set<String> categories) {
        if (categories.size() != 1) {
            return "guest/searchPage/allProduct";
        }

        String category = categories.iterator().next().toLowerCase();
        switch (category) {
            case "mobile":
                return "guest/searchPage/mobile";
            case "laptop":
                return "guest/searchPage/laptop";
            case "tablet":
                return "guest/searchPage/tablet";
            case "accessories":
                return "guest/searchPage/accessories";
            default:
                return "guest/searchPage/allProduct";
        }
    }

    public List<Product> filterProduct(List<String> brands, double minPrice, double maxPrice, List<String> rams){
        return productRepository.findProductsByMultipleCriteria(brands, minPrice, maxPrice, rams);
    }
}
