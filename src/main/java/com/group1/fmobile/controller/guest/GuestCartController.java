//package com.group1.fmobile.controller.guest;
//
//import com.group1.fmobile.domain.Product;
//import com.group1.fmobile.service.ProductServices;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import java.util.HashMap;
//
//@Controller
//public class GuestCartController {
//    @Autowired
//    public GuestCartController(ProductServices productServices){
//        this.productServices = productServices;
//    }
//
//    private final ProductServices productServices;
//
//    @PostMapping("/checkout")
//    public String checkout(HttpSession session, @RequestParam("productId[]") String[] productIds,
//                           @RequestParam("productQuantity[]") String[] quantities,
//                           @RequestParam("totalAmount") String total) {
//        HashMap<Product, Long> cartProducts = new HashMap<Product, Long>();
//        Double totalAmount = Double.parseDouble(total);
//        for (int i = 0; i < productIds.length; i++) {
//            Long id = Long.parseLong(productIds[i]);
//            Long quantity = Long.parseLong(quantities[i]);
//            Product product = productServices.getProductById(id);
//            if (product != null) {
//                cartProducts.put(product, quantity);
//            }
//        }
//        session.setAttribute("cartProducts", cartProducts);
//        session.setAttribute("totalAmount", totalAmount);
//        return "redirect:/checkout";
//    }
//}
