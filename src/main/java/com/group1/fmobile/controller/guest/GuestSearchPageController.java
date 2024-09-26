package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.service.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
    public String search(@RequestParam("query") String query,
                         @RequestParam(defaultValue  = "0") int page,
                         Model model) {
    int size = 4;
        if (query == null || query.trim().isEmpty()) {
            return "guest/searchPage/noDataFound";
        }
        String category = query.toLowerCase();
        Page<Product> productPage;
        switch (category) {
            case "mobile":
            case "laptop":
            case "tablet":
            case "accessories":
                productPage = productServices.findByCategory(category, page, size);
                model.addAttribute("products", productPage.getContent());
                model.addAttribute("currentPage", productPage.getNumber());
                model.addAttribute("totalPages", productPage.getTotalPages());
                return "guest/searchPage/" + category;
            default:
                break;
        }

        List<Product> results = productServices.searchByQuery(query.trim());

        if (results.isEmpty()) {
            return "guest/searchPage/noDataFound";
        }
        model.addAttribute("products", results);
        return "guest/searchPage/allProducts";

    }

}

