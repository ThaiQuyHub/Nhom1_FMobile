package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.service.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class GuestFilterController {
    @Autowired
    public GuestFilterController(ProductServices productServices) {
        this.productServices = productServices;
    }

    private final ProductServices productServices;

    @GetMapping("/filter")
    public String filterProducts(
            @RequestParam(value = "brands", required = false) String brands,
            @RequestParam(value = "rams", required = false) String rams,
            @RequestParam(value = "minPrice", required = false) String minPriceStr,
            @RequestParam(value = "maxPrice", required = false) String maxPriceStr,
            Model model) {

        List<Product> listProducts = productServices.filterProduct(brands, minPriceStr, maxPriceStr, rams);

        List<Product> listMobileProducts = new ArrayList<>();
        if (listProducts != null) {
            for (Product product : listProducts) {
                if (product.getProductCategory().getId() == 1) {
                    listMobileProducts.add(product);
                }

            }
        }
        model.addAttribute("products", listMobileProducts);
        return "guest/searchPage/fragments/productList";
    }
}
