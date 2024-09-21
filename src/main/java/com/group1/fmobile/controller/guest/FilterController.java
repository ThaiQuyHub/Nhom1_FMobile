package com.group1.fmobile.controller.guest;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.service.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
@Controller
public class FilterController {
    @Autowired
    public FilterController(ProductServices productServices){
        this.productServices = productServices;
    }

    private final ProductServices productServices;
    @GetMapping("/filter")
    public String filterProducts(Model model,
                                 @RequestParam(name ="selectedBrands", required = false) List<String> brands,
                                 @RequestParam(required = false) String minPrice,
                                 @RequestParam(required = false) String maxPrice,
                                 @RequestParam(required = false) List<String> rams) {
        double minPriceValue;
        double maxPriceValue;
        if(minPrice != null){
            minPriceValue = Double.parseDouble(minPrice);
            }
        else{
            minPriceValue = 0 ;
        }
        if(maxPrice != null){
            maxPriceValue = Double.parseDouble(maxPrice);
        }
        else{
            maxPriceValue = Double.MAX_VALUE ;
        }

            List<Product> listProducts = productServices.filterProduct(brands,minPriceValue, maxPriceValue, rams);
            List<Product> listMobileProducts = new ArrayList<>();
        for (Product mobile: listProducts) {
            if(mobile.getProductCategory().getId() == 1){
                listMobileProducts.add(mobile);
            }
        }
        model.addAttribute("products", listMobileProducts);
        return "guest/searchPage/mobile";
    }
}
