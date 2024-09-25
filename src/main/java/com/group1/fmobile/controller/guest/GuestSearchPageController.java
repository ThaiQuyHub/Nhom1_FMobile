package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.service.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/guest")
public class GuestSearchPageController {
    @Autowired
    public GuestSearchPageController(ProductServices productServices){
        this.productServices = productServices;
    }

    private final ProductServices productServices;

    @GetMapping("/search")
    public String search(@RequestParam("query") String query, Model model) {

        if (query == null || query.trim().isEmpty()) {
            return "guest/searchPage/noDataFound";
        }

        List<Product> results = productServices.searchByQuery(query.trim());

        if (results.isEmpty()) {
            return "guest/searchPage/noDataFound";
        }

        Map<String, Integer> categoryCounts = productServices.countProductsByCategory(results);

        model.addAttribute("query", query);
        model.addAttribute("categoryCounts", categoryCounts);
        model.addAttribute("products", results);
        return productServices.determineViewName(categoryCounts.keySet());
    }

}

