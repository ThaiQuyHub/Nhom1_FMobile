package com.group1.fmobile.controller.client;

import com.group1.fmobile.domain.Product;
import com.group1.fmobile.service.ProductService;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String listProducts(Model model) {
        List<Product> products = productService.getTop4SmartPhones(); // Lấy top 4 sản phẩm
        model.addAttribute("products", products); // Truyền danh sách sản phẩm sang trang JSP

        List<Product> bestSellingProducts = productService.getTop4BestSellingProducts(); // Top 4 best Selling
        model.addAttribute("bestSellingProducts", bestSellingProducts);

        List<Product> tabletProducts = productService.getTabletProducts(4);
        model.addAttribute("tabletProducts", tabletProducts);

        return "client/homepage/index";
    }

    @GetMapping("/all-products")
    public String allProducts(Model model){
        List<Product> allProducts = productService.getAllProducts();
        model.addAttribute("allProducts", allProducts);

        return "client/homepage/allProducts";
    }

    @GetMapping("/search")
    public String search(@RequestParam("name") String name, //"searchName" trùng trong header.jsp
                         @RequestParam(value = "page", defaultValue = "1") int page,
                         @RequestParam(value = "size", defaultValue = "6") int pageSize,
                         Model model) {
        Page<Product> products = productService.search(name, page, pageSize);
        model.addAttribute("allProducts", products.getContent()); //'products' phai trung với index.jsp

        // Gửi thông tin phân trang tới view
        model.addAttribute("currentPage", products.getNumber()+1);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("searchQuery", name);

        return "client/homepage/allProducts";
    }
}
